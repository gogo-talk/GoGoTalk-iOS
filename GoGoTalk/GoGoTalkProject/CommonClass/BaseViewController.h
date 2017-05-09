//
//  BaseViewController.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)setLeftBackButton;

- (void)setLeftItem:(NSString *)imageName;

- (void)setRightBarButtonItemTitle:(NSString *)title;

- (void)leftAction;

- (void)rightAction;
//导航进入到个人中心
- (void)initMineController;

//客服电话
- (void)initServiceTelephone;
    

- (void)setRightButtonWithImg:(NSString *)imageName;
@end
