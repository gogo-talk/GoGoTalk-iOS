//
//  GGT_Pieview.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/25.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_Pieview.h"

@interface GGT_Pieview()
@property (nonatomic) CGFloat total;
@property (nonatomic) CAShapeLayer *bgCircleLayer;
@end

@implementation GGT_Pieview

- (id)initWithFrame:(CGRect)frame dataItems:(NSArray *)dataItems colorItems:(NSArray *)colorItems {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.hidden = YES;
        self.backgroundColor = [UIColor clearColor]; //外圈颜色
        
        //1.pieView中心点
        CGFloat centerWidth = self.frame.size.width * 0.5f;
        CGFloat centerHeight = self.frame.size.height * 0.5f;
        CGFloat centerX = centerWidth;
        CGFloat centerY = centerHeight;
        CGPoint centerPoint = CGPointMake(centerX, centerY);
        CGFloat radiusBasic = centerWidth > centerHeight ? centerHeight : centerWidth;
        
        //计算红绿蓝部分总和
        _total = 0.0f;
        for (int i = 0; i < dataItems.count; i++) {
            _total += [dataItems[i] floatValue];
        }
        
        //线的半径为扇形半径的一半，线宽是扇形半径，这样就能画出圆形了
        //2.背景路径
        CGFloat bgRadius = radiusBasic * 0.5;
        UIBezierPath *bgPath = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                              radius:bgRadius
                                                          startAngle:-M_PI_2
                                                            endAngle:M_PI_2 * 3
                                                           clockwise:YES];
        _bgCircleLayer = [CAShapeLayer layer];
        _bgCircleLayer.fillColor   = [UIColor clearColor].CGColor;
        _bgCircleLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        _bgCircleLayer.strokeStart = 0.0f;
        _bgCircleLayer.strokeEnd   = 1.0f;
        _bgCircleLayer.zPosition   = 1;
        _bgCircleLayer.lineWidth   = bgRadius * 2.0f;
        _bgCircleLayer.path        = bgPath.CGPath;
        
        
        //3.子扇区路径
        CGFloat otherRadius = radiusBasic * 0.5 - 3.0;
        UIBezierPath *otherPath = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                                 radius:otherRadius
                                                             startAngle:-M_PI_2
                                                               endAngle:M_PI_2 * 3
                                                              clockwise:YES];
        
        CGFloat start = 0.0f;
        CGFloat end = 0.0f;
        for (int i = 0; i < dataItems.count; i++) {
            //4.计算当前end位置 = 上一个结束位置 + 当前部分百分比
            end = [dataItems[i] floatValue] / _total + start;
            
            //图层
            CAShapeLayer *pie = [CAShapeLayer layer];
            [self.layer addSublayer:pie];
            pie.fillColor   = [UIColor clearColor].CGColor;
            if (i > colorItems.count - 1 || !colorItems  || colorItems.count == 0) {//如果传过来的颜色数组少于item个数则随机填充颜色
                pie.strokeColor = UICOLOR_FROM_HEX(ColorF2F2F2).CGColor;
            } else {
                pie.strokeColor = ((UIColor *)colorItems[i]).CGColor;
            }
            pie.strokeStart = start;
            pie.strokeEnd   = end;
            pie.lineWidth   = otherRadius * 2.0f;
            pie.zPosition   = 2;
            pie.path        = otherPath.CGPath;
            
            
            CGFloat aaa;
            if ([dataItems[0]  integerValue] <= 40) {
                aaa = 0.9*bgRadius;
            } else {
                aaa = 0.7*bgRadius;
            }
            
            //计算百分比label的位置
            CGFloat centerAngle = M_PI * (start + end);
            CGFloat labelCenterX = aaa * sinf(centerAngle) + centerX;
            CGFloat labelCenterY = -aaa * cosf(centerAngle) + centerY;
            //            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, radiusBasic * 0.5f)];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
            
            label.center = CGPointMake(labelCenterX, labelCenterY);
            
            //            label.backgroundColor = [UIColor blackColor];
            label.text = [NSString stringWithFormat:@"%ld",(long)((end - start + 0.005) * 100)];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
            label.layer.zPosition = 3;
            label.font = [UIFont systemFontOfSize:11];
            label.tag = 100 + i;
            [self addSubview:label];
            
            
            for (UILabel *label in self.subviews) {
                if ([label.text isEqualToString:[NSString stringWithFormat:@"%@",dataItems[0]]]) {
                    label.hidden = NO;
                } else {
                    label.hidden = YES;
                }
                
                
                if ([[NSString stringWithFormat:@"%@",dataItems[1]] isEqualToString:@"50"]) {
                    UILabel *label1 = [self viewWithTag:101];
                    label1.hidden = YES;
                }
                
            }
            //计算下一个start位置 = 当前end位置
            start = end;
        }
        self.layer.mask = _bgCircleLayer;
        
    }
    return self;
}

- (void)stroke {
    //画图动画
    self.hidden = NO;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration  = 1;
    animation.fromValue = @0.0f;
    animation.toValue   = @1.0f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.removedOnCompletion = YES;
    [_bgCircleLayer addAnimation:animation forKey:@"circleAnimation"];
    
}

- (void)dealloc {
    [self.layer removeAllAnimations];
}

@end
