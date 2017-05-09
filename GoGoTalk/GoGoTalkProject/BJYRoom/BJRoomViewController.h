//
//  BJRoomViewController.h
//  BJLiveCore
//
//  Created by MingLQ on 2016-12-18.
//  Copyright © 2016 Baijia Cloud. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <BJLiveCore/BJLiveCore.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "BJConsoleViewController.h"

@interface BJRoomViewController : UIViewController <
UINavigationControllerDelegate,
UIImagePickerControllerDelegate,
UITextFieldDelegate> {
    __weak UIScrollView *_imageScrollView;
}

- (void)enterRoomWithSecret:(NSString *)roomSecret
                   userName:(NSString *)userName;

@end

// protected
@interface BJRoomViewController ()

@property (nonatomic) BJLRoom *room;

@property (nonatomic) UIButton *recordingView, *playingView;    // 录屏、播放
@property (nonatomic) UIView *slideshowAndWhiteboardView;       // 白板

@property (nonatomic) BJConsoleViewController *console;         // 聊天界面

@end
