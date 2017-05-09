//
//  BJRoomViewController.m
//  BJLiveCore
//
//  Created by MingLQ on 2016-12-18.
//  Copyright © 2016 Baijia Cloud. All rights reserved.
//

#import <M9Dev/M9Dev.h>
#import "BJRoomViewController.h"
#import "BJRoomViewController+media.h"
#import "BJRoomViewController+users.h"

static CGFloat const margin = 10.0;
static CGFloat const barHeight = 40.0;
static CGFloat const buttonWidth = 64.0;

@interface BJRoomViewController ()

@property (nonatomic) UIView *chatBarGroupView;
@property (nonatomic) UIButton *doneButton;
//@property (nonatomic) UIButton *backButton;
@property (nonatomic) UITextField *textField;
@property (nonatomic) UIView *dashboardGroupView;
@property (nonatomic) UIButton *consoleSmallScreenButton, *teachFullScreenButton;   // 输入按钮 下来按钮
@property (nonatomic) BOOL hidenStatus;
@end

@implementation BJRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UICOLOR_FROM_HEX(0xF2F4F5);
    
    // 设置采集、播放、白板的区域
    [self makeDashboard];
    
    // 顶部view中发送消息和返回的事件
    [self makeEvents];
    
    // 设置view的旋转
    // 这样做有问题 当点击播放或者采集的时候 ActionSheet弹出时会出问题
    // 这样视频的旋转有问题 还有WEB上面的视频也是有问题的(旋转了90°)
//    [self makeViewTransform];
    
    _hidenStatus = YES;
    [self prefersStatusBarHidden];
}

// 设置self.view的旋转
- (void)makeViewTransform
{
    self.view.transform = CGAffineTransformMakeRotation(M_PI/2);
//    self.recordingView.transform = CGAffineTransformMakeRotation(M_PI/2*3);
}
// self.view旋转后状态栏还在显示 不好看
- (BOOL)prefersStatusBarHidden
{
    if (_hidenStatus) {
        return YES;
    } else {
        return NO;
    }
}

- (void)dealloc {
    // 控制器销毁时，取消所有的延迟操作，不然可能会造成内厝泄漏
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

// 进入房间后调用的方法
- (void)enterRoomWithSecret:(NSString *)roomSecret
                   userName:(NSString *)userName {
    
    self.room = [BJLRoom roomWithSecret:roomSecret
                               userName:userName
                             userAvatar:nil];
    
    weakdef(self);
    // 监听进入教室的事件
    [self bjl_observe:BJLMakeMethod(self.room, enterRoomSuccess)
             observer:^BOOL(id data) {
                 strongdef(self);
                 if (self.room.loginUser.isTeacher) {        // 老师
                     [self.room.roomVM sendLiveStarted:YES]; // 上课(通知学生上课)
                 }
                 [self didEnterRoom];
                 return YES;
             }];
    
    [self bjl_observe:BJLMakeMethod(self.room, roomWillExitWithError:)
             observer:^BOOL(BJLError *error) {
                 strongdef(self);
                 if (self.room.loginUser.isTeacher) {       // 老师
                     [self.room.roomVM sendLiveStarted:NO]; // 下课(通知学生下课)
                 }
                 return YES;
             }];
    
    
    // 已经退出教室
    [self bjl_observe:BJLMakeMethod(self.room, roomDidExitWithError:)
             observer:^BOOL(BJLError *error) {
                 strongdef(self);
                 
                 // 退出教室成功
                 if (!error) {
                     [self goBack];
                     return YES;
                 }
                 
                 // 退出教室失败
                 NSString *message = error ? [NSString stringWithFormat:@"%@ - %@",
                                              error.localizedDescription,
                                              error.localizedFailureReason] : @"错误";
                 UIAlertController *alert = [UIAlertController
                                             alertControllerWithTitle:@"错误"
                                             message:message
                                             preferredStyle:UIAlertControllerStyleAlert];
                 [alert addAction:[UIAlertAction
                                   actionWithTitle:@"退出"
                                   style:UIAlertActionStyleDestructive
                                   handler:^(UIAlertAction * _Nonnull action) {
                                       [self goBack];
                                   }]];
                 [alert addAction:[UIAlertAction
                                   actionWithTitle:@"知道了"
                                   style:UIAlertActionStyleCancel
                                   handler:nil]];
                 [self presentViewController:alert animated:YES completion:nil];
                 
                 return YES;
             }];
    
    // 进入房间的进度
    [self bjl_kvo:BJLMakeProperty(self.room, loadingVM)
                       filter:^BOOL(id old, id now) {
                           // strongdef(self);
                           return !!now;
                       }
                     observer:^BOOL(id old, BJLLoadingVM *now) {
                         strongdef(self);
                         
                         // 建立房间(显示加载进度)--重新连接的时候会再次调用该方法
                         [self makeEventsForLoadingVM:now];
                         return YES;
                     }];
    
    // 重新连接的block (断网的时候弹框提示)
    [self.room setReloadingBlock:^(BJLLoadingVM * _Nonnull reloadingVM, void (^ _Nonnull callback)(BOOL)) {
        @strongify(self);
        [self.console printLine:@"网络连接断开"];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"网络连接断开"
                                                                       message:@"重连 或 退出？"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction
                          actionWithTitle:@"重连"
                          style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * _Nonnull action) {
                              
                              [self.console printLine:@"网络连接断开，正在重连 ..."];
                              
                              // 重新连接 重新连接房间
                              [self makeEventsForLoadingVM:reloadingVM];
                              
                              [self.console printLine:@"网络连接断开：重连"];
                              
                              callback(YES);
                          }]];
        [alert addAction:[UIAlertAction
                          actionWithTitle:@"退出"
                          style:UIAlertActionStyleDestructive
                          handler:^(UIAlertAction * _Nonnull action) {
                              [self.console printLine:@"网络连接断开：退出"];
                              callback(NO);
                          }]];
        [self presentViewController:alert animated:YES completion:nil];
    }];
    
    [self.room enter];
}

#pragma mark - subviews
// 配置顶部的view(发送消息)
- (void)makeChatBar {
    self.chatBarGroupView = ({
        UIView *view = [UIView new];
        view.clipsToBounds = YES;
        view;
    });
    [self.view addSubview:self.chatBarGroupView];
    [self.chatBarGroupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.recordingView);
        make.right.equalTo(self.recordingView).offset(buttonWidth+margin);
        make.bottom.equalTo(self.dashboardGroupView.mas_bottom);
        make.height.equalTo(@(barHeight));
    }];
    
    
    
//    UIImage *backImage = [UIImage imageNamed:@"back-dark"];
//    self.backButton = ({
//        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, backImage.size.width, backImage.size.height)];
//        button.tintColor = [UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil].tintColor;
//        [button setImage:backImage forState:UIControlStateNormal];
//        button;
//    });
//    
//    [self.chatBarGroupView addSubview:self.backButton];
    
    self.textField = ({
        UITextField *textField = [UITextField new];
        textField.backgroundColor = [UIColor whiteColor];
        textField.layer.cornerRadius = 2.0;
        textField.layer.masksToBounds = YES;
        textField.returnKeyType = UIReturnKeySend;
        textField.delegate = self;
        textField.placeholder = @"请输入消息..";
        textField;
    });
    [self.chatBarGroupView addSubview:self.textField];
    
    self.doneButton = ({
        UIButton *button = [UIButton new];
        button.backgroundColor = UICOLOR_FROM_HEX(0x1694FF);
        button.layer.cornerRadius = 2.0;
        button.layer.masksToBounds = YES;
        button.titleLabel.font = [UIFont systemFontOfSize:16.0];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateDisabled];
        [button setTitle:@"发送" forState:UIControlStateNormal];
        button;
    });
    [self.chatBarGroupView addSubview:self.doneButton];
    
//    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.chatBarGroupView).offset(margin);
//        make.top.bottom.equalTo(self.chatBarGroupView);
//        make.width.equalTo(self.backButton.mas_height);
//    }];
    
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.chatBarGroupView).offset(- margin);
        make.width.equalTo(@(buttonWidth));
        make.top.bottom.equalTo(self.chatBarGroupView);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.chatBarGroupView.mas_left).offset(margin);
        make.right.equalTo(self.doneButton.mas_left).offset(- margin);
        make.top.bottom.equalTo(self.chatBarGroupView);
    }];
    
    self.chatBarGroupView.backgroundColor = [UIColor orangeColor];
}

- (void)layoutOriginChatBarGroupView
{
    
}

// 对采集、播放、白板、聊天
- (void)makeDashboard {
    
    // 初始化->布局所有子控件的父view                       父view
    [self initAndLayouDashboardGroupView];
    
    // 初始化playingView->布局   老师视频                 老师播放
    [self initPlayingView];
    [self layoutOriginPlayingView];
    
    // 初始化teachFullScreenButton->布局                 老师全屏按钮
    [self initTeachFullScreenButton];
    [self layoutTeachFullScreenButton];
    
    // 初始化recordingView->布局                         学生录屏
    [self initRecordingView];
    [self layoutOriginRecordingView];
    
    // 初始化slideshowAndWhiteboardView->布局            白板
    [self initAndLayoutSlideshowAndWhiteboardView];
    
    // 设置顶部的view(发送消息)
    [self makeChatBar];

    // 初始化console->布局     （必须放在makeChatBar后面）  聊天板
    [self initConsole];
    [self layoutOriginConsole];
    
    // 初始化consoloSmallScreenButton->布局              聊天小屏按钮
    [self initAndLayoutConsoloSmallScreenButton];

}

// 初始化dashboardGroupView->布局
- (void)initAndLayouDashboardGroupView
{
    // 设置知识区的父view (包括采集、播放、白板)
    self.dashboardGroupView = ({
        UIView *view = [UIView new];
        view.clipsToBounds = YES;
        view;
    });
    [self.view addSubview:self.dashboardGroupView];
    NSArray *array = [self.dashboardGroupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuide);
    }];
    
    
    NSLog(@"%@", array);
    
}

// 初始化playingView->布局
- (void)initPlayingView
{
    // 老师视频
    self.playingView = ({
        UIButton *button = [UIButton new];
        button.clipsToBounds = YES;
        button;
    });
    [self.playingView setTitle:@"外教视频" forState:UIControlStateNormal];
    self.playingView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.2];
    [self.view addSubview:self.playingView];
}
- (void)layoutOriginPlayingView
{
    [self.playingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.dashboardGroupView);
        make.width.equalTo(self.playingView.mas_height).multipliedBy(4.0 / 3.0);
    }];
}

// 初始化teachFullScreenButton->布局
- (void)initTeachFullScreenButton
{
    // 老师视频全屏按钮
    self.teachFullScreenButton = ({
        UIButton *button = [UIButton new];
        button.backgroundColor = UICOLOR_FROM_HEX(0x1694FF);
        button.layer.cornerRadius = 2.0;
        button.layer.masksToBounds = YES;
        button.titleLabel.font = [UIFont systemFontOfSize:16.0];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateDisabled];
        [button setTitle:@"全屏" forState:UIControlStateNormal];
        button;
    });
    
    // teachFullScreenButton必须放到self.view上面
    [self.view addSubview:self.teachFullScreenButton];
}
- (void)layoutTeachFullScreenButton
{
    [self.teachFullScreenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.playingView).offset(10);
        make.right.mas_equalTo(self.playingView).offset(-10);
        make.width.equalTo(@40);
        make.height.equalTo(@30);
    }];
}

// 初始化recordingView->布局
- (void)initRecordingView
{
    // 采集
    self.recordingView = ({
        UIButton *button = [UIButton new];
        button.clipsToBounds = YES;
        button;
    });
    [self.recordingView setTitle:@"学员视频" forState:UIControlStateNormal];
    self.recordingView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
    [self.view addSubview:self.recordingView];
}

- (void)layoutOriginRecordingView
{
    [self.recordingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.playingView.mas_bottom);
        make.height.width.equalTo(self.playingView);
        make.right.equalTo(self.dashboardGroupView);
    }];
}

// 初始化slideshowAndWhiteboardView->布局
- (void)initAndLayoutSlideshowAndWhiteboardView
{
    // 白板
    self.slideshowAndWhiteboardView = ({
        UIView *view = [UIView new];
        view.clipsToBounds = YES;
        UILabel *label = [UILabel new];
        label.text = @"白板";
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(view);
        }];
        view;
    });
    self.slideshowAndWhiteboardView.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.2];
    [self.view addSubview:self.slideshowAndWhiteboardView];
    [self.slideshowAndWhiteboardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.dashboardGroupView);
        make.right.equalTo(self.playingView.mas_left);
        make.height.equalTo(self.slideshowAndWhiteboardView.mas_width).multipliedBy(3.0 / 4.0);
    }];
}

// 初始化console->布局
- (void)initConsole
{
    // 聊天板
    self.console = [BJConsoleViewController new];
    [self addChildViewController:self.console superview:self.view];
}
- (void)layoutOriginConsole
{
    [self.console.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.recordingView.mas_bottom);
        make.left.width.equalTo(self.recordingView);
        make.bottom.equalTo(self.chatBarGroupView.mas_top);
    }];
}

// 初始化consoloSmallScreenButton->布局
- (void)initAndLayoutConsoloSmallScreenButton
{
    // 聊天板 小屏按钮
    UIImage *backImage = [UIImage imageNamed:@"back-dark"];
    self.consoleSmallScreenButton = ({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, backImage.size.width, backImage.size.height)];
        button.tintColor = [UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil].tintColor;
        [button setImage:backImage forState:UIControlStateNormal];
        button;
    });
    [self.console.view addSubview:self.consoleSmallScreenButton];
    [self.consoleSmallScreenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.console.view).offset(10);
        make.width.equalTo(@40);
        make.height.equalTo(@30);
    }];
    self.consoleSmallScreenButton.hidden = YES;
}

#pragma mark - VM
// 进入房间后调用
- (void)didEnterRoom {
    
    // 打印房间的信息
    [self.console printFormat:@"roomInfo ID: %@, title: %@",
     self.room.roomInfo.ID,
     self.room.roomInfo.title];
    
    // 打印用户个人的信息
    [self.console printFormat:@"loginUser ID: %@, number: %@, name: %@",
     self.room.loginUser.ID,
     self.room.loginUser.number,
     self.room.loginUser.name];
    
    // if (!self.room.loginUser.isTeacher) {
    weakdef(self);
    [self bjl_kvo:BJLMakeProperty(self.room.roomVM, liveStarted)
                       filter:^BOOL(NSNumber *old, NSNumber *now) {
                           // strongdef(self);
                           return old.integerValue != now.integerValue;
                       }
                     observer:^BOOL(id old, id now) {
                         strongdef(self);
                         // liveStarted上课状态(打印上课状态) 
                         [self.console printFormat:@"liveStarted: %@", NSStringFromBOOL(self.room.roomVM.liveStarted)];
                         return YES;
                     }];
    // }
    
    // 点名
    [self makeUserEvents];
    
    // 采集、播放、白板的alt事件
    [self makeMediaEvents];
    
    // 发送(打印)聊天消息
    [self makeChatEvents];
}

// 建立房间(显示加载进度)--重新连接的时候会再次调用该方法
- (void)makeEventsForLoadingVM:(BJLLoadingVM *)loadingVM {
    weakdef(self/* , loadingVM */);
    
    loadingVM.suspendBlock = ^(BJLLoadingStep step,
                               BJLLoadingSuspendReason reason,
                               BJLError *error,
                               BOOL ignorable,
                               BJLLoadingSuspendCallback suspendCallback) {
        strongdef(self/* , loadingVM */);
        
        if (reason == BJLLoadingSuspendReason_stepOver) {
            [self.console printFormat:@"loading step over: %td", step];
            suspendCallback(YES);
            return;
        }
        [self.console printFormat:@"loading step suspend: %td", step];
        
        NSString *message = nil;
        if (reason == BJLLoadingSuspendReason_askForWWANNetwork) {
            message = @"WWAN----网络";
        }
        else if (reason == BJLLoadingSuspendReason_errorOccurred) {
            message = error ? [NSString stringWithFormat:@"%@ - %@",
                               error.localizedDescription,
                               error.localizedFailureReason] : @"错误";
        }
        if (message) {
            UIAlertController *alert = [UIAlertController
                                        alertControllerWithTitle:ignorable ? @"提示" : @"错误"
                                        message:message
                                        preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction
                              actionWithTitle:ignorable ? @"继续" : @"重试"
                              style:UIAlertActionStyleDefault
                              handler:^(UIAlertAction * _Nonnull action) {
                                  suspendCallback(YES);
                              }]];
            [alert addAction:[UIAlertAction
                              actionWithTitle:@"取消"
                              style:UIAlertActionStyleCancel
                              handler:^(UIAlertAction * _Nonnull action) {
                                  suspendCallback(NO);
                              }]];
            [self presentViewController:alert animated:YES completion:nil];
        }
    };
    
    [self bjl_observe:BJLMakeMethod(loadingVM, loadingUpdateProgress:)
             observer:(BJLMethodObserver)^BOOL(CGFloat progress) {
                 strongdef(self/* , loadingVM */);
                 [self.console printFormat:@"loading progress: %f", progress];
                 return YES;
             }];
    
    [self bjl_observe:BJLMakeMethod(loadingVM, loadingSuccess)
             observer:^BOOL(id data) {
                 strongdef(self/* , loadingVM */);
                 [self.console printLine:@"loading success"];
                 return YES;
             }];
    
    [self bjl_observe:BJLMakeMethod(loadingVM, loadingFailureWithError:)
             observer:^BOOL(BJLError *error) {
                 strongdef(self/* , loadingVM */);
                 [self.console printLine:@"loading failure"];
                 return YES;
             }];
}


// 发送(打印)聊天消息
- (void)makeChatEvents {
    weakdef(self);
    
    [self bjl_observe:BJLMakeMethod(self.room.chatVM, didReceiveMessage:)
             observer:^BOOL(NSObject<BJLMessage> *message) {
                 strongdef(self);
                 [self.console printFormat:@"chat %@: %@", message.fromUser.name, message.content];
                 return YES;
             }];
}

- (void)startPrintAVDebugInfo {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:_cmd object:nil];
    
    [self.console printFormat:@"---- av - %f ----", [NSDate timeIntervalSinceReferenceDate]];
    for (NSString *info in [self.room.mediaVM avDebugInfo]) {
        [self.console printLine:info];
    }
    
    [self performSelector:_cmd withObject:nil afterDelay:1.0];
}

- (void)stopPrintAVDebugInfo {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(startPrintAVDebugInfo) object:nil];
}

#pragma mark - events
// 顶部view中发送消息和返回的事件
- (void)makeEvents {
    weakdef(self);
    
    // textField事件
    [[self.textField.rac_textSignal
      map:^id(NSString *text) {
          return @(!!text.length);
      }]
     subscribeNext:^(NSNumber *enabled) {
         strongdef(self);
         self.doneButton.enabled = enabled.boolValue;
     }];
    
    // 返回按钮事件
//    [[self.backButton rac_signalForControlEvents:UIControlEventTouchUpInside]
//     subscribeNext:^(id x) {
//         strongdef(self);
//         [self goBack];
//     }];
    
    // 发送按钮事件
    [[self.doneButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         strongdef(self);
         [self sendMessage];
     }];
    
    // 更新聊天视图->全屏
    [[self.textField rac_signalForControlEvents:UIControlEventEditingDidBegin] subscribeNext:^(id x) {
        strongdef(self);
        [self updateChatBarGroupViewMAS];
    }];
    
    // 更新聊天视图->小屏
    [[self.consoleSmallScreenButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         strongdef(self);
         [self updateConsoleViewMAS];
    }];
    
    // 更新老师试图->全屏
    [[self.teachFullScreenButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(UIButton *button) {
         strongdef(self);
         
#warning 测试
         [self.room exit];
         [self dismissViewControllerAnimated:YES completion:^{
             self.room = nil;
         }];
         return ;
         
         if (button.isSelected) {       // 老师小屏
             [self updatePlayingViewToSmallScreenMAS];
             button.selected = NO;
         } else {                       // 老师全屏
             [self updatePlayingViewToFullScreenMAS];
             button.selected = YES;
         }
         
     }];
}

// 返回
- (void)goBack {
    // 返回之前要先退出房间 且需要将房间置为nil
    [self.room exit];
    [self dismissViewControllerAnimated:YES completion:^{
        self.room = nil;
    }];
}

// 发送消息
- (void)sendMessage {
    [self.view endEditing:YES];
    if (!self.textField.text.length) {
        return;
    }
    if ([self.textField.text isEqualToString:@"-av"]) {
        self.textField.text = nil;
        [self startPrintAVDebugInfo];
        return;
    }
    if (!self.room.chatVM.forbidAll && !self.room.chatVM.forbidMe) {
        [self.room.chatVM sendMessage:self.textField.text];
    }
    else {
        [self.console printLine:@"禁言状态不能发送消息"];
    }
    self.textField.text = nil;
    
}

// 更新聊天视图->全屏
- (void)updateChatBarGroupViewMAS
{
    self.consoleSmallScreenButton.hidden = NO;
    
    _hidenStatus = NO;
    // 刷新状态栏
    [self setNeedsStatusBarAppearanceUpdate];
    
    [UIView animateWithDuration:0.3f animations:^{
        // 聊天板
        [self.console.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.right.width.equalTo(self.dashboardGroupView);
            make.bottom.equalTo(self.dashboardGroupView).offset(-barHeight);
        }];
        
        // 更新聊天输入框
        [self.chatBarGroupView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.console.view);
            make.bottom.equalTo(self.view.mas_bottom);
            make.height.equalTo(@(barHeight));
        }];
        
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
        // 需要重新reloadData 否则cell的高度在小屏的时候很高 在全屏的时候也很高
        [self.console.tableView reloadData];
        
        // console全屏后应该应使得tableView滚动到最底部
        if (self.console.tableView.contentSize.height > self.console.tableView.frame.size.height) {
            CGPoint offset = CGPointMake(0, self.console.tableView.contentSize.height - self.console.tableView.frame.size.height);
            [self.console.tableView setContentOffset:offset animated:YES];
        }
    }];
    
}

// 更新聊天视图->小屏
- (void)updateConsoleViewMAS
{
    self.consoleSmallScreenButton.hidden = YES;
    
    [self.view endEditing:YES];
    
    
    _hidenStatus = YES;
    // 刷新状态栏
    [self setNeedsStatusBarAppearanceUpdate];
    
    [UIView animateWithDuration:0.3f animations:^{
        
        // 更新底部chatBar
        [self.chatBarGroupView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.recordingView);
            make.right.equalTo(self.recordingView).offset(buttonWidth+margin);
            make.bottom.equalTo(self.dashboardGroupView.mas_bottom);
            make.height.equalTo(@(barHeight));
        }];
        
        // 聊天板小屏
        [self.console.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.recordingView.mas_bottom);
            make.left.width.equalTo(self.recordingView);
            make.bottom.equalTo(self.chatBarGroupView.mas_top);
        }];
        
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
        // console小屏后应该应使得tableView滚动到最底部
        if (self.console.tableView.contentSize.height > self.console.tableView.frame.size.height) {
            CGPoint offset = CGPointMake(0, self.console.tableView.contentSize.height - self.console.tableView.frame.size.height);
            [self.console.tableView setContentOffset:offset animated:NO];
        }
    }];
}

// 更新老师试图->全屏
- (void)updatePlayingViewToFullScreenMAS
{
    self.chatBarGroupView.hidden = YES;
    
    [UIView animateWithDuration:0.3f animations:^{
        
        // 更新老师全屏的约束
        [self.playingView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.right.width.bottom.equalTo(self.dashboardGroupView);
        }];
        
        // 更新学生小屏的约束
        [self.recordingView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.equalTo(self.playingView);
            make.width.equalTo(@(CGRectGetWidth(self.recordingView.frame)));
            make.height.equalTo(@(CGRectGetHeight(self.recordingView.frame)));
        }];
        
        // 更新聊天板的约束
        [self.console.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.recordingView.mas_width);
            make.right.equalTo(self.dashboardGroupView);
            make.bottom.equalTo(self.recordingView.mas_top);
            make.height.equalTo(@(CGRectGetHeight(self.console.view.frame)));
        }];
        
        
        
        // 动画
        [self.view layoutIfNeeded];
    }];
}

// 更新老师试图->小屏
- (void)updatePlayingViewToSmallScreenMAS
{
    
    [UIView animateWithDuration:0.3f animations:^{
        
         // 更新老师小屏的约束
        [self.playingView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.top.equalTo(self.dashboardGroupView);
            make.width.equalTo(self.playingView.mas_height).multipliedBy(4.0 / 3.0);
        }];
        
        // 更新学生小屏的约束
        [self.recordingView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.playingView.mas_bottom);
            make.height.width.equalTo(self.playingView);
            make.right.equalTo(self.dashboardGroupView);
        }];
        
        // 聊天板小屏
        [self.console.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.recordingView.mas_bottom);
            make.left.width.equalTo(self.recordingView);
            make.bottom.equalTo(self.chatBarGroupView.mas_top);
        }];
        
        // 聊天板小屏
        [self.console.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.recordingView.mas_bottom);
            make.left.width.equalTo(self.recordingView);
            make.bottom.equalTo(self.chatBarGroupView.mas_top);
        }];
        
        // 动画
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.chatBarGroupView.hidden = NO;
    }];
}

#pragma mark - <UITextFieldDelegate>

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self sendMessage];
    return NO;
}

/*-------------------------------------*/
//// 更新约束
//- (void)viewWillLayoutSubviews
//{
//    [super viewWillLayoutSubviews];
//    [self _shouldRotateToOrientation:(UIDeviceOrientation)[UIApplication sharedApplication].statusBarOrientation];
//    NSLog(@"%s", __func__);
//}
//
//-(void)_shouldRotateToOrientation:(UIDeviceOrientation)orientation {
//    if (orientation == UIDeviceOrientationPortrait ||orientation ==
//        UIDeviceOrientationPortraitUpsideDown) {
//        NSLog(@"竖屏");
//    }
//    else {
//        NSLog(@"横屏");
//    }
//}

// 设置屏幕选装  需要在xcode中开启支持屏幕旋转
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}




@end
