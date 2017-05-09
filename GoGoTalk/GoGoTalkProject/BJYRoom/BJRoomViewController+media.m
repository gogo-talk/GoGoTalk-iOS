//
//  BJRoomViewController+media.m
//  BJLiveCore
//
//  Created by MingLQ on 2016-12-18.
//  Copyright © 2016 Baijia Cloud. All rights reserved.
//

#import <MobileCoreServices/MobileCoreServices.h>

#import "BJRoomViewController+media.h"

#import "BJLNetworking.h"

@implementation BJRoomViewController (media)

- (void)makeMediaEvents {
    [self makeSpeakingEvents];
    [self makeRecordingEvents];
    [self makePlayingEvents];
    [self makeSlideshowAndWhiteboardEvents];
}

- (void)makeSpeakingEvents {
    weakdef(self);
    
     /*------------------------------*/
#pragma mark - 自己添加的 之前没有
#pragma mark - 进入房间后 默认发送一次举手的请求
    // 采集  不管老师还是学生  采集都要打开
    // 学生和老师
    // 发送举手的请求
    //        [self.room.speakingRequestVM sendSpeakingRequest];
    // 进入教室 打开音视频的方法
    [self.room.recordingVM setRecordingAudio:YES
                              recordingVideo:YES];
    // 设置高清模式
    self.room.recordingVM.videoDefinition = BJLVideoDefinition_high;
    /*------------------------------*/
    

    return;
    
    
#pragma mark - 下面暂时没有用
    
    if (self.room.loginUser.isTeacher) {

        // 有学生请求发言
        [self bjl_observe:BJLMakeMethod(self.room.speakingRequestVM, receivedSpeakingRequestFromUser:)
                 observer:^BOOL(NSObject<BJLUser> *user) {
                     strongdef(self);
                     // 自动同意
                     [self.room.speakingRequestVM replySpeakingRequestToUserID:user.ID allowed:YES];
                     [self.console printFormat:@"%@ 请求发言、已同意", user.name];
                     return YES;
                 }];
        
    }
    else {
        
 
#pragma mark - 自己注销的
#pragma mark - 学生举手，老师同意后的回调
        // 发言请求被处理 - (举手后老师同意)
        [self bjl_observe:BJLMakeMethod(self.room.speakingRequestVM, speakingRequestDidReply:)
                 observer:^BOOL(NSObject<BJLSpeakingReply> *reply) {
                     strongdef(self);
                     
                     // 举手后，老师同意或者拒绝
                     [self.console printFormat:@"发言申请已被%@", reply.speakingEnabled ? @"允许" : @"拒绝"];
                     if (reply.speakingEnabled) {
                         
                         // 举手后，老师同意
                         // 设置打开音频还是视频
                         [self.room.recordingVM setRecordingAudio:YES
                                                   recordingVideo:NO];
                         [self.console printFormat:@"麦克风已打开"];
                    
                     }
                     
                     return YES;
                 }];
        
        
        // 发言状态被开启、关闭
        [self bjl_observe:BJLMakeMethod(self.room.speakingRequestVM, speakingDidRemoteEnabled:)
                 observer:(BJLMethodObserver)^BOOL(BOOL enabled) {
                     [self.console printFormat:@"发言状态被%@", enabled ? @"开启" : @"关闭"];
                     return YES;
                 }];
    }
}

// 录制视频的事件
- (void)makeRecordingEvents {
    weakdef(self);
    
    self.room.recordingView.userInteractionEnabled = NO;
    [self.recordingView addSubview:self.room.recordingView];
    [self.room.recordingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.recordingView);
    }];
    
    
    // 不管老师是否开始上课，学生自己的视频录制都是可以打开的
    [self.room.recordingVM setRecordingAudio:YES
                              recordingVideo:YES];
    
    [[self.recordingView rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         strongdef(self);
         

         return ;
         
#pragma mark - 下面暂时没有用
#pragma mark - 自己注销的
#pragma mark - 取消举手的功能
         // 不是老师且不能发言----举手
         if (!self.room.loginUser.isTeacher
             && !self.room.speakingRequestVM.speakingEnabled) {
             BOOL hasTeacher = !!self.room.onlineUsersVM.onlineTeacher;
             UIAlertController *actionSheet = [UIAlertController
                                               alertControllerWithTitle:self.recordingView.currentTitle
                                               message:hasTeacher ? @"要发言先举手" : @"老师没在教室，不能举手"
                                               preferredStyle:UIAlertControllerStyleActionSheet];
             // 老师在线
             if (hasTeacher) {
                 [actionSheet addAction:[UIAlertAction
                                         actionWithTitle:@"举手"
                                         style:UIAlertActionStyleDefault
                                         handler:^(UIAlertAction * _Nonnull action) {
                                             [self.room.speakingRequestVM sendSpeakingRequest];
                                         }]];
             }
             
             [actionSheet addAction:[UIAlertAction
                                     actionWithTitle:@"取消"
                                     style:UIAlertActionStyleCancel
                                     handler:nil]];
             
             // 没有举手的功能
             [self presentViewController:actionSheet
                                animated:YES
                              completion:nil];
             return;
         }
         
         
         
         BJLRecordingVM *recordingVM = self.room.recordingVM;
         if (!recordingVM) {
             return;
         }
         
         BOOL recordingAudio = recordingVM.recordingAudio, recordingVideo = recordingVM.recordingVideo;
         
         UIAlertController *actionSheet = [UIAlertController
                                           alertControllerWithTitle:self.recordingView.currentTitle
                                           message:nil
                                           preferredStyle:UIAlertControllerStyleActionSheet];
         
         // 录制音频和录制视频的状态一样时 才会走里面的逻辑 即 同时打开或关闭音视频
         if (recordingAudio == recordingVideo) {
             BOOL recording = recordingAudio;
             [actionSheet addAction:[UIAlertAction
                                     actionWithTitle:recording ? @"全部关闭" : @"全部打开"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction * _Nonnull action) {
                                         [recordingVM setRecordingAudio:!recording
                                                         recordingVideo:!recording];
                                         if (!self.room.loginUser.isTeacher
                                             && !recordingVM.recordingAudio
                                             && !recordingVM.recordingVideo) {
                                             
                                             // 关闭音视频的事件
                                             [self.room.speakingRequestVM stopSpeaking];
                                             [self.console printLine:@"同时关闭音视频，发言结束"];
                                         }
                                     }]];
         }
         
         // 已经举手，且老师同意，才会显示此ActionSheet
         [actionSheet addAction:[UIAlertAction
                                 actionWithTitle:recordingAudio ? @"关闭麦克风" : @"打开麦克风"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * _Nonnull action) {
                                     [recordingVM setRecordingAudio:!recordingAudio
                                                     recordingVideo:recordingVideo];
                                     if (!self.room.loginUser.isTeacher
                                         && !recordingVM.recordingAudio
                                         && !recordingVM.recordingVideo) {
                                         [self.room.speakingRequestVM stopSpeaking];
                                         [self.console printLine:@"同时关闭音视频，发言结束"];
                                     }
                                 }]];
         
         [actionSheet addAction:[UIAlertAction
                                 actionWithTitle:recordingVideo ? @"关闭摄像头" : @"打开摄像头"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * _Nonnull action) {
                                     [recordingVM setRecordingAudio:recordingAudio
                                                     recordingVideo:!recordingVideo];
                                     // 不是老师 没有进行音视频
                                     if (!self.room.loginUser.isTeacher
                                         && !recordingVM.recordingAudio
                                         && !recordingVM.recordingVideo) {
                                         [self.room.speakingRequestVM stopSpeaking];
                                         [self.console printLine:@"同时关闭音视频，发言结束"];
                                     }
                                 }]];
         

         // 已经打开视频
         if (recordingVideo) {
             [actionSheet addAction:[UIAlertAction
                                     actionWithTitle:@"切换摄像头"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction * _Nonnull action) {
                                         recordingVM.usingRearCamera = !recordingVM.usingRearCamera;
                                     }]];
             
             BOOL isLow = recordingVM.videoDefinition == BJLVideoDefinition_low;
             [actionSheet addAction:[UIAlertAction
                                     actionWithTitle:isLow ? @"高清模式" : @"流畅模式"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction * _Nonnull action) {
                                         recordingVM.videoDefinition = isLow ? BJLVideoDefinition_high : BJLVideoDefinition_low;
                                     }]];
             
             BOOL isClose = recordingVM.videoBeautifyLevel == BJLVideoBeautifyLevel_close;
             [actionSheet addAction:[UIAlertAction
                                     actionWithTitle:isClose ? @"打开美颜" : @"关闭美颜"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction * _Nonnull action) {
                                         recordingVM.videoBeautifyLevel = isClose ? BJLVideoBeautifyLevel_max : BJLVideoBeautifyLevel_close;
                                     }]];
         }
         
         BJLMediaVM *mediaVM = self.room.mediaVM;
         [actionSheet addAction:[UIAlertAction
                                 actionWithTitle:(mediaVM.upLinkType == BJLLinkType_TCP
                                                  ? @"TCP > UDP" : @"UDP > TCP")
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * _Nonnull action) {
                                     mediaVM.upLinkType = (mediaVM.upLinkType == BJLLinkType_TCP
                                                           ? BJLLinkType_UDP : BJLLinkType_TCP);
                                 }]];
         
         [actionSheet addAction:[UIAlertAction
                                 actionWithTitle:@"取消"
                                 style:UIAlertActionStyleCancel
                                 handler:nil]];
         
#pragma mark - ActionSheet的功能暂时不需要
         [self presentViewController:actionSheet
                            animated:YES
                          completion:nil];
     }];
}

// 播放视频的事件
- (void)makePlayingEvents {
    self.room.playingView.userInteractionEnabled = NO;
    [self.playingView addSubview:self.room.playingView];
    [self.room.playingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.playingView);
    }];
    
    
    weakdef(self);
    
    // 这两个监听方法是为了监听PC上面  老师摄像头的打开状态
    [self bjl_observe:BJLMakeMethod(self.room.playingVM, playingUserDidUpdate:)
             observer:^BOOL(BJLTuple *tuple) {
                 BJLTupleUnpack(tuple) = ^(NSObject<BJLOnlineUser> *old,
                                           NSObject<BJLOnlineUser> *now) {
                     strongdef(self);
                     [self.console printFormat:@"playingUserDidUpdate: %@ >> %@", old, now];
                 };
                 return YES;
             }];
    [self bjl_observe:BJLMakeMethod(self.room.playingVM, playingUserDidUpdate:old:)
             observer:^BOOL(NSObject<BJLOnlineUser> *now,
                            NSObject<BJLOnlineUser> *old) {
                 strongdef(self);
                 [self.console printFormat:@"playingUserDidUpdate:old: %@ >> %@", old, now];
                 
#pragma mark - 监听老师视频的打开还是关闭的状态
                 /*----------------------------*/
                 BJLPlayingVM *playingVM = self.room.playingVM;
                 if (!playingVM) {
                     return YES;
                 }
                 NSObject<BJLOnlineUser> *videoPlayingUser = playingVM.videoPlayingUser;
                 
                 for (NSObject<BJLOnlineUser> *user in playingVM.playingUsers) {
                     if (videoPlayingUser && [user.ID isEqualToString:videoPlayingUser.ID]) {
                         continue;
                     }
                     // 打开老师视频的方法
                     [playingVM updateVideoPlayingUserWithID:user.ID];
                 }
                 /*----------------------------*/
                 
                 return YES;
             }];
    
#pragma mark - 打开播放视频的方法
/*--------------------------------*/
    // 播放
    // 学生
    BJLPlayingVM *playingVM = self.room.playingVM;
    if (!playingVM) {
        return;
    }
    NSObject<BJLOnlineUser> *videoPlayingUser = playingVM.videoPlayingUser;
    
    for (NSObject<BJLOnlineUser> *user in playingVM.playingUsers) {
        if (videoPlayingUser && [user.ID isEqualToString:videoPlayingUser.ID]) {
            continue;
        }
        // 打开老师视频的方法
        [playingVM updateVideoPlayingUserWithID:user.ID];
    }
/*--------------------------------*/
    
    return;
    
#pragma mark - 下面暂时没有用

    // 点击播放视频的信号  弹出ActionSheet事件
    [[self.playingView rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         strongdef(self);
         
         BJLPlayingVM *playingVM = self.room.playingVM;
         if (!playingVM) {
             return;
         }
         
         NSObject<BJLOnlineUser> *videoPlayingUser = playingVM.videoPlayingUser;
         NSArray<NSObject<BJLOnlineUser> *> *playingUsers = playingVM.playingUsers;
         BOOL noBody = !videoPlayingUser && !playingUsers.count;
         
         UIAlertController *actionSheet = [UIAlertController
                                           alertControllerWithTitle:self.playingView.currentTitle
                                           message:noBody ? @"现在没有人在发言" : nil
                                           preferredStyle:UIAlertControllerStyleActionSheet];
         
         if (videoPlayingUser) {
             [actionSheet addAction:[UIAlertAction
                                     actionWithTitle:[NSString stringWithFormat:@"关闭视频 %@", videoPlayingUser.name]
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction * _Nonnull action) {
                                         
                                         // 关闭老师视频的事件
                                         [playingVM updateVideoPlayingUserWithID:nil];
                                     }]];
             if (self.room.loginUser.isTeacher) {
                 [actionSheet addAction:[UIAlertAction
                                         actionWithTitle:([NSString stringWithFormat:@"关闭发言 %@", videoPlayingUser.name])
                                         style:UIAlertActionStyleDestructive
                                         handler:^(UIAlertAction * _Nonnull action) {
                                             [playingVM remoteUpdatePlayingUserWithID:videoPlayingUser.ID
                                                                              audioOn:NO
                                                                              videoOn:NO];
                                         }]];
             }
         }
         
         
         for (NSObject<BJLOnlineUser> *user in playingVM.playingUsers) {
             if (videoPlayingUser && [user.ID isEqualToString:videoPlayingUser.ID]) {
                 continue;
             }
             
             // user的视频已经打开
             if (user.videoOn) {
                 [actionSheet addAction:[UIAlertAction
                                         actionWithTitle:[NSString stringWithFormat:@"打开视频--- %@", user.name]
                                         style:UIAlertActionStyleDefault
                                         handler:^(UIAlertAction * _Nonnull action) {
                                             
                                             // 打开视频的方法
                                             [playingVM updateVideoPlayingUserWithID:user.ID];
                                         }]];
                 
             }
             
             if (self.room.loginUser.isTeacher) {
                 [actionSheet addAction:[UIAlertAction
                                         actionWithTitle:([NSString stringWithFormat:@"关闭发言 %@", user.name])
                                         style:UIAlertActionStyleDestructive
                                         handler:^(UIAlertAction * _Nonnull action) {
                                             [playingVM remoteUpdatePlayingUserWithID:user.ID
                                                                              audioOn:NO
                                                                              videoOn:NO];
                                         }]];
                 NSInteger seconds = 1;
                 [actionSheet addAction:[UIAlertAction
                                         actionWithTitle:([NSString stringWithFormat:@"禁言 %td 分钟 %@", seconds, user.name])
                                         style:UIAlertActionStyleDestructive
                                         handler:^(UIAlertAction * _Nonnull action) {
                                             [self.room.chatVM sendForbidUser:user
                                                                     duration:seconds * 60.0];
                                         }]];
                 [actionSheet addAction:[UIAlertAction
                                         actionWithTitle:([NSString stringWithFormat:@"解除禁言 %@", user.name])
                                         style:UIAlertActionStyleDestructive
                                         handler:^(UIAlertAction * _Nonnull action) {
                                             [self.room.chatVM sendForbidUser:user
                                                                     duration:0.0];
                                         }]];
             }
         }
         
         BJLMediaVM *mediaVM = self.room.mediaVM;
         [actionSheet addAction:[UIAlertAction
                                 actionWithTitle:(mediaVM.downLinkType == BJLLinkType_TCP
                                                  ? @"TCP > UDP" : @"UDP > TCP")
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * _Nonnull action) {
                                     mediaVM.downLinkType = (mediaVM.downLinkType == BJLLinkType_TCP
                                                             ? BJLLinkType_UDP : BJLLinkType_TCP);
                                 }]];
         
         [actionSheet addAction:[UIAlertAction
                                 actionWithTitle:@"取消"
                                 style:UIAlertActionStyleCancel
                                 handler:nil]];
         
#pragma mark - ActionSheet的功能暂时不需要
//         [self presentViewController:actionSheet
//                            animated:YES
//                          completion:nil];
     }];
}

- (void)makeSlideshowAndWhiteboardEvents {
    weakdef(self);
    
    self.room.slideshowViewController.studentCanPreviewForward = YES;
    self.room.slideshowViewController.studentCanRemoteControl = YES;
    self.room.slideshowViewController.placeholderImage = [UIImage imageWithColor:[UIColor lightGrayColor]];
    
    [self addChildViewController:self.room.slideshowViewController
                       superview:self.slideshowAndWhiteboardView];
    [self.room.slideshowViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.slideshowAndWhiteboardView);
    }];
    
    
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [self.slideshowAndWhiteboardView addSubview:infoButton];
    [infoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.slideshowAndWhiteboardView).offset(- 5);
    }];
    
    /*----*/
    
    [[infoButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         BOOL whiteboardEnabled = self.room.slideshowViewController.whiteboardEnabled;
         self.room.slideshowViewController.whiteboardEnabled = !whiteboardEnabled;
     }];

    /*----*/
    
    return;
    
    // 下面暂时用不到
    
    [[infoButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         strongdef(self);
         
         UIAlertController *actionSheet = [UIAlertController
                                           alertControllerWithTitle:@"课件&画板"
                                           message:nil
                                           preferredStyle:UIAlertControllerStyleActionSheet];
         
//         [actionSheet addAction:[UIAlertAction
//                                 actionWithTitle:@"上传课件"
//                                 style:UIAlertActionStyleDefault
//                                 handler:^(UIAlertAction * _Nonnull action) {
//                                     [self.room.slideVM addDocument:({
//                                         BJLDocumentPageInfo *pageInfo = [BJLDocumentPageInfo new];
//                                         pageInfo.isAlbum = NO;
//                                         pageInfo.pageCount = 0;
//                                         pageInfo.pageURLString = @"https://img.genshuixue.com/baijiacloud/25760197_xg3ypq77.png";
//                                         pageInfo.width = 550;
//                                         pageInfo.height = 280;
//                                         BJLDocument *document = [BJLDocument new];
//                                         document.fileID = @"25760197";
//                                         document.fileName = @"1482134071749";
//                                         document.fileExtension = @".png";
//                                         document.pageInfo = pageInfo;
//                                         document;
//                                     })];
//                                     [self.room.slideVM addDocument:({
//                                         BJLDocumentPageInfo *pageInfo = [BJLDocumentPageInfo new];
//                                         pageInfo.isAlbum = NO;
//                                         pageInfo.pageCount = 0;
//                                         pageInfo.pageURLString = @"https://img.genshuixue.com/baijiacloud/25760479_kypu8tvk.png";
//                                         pageInfo.width = 627;
//                                         pageInfo.height = 830;
//                                         BJLDocument *document = [BJLDocument new];
//                                         document.fileID = @"25760479";
//                                         document.fileName = @"1482134268462";
//                                         document.fileExtension = @".png";
//                                         document.pageInfo = pageInfo;
//                                         document;
//                                     })];
//                                 }]];
         
         BOOL isFit = self.room.slideshowViewController.contentMode == BJLSlideshowContentMode_scaleAspectFit;
         [actionSheet addAction:[UIAlertAction
                                 actionWithTitle:isFit ? @"完整显示" : @"铺满显示"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * _Nonnull action) {
                                     self.room.slideshowViewController.contentMode = isFit ? BJLSlideshowContentMode_scaleAspectFill : BJLSlideshowContentMode_scaleAspectFit;
                                 }]];
         
         BOOL whiteboardEnabled = self.room.slideshowViewController.whiteboardEnabled;
         if (whiteboardEnabled) {
             [actionSheet addAction:[UIAlertAction
                                     actionWithTitle:@"擦除标记"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction * _Nonnull action) {
                                         [self.room.slideshowViewController clearWhiteboard];
                                     }]];
         }
         [actionSheet addAction:[UIAlertAction
                                 actionWithTitle:whiteboardEnabled ? @"结束标记" : @"开始标记"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * _Nonnull action) {
                                     self.room.slideshowViewController.whiteboardEnabled = !whiteboardEnabled;
                                 }]];
         
         [actionSheet addAction:[UIAlertAction
                                 actionWithTitle:@"取消"
                                 style:UIAlertActionStyleCancel
                                 handler:nil]];
         
         [self presentViewController:actionSheet
                            animated:YES
                          completion:nil];
     }];
}

@end
