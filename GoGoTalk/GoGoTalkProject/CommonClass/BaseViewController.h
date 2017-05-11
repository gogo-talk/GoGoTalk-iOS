//
//  BaseViewController.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

//返回按钮
- (void)setLeftBackButton;

//左侧返回按钮---带图片
- (void)setLeftItem:(NSString *)imageName;

//右侧按钮---文字
- (void)setRightBarButtonItemTitle:(NSString *)title;

//右侧按钮---图片
- (void)setRightButtonWithImg:(NSString *)imageName;

//左侧按钮的方法
- (void)leftAction;

//右侧按钮的方法
- (void)rightAction;

//导航进入到个人中心
- (void)initMineController;

@end
