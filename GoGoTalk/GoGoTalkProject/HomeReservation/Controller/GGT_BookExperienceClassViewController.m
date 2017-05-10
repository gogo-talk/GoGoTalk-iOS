//
//  GGT_BookExperienceClassViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/2.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_BookExperienceClassViewController.h"
#import "GGT_BookExperienceClassView.h"

@interface GGT_BookExperienceClassViewController ()

@end

@implementation GGT_BookExperienceClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setLeftBackButton];
    self.navigationItem.title = @"预约体验课";
    
    GGT_BookExperienceClassView *bookView = [[GGT_BookExperienceClassView alloc]init];
    bookView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    self.view = bookView;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
