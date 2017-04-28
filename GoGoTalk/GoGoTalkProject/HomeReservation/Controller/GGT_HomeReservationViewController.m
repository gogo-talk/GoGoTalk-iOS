//
//  GGT_HomeReservationViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_HomeReservationViewController.h"

@interface GGT_HomeReservationViewController ()

@end

@implementation GGT_HomeReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UICOLOR_RANDOM_COLOR();
    
    self.navigationItem.title = @"GogoTalk";
    self.navigationController.navigationBar.translucent = NO;
    
    [self setLeftItem:@"button_back"];
    
    [self setRightBarButtonItemTitle:@"客服"];
    
}

@end
