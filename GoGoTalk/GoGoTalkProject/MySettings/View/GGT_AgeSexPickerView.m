//
//  GGT_AgeSexPickerView.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//
#define PICKERVIEW_HEIGHT 140
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#import "GGT_AgeSexPickerView.h"
@interface GGT_AgeSexPickerView()<UIPickerViewDelegate, UIPickerViewDataSource>
{
    //当前选择的行号
    NSInteger selectRow;
}
//承载view
@property(nonatomic, retain)UIView *baseView;
@property(nonatomic, strong) NSArray *info;
@end
@implementation GGT_AgeSexPickerView
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        //self.info = @[@"男",@"女"];
        //NSLog(@"%@",self.info);
        
    }
    return self;
}
-(void)setPickerDataArray:(NSArray *)pickerDataArray
{
    
    [self createPickerView:pickerDataArray];
    
}
//绘制选择器
-(void)createPickerView:(NSArray *)pickerDataArray
{
    self.info = pickerDataArray;
    self.baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.baseView.backgroundColor = UICOLOR_FROM_HEX(0xf3f3f3);
    //self.baseView.backgroundColor = [UIColor blackColor];
    [self addSubview:self.baseView];
    [self.baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.right.mas_equalTo(self.mas_right);
        //make.bottom.mas_equalTo(self.mas_bottom);
        make.height.mas_equalTo(140);
        make.left.mas_equalTo(self.mas_left);
    }];
    //创建确定和取消按钮
    //UIButton *btnOK = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW-50, 0, 40, 40)];
    UIButton *btnOK = [UIButton new];
    [btnOK setTitle:@"确定" forState:UIControlStateNormal];
    [btnOK setTitleColor:UICOLOR_FROM_HEX(0xea5851) forState:UIControlStateNormal];
    [btnOK addTarget:self action:@selector(pickerBtnOK:) forControlEvents:UIControlEventTouchUpInside];
    [btnOK setFont:[UIFont systemFontOfSize:16]];
    [btnOK sizeToFit];
    [_baseView addSubview:btnOK];
    [btnOK mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.baseView.mas_top);
        make.right.equalTo(self.baseView.mas_right).with.offset(-LineX(10));
        make.height.mas_equalTo(LineH(40));
        make.width.mas_equalTo(LineW(50));
    }];
    
    UIButton *btnCancel = [[UIButton alloc] init];
    [btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UICOLOR_FROM_HEX(0xc6c6c6) forState:UIControlStateNormal];
    [btnCancel addTarget:self action:@selector(pickerBtnCancel:) forControlEvents:UIControlEventTouchUpInside];
    [btnCancel setFont:[UIFont systemFontOfSize:16]];
    [_baseView addSubview:btnCancel];
    [btnCancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.baseView.mas_top);
        make.left.equalTo(self.baseView.mas_left).with.offset(LineX(10));
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(40);
    }];
    //创建选择器
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, ScreenW, PICKERVIEW_HEIGHT-40)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.pickerView.backgroundColor = [UIColor whiteColor];
    [self.baseView addSubview:self.pickerView];
    
}
//点击确定按钮
-(void)pickerBtnOK:(UIButton *)sender
{
    if(self.selectBlock){
        self.selectBlock(self.info[selectRow]);
    }
    [self dismissPickerView];
}
//点击取消按钮
-(void)pickerBtnCancel:(UIButton *)sender
{
    if(self.selectBlock){
        self.selectBlock(nil);
    }
    [self dismissPickerView];
}
//弹出pickerView
-(void)popPickerView
{
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(0, ScreenH-205, ScreenW, 140);
    }];
}
//隐藏
-(void)dismissPickerView
{
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }];
}
#pragma mark -- UIPickerViewDelegate&UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.info.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.info[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    selectRow = row;
}
@end
