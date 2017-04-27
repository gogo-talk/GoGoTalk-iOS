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

@end
