//
//  GGT_ChoicePickView.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/15.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ChoicePickView.h"

@interface GGT_ChoicePickView()
//选中的内容
@property (nonatomic, copy) NSString *choiceDateStr;
//选中的地区id
@property (nonatomic, copy) NSString *choiceIdDateStr;


//传递过来的类型
@property (nonatomic) NSInteger type;


//性别数据源
@property (nonatomic, strong) NSMutableArray *sexDataArray;

//省份数据源
@property (nonatomic, strong) NSMutableArray *shengDataArray;
@property (nonatomic, strong) NSMutableArray *shengIdDataArray;

//市数据源
@property (nonatomic, strong) NSMutableArray *shiDataArray;
@property (nonatomic, strong) NSMutableArray *shiIdDataArray;

//县或区数据源
@property (nonatomic, strong) NSMutableArray *quDataArray;
@property (nonatomic, strong) NSMutableArray *quIdDataArray;

@end



@implementation GGT_ChoicePickView
- (instancetype)initWithFrame:(CGRect)frame method:(NSInteger)method {
    if (self = [super initWithFrame:frame]) {
        //传参
        self.type = method;
        
        switch (method) {
            case BirthdayType:
                //生日
                [self setButton:300];
                [self initBirthDayView];
                break;
                
            case SexType:
                //性别
                [self setButton:400];
                [self initSexView];
                
                break;
            case AddressType:
                //地址
                [self setButton:500];
                [self initAddressView];
                break;
            default:
                break;
        }
    }
    return self;
}


- (void)setButton:(NSInteger )buttonTag {
    UIButton *cancleButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    cancleButton.frame =CGRectMake(LineX(15), LineY(5), LineW(40), LineH(30));
    [cancleButton setTitle:@"取消" forState:(UIControlStateNormal)];
    cancleButton.titleLabel.font = Font(16);
    [cancleButton setTitleColor:UICOLOR_FROM_HEX(Color999999) forState:(UIControlStateNormal)];
    [cancleButton addTarget:self action:@selector(cancleButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
    cancleButton.tag = buttonTag;
    [self addSubview:cancleButton];
    
    
    
    UIButton *finishButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    finishButton.frame =CGRectMake(SCREEN_WIDTH()-LineW(55), LineY(5), LineW(40), LineH(30));
    [finishButton setTitle:@"确定" forState:(UIControlStateNormal)];
    finishButton.titleLabel.font = Font(16);
    [finishButton setTitleColor:UICOLOR_FROM_HEX(ColorFF6600) forState:(UIControlStateNormal)];
    [finishButton addTarget:self action:@selector(finishButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
    finishButton.tag = buttonTag + 1;
    [self addSubview:finishButton];
}

#pragma mark 取消
- (void)cancleButtonClick:(UIButton *)button {
    if (self.cancleBlock) {
        self.cancleBlock(YES);
    }
}

- (void)finishButtonClick:(UIButton *)button {
    if (button.tag == 301) {
        if (IsStrEmpty(self.choiceDateStr)) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy年MM月dd日"];
            NSString *dateTime = [formatter stringFromDate:[NSDate date]];
            self.choiceDateStr = dateTime;
        }
        
        if (self.birthdayBlock) {
            self.birthdayBlock(self.choiceDateStr);
        }
        
    } else if (button.tag == 401) {
        if (IsStrEmpty(self.choiceDateStr)) {
            self.choiceDateStr = @"1";
        }
        
        if (self.sexBlock) {
            self.sexBlock(self.choiceDateStr);
        }
    } else if (button.tag == 502) {
        if (IsStrEmpty(self.choiceIdDateStr)) { //如果为空，默认选中北京东城区
            self.choiceIdDateStr = [NSString stringWithFormat:@"51,85,3280"];
        }
        
        if (self.addressBlock) {
            self.addressBlock(self.choiceDateStr,self.choiceIdDateStr);
        }
    }
}

#pragma mark ***************生日的选择************************
- (void)initBirthDayView {
    UIDatePicker  *picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,LineY(40),SCREEN_WIDTH(),LineH(226))];
    picker.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_ch"];
    // 设置时区
    [picker setTimeZone:[NSTimeZone localTimeZone]];
    picker.datePickerMode = UIDatePickerModeDate;
    // 设置当前显示时间
    [picker setDate:[NSDate date] animated:YES];
    // 设置显示最大时间（此处为当前时间）
    [picker setMaximumDate:[NSDate date]];
    picker.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    [picker addTarget:self action:@selector(seletedBirthyDate:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:picker];
}

- (void)seletedBirthyDate:(UIDatePicker *)pickView {
    //NSDate格式转换为NSString格式
    NSDate *pickerDate = [pickView date];// 获取用户通过UIDatePicker设置的日期和时间
    NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];// 创建一个日期格式器
    [pickerFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *dateString = [pickerFormatter stringFromDate:pickerDate];
    
    self.choiceDateStr = dateString;
    
}


#pragma mark ***************性别的选择************************
- (void)initSexView {
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,LineY(40),SCREEN_WIDTH(),LineH(150))];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    [self addSubview:pickerView];
    
    
    self.sexDataArray = [NSMutableArray array];
    self.sexDataArray = [NSMutableArray arrayWithObjects:@"男",@"女", nil];
    
    [pickerView reloadAllComponents];
}



#pragma mark ***************地址的选择************************
- (void)initAddressView {
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,LineY(40),SCREEN_WIDTH(),LineH(226))];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    [self addSubview:pickerView];
    
    
    //初始化数组
    self.shengDataArray = [NSMutableArray array];
    self.shengIdDataArray = [NSMutableArray array];
    self.shiDataArray = [NSMutableArray array];
    self.shiIdDataArray = [NSMutableArray array];
    self.quDataArray = [NSMutableArray array];
    self.quIdDataArray = [NSMutableArray array];
    
    
    //获取文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AddressList" ofType:@"txt"];
    NSData *jdata = [[NSData alloc] initWithContentsOfFile:path];
    NSDictionary *dict= [NSJSONSerialization JSONObjectWithData:jdata options:NSJSONReadingMutableContainers error:nil];

    //所有的数据
    NSArray *dataArray = dict[@"data"];
    //省
    for (NSDictionary *dic in dataArray) {
        [self.shengDataArray addObject:dic[@"ProvinceName"]];
        [self.shengIdDataArray addObject:dic[@"ProvinceId"]];
    }
    
    
    
    //市
    for (NSDictionary *dic in dataArray) {
        NSArray *cityArr = dic[@"city"];
        NSMutableArray *shiSmallArr = [NSMutableArray array];
        NSMutableArray *shiIdSmallArr = [NSMutableArray array];
        for (NSDictionary *cityDic in cityArr) {
            [shiSmallArr addObject:cityDic[@"CityName"]];
            [shiIdSmallArr addObject:cityDic[@"CityId"]];
        }
        [_shiDataArray addObject:shiSmallArr];
        [_shiIdDataArray addObject:shiIdSmallArr];
    }
    
    
    //区
    for (NSDictionary *dic in dataArray) {
        NSArray *cityArr = dic[@"city"];
        
        //分为34个小数组
        NSMutableArray *qubigArr = [NSMutableArray array];
        NSMutableArray *quIdbigArr = [NSMutableArray array];
        for (NSDictionary *cityDic in cityArr) {
            NSArray *quArr = cityDic[@"district"];
            //如果区的数组为空，会造成崩溃，需要自己添加一个temp数组
            if (IsArrEmpty(quArr)) {
                quArr = @[@{@"DistrictName":@"",@"DistrictId":@"0"}];
            }
            
            //对每个市进行分区
            NSMutableArray *quSmallArr = [NSMutableArray array];
            NSMutableArray *quIdSmallArr = [NSMutableArray array];
            
            
            for (NSDictionary *quDic in quArr) {
                [quSmallArr addObject:quDic[@"DistrictName"]];
                [quIdSmallArr addObject:quDic[@"DistrictId"]];
                
            }
            [qubigArr addObject:quSmallArr];
            [quIdbigArr addObject:quIdSmallArr];
        }
        [_quDataArray addObject:qubigArr];
        [_quIdDataArray addObject:quIdbigArr];
    }
    
}


#pragma mark pickerview function
//返回有几列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    if (self.type == SexType) {
        return 1;
    } else if (self.type == AddressType) {
        return 3;
    }
    return 0;
}


//返回指定列，行的高度，就是自定义行的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return LineH(44);
}

//返回指定列的宽度
- (CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (self.type == SexType) {
        return  SCREEN_WIDTH();
    } else if (self.type == AddressType) {
        return  SCREEN_WIDTH()/3;
    }
    return 0;
}

//设置字体大小
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        pickerLabel.font = Font(18);
    }
    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    pickerLabel.textAlignment = NSTextAlignmentCenter;
    return pickerLabel;
}


//返回指定列的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (self.type == SexType) {
        return  [self.sexDataArray count];
    } else if (self.type == AddressType) {
        if (component == 0) {
            return [self.shengDataArray count];
        } else if(component == 1){
            NSInteger rowProvince = [pickerView selectedRowInComponent:0];
            return [[self.shiDataArray safe_objectAtIndex:rowProvince] count];
        }
        else {
            NSInteger rowProvince = [pickerView selectedRowInComponent:0];
            NSInteger rowCity = [pickerView selectedRowInComponent:1];
            
            return [[[self.quDataArray safe_objectAtIndex:rowProvince] safe_objectAtIndex:rowCity] count];
        }
    }
    return 0;
}

//显示的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (self.type == SexType) {
        NSString *hourString = [self.sexDataArray safe_objectAtIndex:row];
        
        return hourString;
        
    } else if (self.type == AddressType) {
        
        if (component == 0) {
            
            return [self.shengDataArray safe_objectAtIndex:row];
            
        } else if(component == 1){
            
            NSInteger rowProvince = [pickerView selectedRowInComponent:0];
            
            return [[self.shiDataArray safe_objectAtIndex:rowProvince] safe_objectAtIndex:row];
            
        }
        else {
            NSInteger rowProvince = [pickerView selectedRowInComponent:0];
            NSInteger rowCity = [pickerView selectedRowInComponent:1];
            
            
            //如果为空，显示上级或@“”，不为空，显示原来的信息
            if ( IsStrEmpty([[[self.quDataArray safe_objectAtIndex:rowProvince] safe_objectAtIndex:rowCity] safe_objectAtIndex:row])) {
                
                return [[self.shiDataArray safe_objectAtIndex:rowProvince] safe_objectAtIndex:row];
                
            } else {
                return [[[self.quDataArray safe_objectAtIndex:rowProvince] safe_objectAtIndex:rowCity] safe_objectAtIndex:row];
                
                
            }
            
        }
    }
    return nil;
}


//被选择的行
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (self.type == SexType) { //1:男   0:女
        self.choiceDateStr = [self.sexDataArray safe_objectAtIndex:row];
        if ([self.choiceDateStr isEqualToString:@"男"]) {
            self.choiceDateStr = @"1";
        } else {
            self.choiceDateStr = @"0";
        }
        
    } else if (self.type == AddressType){
        
        if (component == 0) {
            [pickerView reloadComponent:1];
            [pickerView reloadComponent:2];
            
            
        } else if(component == 1){
            [pickerView reloadComponent:2];
        }
        
        
        NSInteger selectOne = [pickerView selectedRowInComponent:0];
        NSInteger selectTwo = [pickerView selectedRowInComponent:1];
        NSInteger selectThree = [pickerView selectedRowInComponent:2];
        
        //地区
        NSString *oneStr = [self.shengDataArray safe_objectAtIndex:selectOne];
        NSString *twoStr = [[self.shiDataArray safe_objectAtIndex:selectOne] safe_objectAtIndex:selectTwo];
        NSString *threeStr = [[[self.quDataArray safe_objectAtIndex:selectOne] safe_objectAtIndex:selectTwo] safe_objectAtIndex:selectThree];
        
        
        if (IsStrEmpty([[[self.quDataArray safe_objectAtIndex:selectOne] safe_objectAtIndex:selectTwo] safe_objectAtIndex:selectThree])) {
            threeStr = twoStr;
        }
        
        
        
        
        self.choiceDateStr = [NSString stringWithFormat:@"%@%@%@",oneStr,twoStr,threeStr];
        NSLog(@"打印地址---%@",self.choiceDateStr);
        
        
        //地区id
        NSString *oneIdStr = [self.shengIdDataArray safe_objectAtIndex:selectOne];
        NSString *twoIdStr = [[self.shiIdDataArray safe_objectAtIndex:selectOne] safe_objectAtIndex:selectTwo];
        NSString *threeIdStr = [[[self.quIdDataArray safe_objectAtIndex:selectOne] safe_objectAtIndex:selectTwo] safe_objectAtIndex:selectThree];
        
        
        if ([[NSString stringWithFormat:@"%@",threeIdStr] isEqualToString:@"0"]) {
            threeIdStr = twoIdStr;
        }
        
        
        self.choiceIdDateStr = [NSString stringWithFormat:@"%@,%@,%@",oneIdStr,twoIdStr,threeIdStr];
        NSLog(@"打印 id---%@",self.choiceIdDateStr);
        
    }
}


@end
