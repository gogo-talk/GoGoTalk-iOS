//
//  UIImage+Category.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

//按钮设置背景色
+ (UIImage *)imageWithColor:(UIColor *)color;
//对图片尺寸进行压缩--
-(UIImage*)imageScaledToSize:(CGSize)newSize;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
