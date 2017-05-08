//
//  GGT_EvaluateView.h
//  GoGoTalk
//
//  Created by 辰 on 2017/5/8.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_EvaluateView : UIView

@property (nonatomic, assign) NSInteger selectCount;

- (instancetype)initWithTitle:(NSString *)title evaluateArray:(NSArray *)evaluateArray selectCount:(NSInteger)selectCount;

@end
