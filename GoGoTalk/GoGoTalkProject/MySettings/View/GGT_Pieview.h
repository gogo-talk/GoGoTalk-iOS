//
//  GGT_Pieview.h
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/25.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_Pieview : UIView
//直径
//@property (nonatomic,assign) float radius;

/**
 *  Pie
 *
 *  @param frame      frame
 *  @param dataItems  数据源，此Demo是红、绿、蓝比例为1:4:5
 *  @param colorItems 对应数据的pie的颜色，如果colorItems.count < dataItems 或
 *                      colorItems 为nil 会随机填充颜色
 *
 */
- (id)initWithFrame:(CGRect)frame
          dataItems:(NSArray *)dataItems
         colorItems:(NSArray *)colorItems;
/**
 *  开始动画
 */
- (void)stroke;

@end
