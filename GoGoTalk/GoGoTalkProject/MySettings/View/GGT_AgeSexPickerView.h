//
//  GGT_AgeSexPickerView.h
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^MyBasicBlock)(id result);
@interface GGT_AgeSexPickerView : UIView
//选择器数据
@property(nonatomic, strong) NSArray *pickerDataArray;
//选择器
@property(nonatomic, retain) UIPickerView *pickerView;
//默认行号
@property(nonatomic, assign) NSInteger defaultRow;
//弹出选择器方法
-(void)popPickerView;
@property(nonatomic, strong)MyBasicBlock selectBlock;
@end
