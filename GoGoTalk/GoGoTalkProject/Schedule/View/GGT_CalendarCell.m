//
//  GGT_CalendarCell.m
//  FSCalendar
//
//  Created by 辰 on 2017/5/2.
//  Copyright © 2017年 Chn. All rights reserved.
//

#import "GGT_CalendarCell.h"
#import "FSCalendarDynamicHeader.h"
#import "FSCalendarExtensions.h"

@implementation GGT_CalendarCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.text = self.title;
    if (self.subtitle) {
        self.subtitleLabel.text = self.subtitle;
        if (self.subtitleLabel.hidden) {
            self.subtitleLabel.hidden = NO;
        }
    } else {
        if (!self.subtitleLabel.hidden) {
            self.subtitleLabel.hidden = YES;
        }
    }
    
    if (self.subtitle) {
        CGFloat titleHeight = self.calendar.calculator.titleHeight;
        CGFloat subtitleHeight = self.calendar.calculator.subtitleHeight;
        
        CGFloat height = titleHeight + subtitleHeight;
        self.titleLabel.frame = CGRectMake(
                                       self.preferredTitleOffset.x,
                                       (self.contentView.fs_height*5.0/6.0-height)*0.5+self.preferredTitleOffset.y,
                                       self.contentView.fs_width,
                                       titleHeight
                                       );
        self.subtitleLabel.frame = CGRectMake(
                                          self.preferredSubtitleOffset.x,
                                          (self.titleLabel.fs_bottom-self.preferredTitleOffset.y) - (self.titleLabel.fs_height-self.titleLabel.font.pointSize)+self.preferredSubtitleOffset.y,
                                          self.contentView.fs_width,
                                          subtitleHeight
                                          );
    } else {
        self.titleLabel.frame = CGRectMake(
                                       self.preferredTitleOffset.x,
                                       self.preferredTitleOffset.y,
                                       self.contentView.fs_width,
                                       floor(self.contentView.fs_height*5.0/6.0)
                                       );
    }
    
    
    self.imageView.frame = CGRectMake(self.preferredImageOffset.x, self.preferredImageOffset.y, self.contentView.fs_width, self.contentView.fs_height);
    
    
    
    CGFloat titleHeight = self.bounds.size.height*5.0/6.0;
    CGFloat diameter = MIN(self.bounds.size.height*5.0/6.0,self.bounds.size.width);
    diameter = diameter > FSCalendarStandardCellDiameter ? (diameter - (diameter-FSCalendarStandardCellDiameter)*0.5) : diameter;
    
    
    //    _shapeLayer.frame = CGRectMake((self.bounds.size.width-diameter)/2,
    //                                   (titleHeight-diameter)/2,
    //                                   diameter,
    //                                   diameter);
    
    
    // 设置选中圆的原点位置
#warning 需要修改的地方
    float margin = 4;
    if (_isToggle) {
        self.shapeLayer.frame = CGRectMake(margin,
                                           self.titleLabel.center.y-CGRectGetHeight(self.titleLabel.frame)/2.0 - margin,
                                           CGRectGetWidth(self.titleLabel.frame)-margin*2,
                                           CGRectGetHeight(self.titleLabel.frame) + margin*2);
    } else {
        self.shapeLayer.frame = CGRectMake(self.titleLabel.center.x-CGRectGetHeight(self.titleLabel.frame)/2.0 - margin,
                                           self.titleLabel.center.y-CGRectGetHeight(self.titleLabel.frame)/2.0 - margin,
                                           CGRectGetHeight(self.titleLabel.frame) + margin*2,
                                           CGRectGetHeight(self.titleLabel.frame) + margin*2);
    }
    

    
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:self.shapeLayer.bounds
                                                cornerRadius:CGRectGetWidth(self.shapeLayer.bounds)*0.5*self.borderRadius].CGPath;
    
    
    if (!CGPathEqualToPath(self.shapeLayer.path,path)) {
        self.shapeLayer.path = path;
    }
    
    CGFloat eventSize = self.shapeLayer.frame.size.height/6.0;
    self.eventIndicator.frame = CGRectMake(
                                       self.preferredEventOffset.x,
                                       CGRectGetMaxY(self.shapeLayer.frame)+eventSize*0.17+self.preferredEventOffset.y,
                                       self.fs_width,
                                       eventSize*0.83
                                       );
}

- (CGFloat)borderRadius
{
    return self.preferredBorderRadius >= 0 ? self.preferredBorderRadius : self.appearance.borderRadius;
}

@end
