//
//  XCStarView.m
//  EvaluationStar
//
//  Created by 辰 on 15/11/26.
//  Copyright © 2015年 Chn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCStarView : UIView

@property (nonatomic, assign) int selectedStatCount;

- (instancetype)initWithEmptyImage:(NSString *)Empty StarImage:(NSString *)Star totalStarCount:(int)totalStarCount starMargin:(CGFloat)starMargin starWidth:(CGFloat)starWidth;


- (instancetype)initWithEmptyImage:(NSString *)Empty StarImage:(NSString *)Star totalStarCount:(int)totalStarCount selectedStatCount:(int)selectedStatCount starMargin:(CGFloat)starMargin starWidth:(CGFloat)starWidth;


@end
