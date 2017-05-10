//
//  GGT_EditAgeSexController.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//  修改年龄和性别专用控制器
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#import "GGT_EditAgeSexController.h"
#import "GGT_AgeSexPickerView.h"
@interface GGT_EditAgeSexController ()
@property(nonatomic, strong) GGT_AgeSexPickerView *pickerView;
@property(nonatomic, strong) UIButton *ageSexBtn;
@property(nonatomic, strong) UIView *bgview;
@end

@implementation GGT_EditAgeSexController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UICOLOR_FROM_HEX(0xf2f2f2);
    [self setNavigationItems];
    
    [self createAgeSexButton];
    
}
-(void)setNavigationItems
{
    //导航栏标题
    self.navigationItem.title = self.titleName;
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"提交" forState:UIControlStateNormal];
    
    rightBtn.frame = CGRectMake(0, 0, 100, 30);
    [rightBtn setFont:[UIFont systemFontOfSize:16]];
    [rightBtn sizeToFit];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    //创建FixedSpace。用来控制上面按钮位置
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //设置negativeSpacer的宽度
    negativeSpacer.width = -5;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,rightItem];
    
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
};
-(void)createAgeSexButton
{
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    UIButton *ageSexBtn = [UIButton new];
    
    [ageSexBtn setTitle:self.prompt forState:UIControlStateNormal];
    [ageSexBtn setTitleColor:UICOLOR_FROM_HEX(0x999999) forState:UIControlStateNormal];
    ageSexBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [ageSexBtn setFont:Font(16)];
    [ageSexBtn addTarget:self action:@selector(ageSexBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    ageSexBtn.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:ageSexBtn];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(LineH(44));
        make.top.mas_equalTo(LineY(10));
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    
    [ageSexBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_left).with.offset(LineX(20));
        make.top.mas_equalTo(bgView.mas_top);
        make.bottom.mas_equalTo(bgView.mas_bottom);
        make.right.mas_equalTo(bgView.mas_right);
    }];
    self.ageSexBtn = ageSexBtn;
}
-(void)ageSexBtnClick:(UIButton *)sender
{
    NSArray *array = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14"];
    NSArray *array2 = @[@"男",@"女"];
    
    self.pickerView = [[GGT_AgeSexPickerView alloc] initWithFrame:CGRectMake(0, ScreenH-LineH(140), ScreenW, 140)];
    self.pickerView.backgroundColor = [UIColor whiteColor];
    int selectRow = 0;
    int inComponent = 0;
    if([self.prompt isEqualToString:@"请选择年龄"]){
        self.pickerView.pickerDataArray = array;
        selectRow = 6;
    }else{
        self.pickerView.pickerDataArray = array2;
        
        
    }
    
    [self.pickerView.pickerView selectRow:selectRow inComponent:inComponent animated:YES];
    
    [self.view addSubview:self.pickerView];
//    [self.pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(0);
//        make.right.mas_equalTo(0);
//        make.height.mas_equalTo(LineH(141));
//        make.bottom.equalTo(self.view.mas_bottom);
//    }];
    __weak typeof (self) weakself = self;
    self.pickerView.selectBlock = ^(NSString *str) {
        [weakself currentSource:str];
    };
    [self bgView];
    [self.view bringSubviewToFront:self.pickerView];
    [self.pickerView popPickerView];
    
}
//弹出选择器时透明黑色背景
-(void)bgView{
    UIView *bgview = [[UIView alloc] initWithFrame:self.view.bounds];
    bgview.backgroundColor = [UIColor blackColor];
    bgview.alpha = 0.3;
    self.bgview = bgview;
    self.bgview.tag = 1000;
    [self.view addSubview:bgview];
}
//收起选择器时移除背景
-(void)removebgView{
    UIView *subviews  = [self.view viewWithTag:1000];
    [subviews removeFromSuperview];
}
//选中的数据
-(void)currentSource:(NSString *)str
{
    NSLog(@"选中数据了");
    [self removebgView];
    [self.ageSexBtn setTitle:str forState:UIControlStateNormal];
    [self.ageSexBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
