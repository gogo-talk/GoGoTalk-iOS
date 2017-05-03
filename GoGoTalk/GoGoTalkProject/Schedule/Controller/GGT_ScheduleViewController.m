//
//  GGT_ScheduleViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_ScheduleViewController.h"
#import "FSCalendar.h"
#import "GGT_CalendarCell.h"

static NSString * const CalendarCellID = @"cell";

@interface GGT_ScheduleViewController ()<FSCalendarDataSource,FSCalendarDelegate,FSCalendarDelegateAppearance>

@property (weak, nonatomic) FSCalendar *calendar;
@property (weak, nonatomic) UIButton *previousButton;
@property (weak, nonatomic) UIButton *nextButton;

@property (strong, nonatomic) NSCalendar *gregorian;

@property (strong, nonatomic) NSArray *datesWithEvent;
@property (strong, nonatomic) NSDateFormatter *xc_dateFormatter;
@property (strong, nonatomic) NSDateFormatter *xc_dateFormatter2;
@property (strong, nonatomic) UIButton *xc_titleButton;

@end

@implementation GGT_ScheduleViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"FSCalendar";
        self.gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        self.xc_dateFormatter = [[NSDateFormatter alloc] init];
        self.xc_dateFormatter.dateFormat = @"yyyy/MM/dd";
        
        self.xc_dateFormatter2 = [[NSDateFormatter alloc] init];
        self.xc_dateFormatter2.dateFormat = @"yyyy年MM月dd日";
    }
    return self;
}

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.view = view;
    
    // 450 for iPad and 300 for iPhone
    CGFloat height = [[UIDevice currentDevice].model hasPrefix:@"iPad"] ? 450 : 450;
    FSCalendar *calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 64, view.frame.size.width, height)];
    
    calendar.dataSource = self;
    calendar.delegate = self;
    calendar.backgroundColor = [UIColor whiteColor];
    calendar.appearance.headerMinimumDissolvedAlpha = 0;
    calendar.appearance.caseOptions = FSCalendarCaseOptionsHeaderUsesUpperCase;
    
    calendar.appearance.subtitleFont = [UIFont systemFontOfSize:12];
    calendar.appearance.subtitleOffset = CGPointMake(0, 15);
    
    // cell下面的横线
    calendar.appearance.separators = FSCalendarSeparatorInterRows;
    
    [self.view addSubview:calendar];
    self.calendar = calendar;
    
    // 添加约束
    [calendar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(@(64));
        make.height.equalTo(@(height));
    }];
    
    [calendar registerClass:[GGT_CalendarCell class] forCellReuseIdentifier:CalendarCellID];
    
    // 隐藏顶部时间
    calendar.headerHeight = 0;
    
    // 更新数据源 刷新calendar
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self buttonAction];
    });
    
    // 定义titleView
    [self initTitleView];
}

- (void)initTitleView
{
    UIButton *xc_titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *titleString = [self.xc_dateFormatter2 stringFromDate:[NSDate date]];
    [xc_titleButton setTitle:titleString forState:UIControlStateNormal];
    [xc_titleButton setFrame:CGRectMake(0, 0, 100, 30)];
    [xc_titleButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    self.xc_titleButton = xc_titleButton;
    self.navigationItem.titleView = xc_titleButton;
    
    @weakify(self);
    [[xc_titleButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         @strongify(self);
         
         xc_titleButton.selected = !xc_titleButton.isSelected;
         
         // 要刷新界面
         if (self.calendar.scope == FSCalendarScopeMonth) {
             [self.calendar setScope:FSCalendarScopeWeek animated:NO];
         } else {
             [self.calendar setScope:FSCalendarScopeMonth animated:NO];
         }
         
     }];
}

- (void)buttonAction
{
    self.datesWithEvent = @[@"2017/05/03",
                            @"2017/05/06",
                            @"2017/05/12",
                            @"2017/05/25"];
    [self.calendar reloadData];
}

- (nullable NSString *)calendar:(FSCalendar *)calendar subtitleForDate:(NSDate *)date
{
    NSString *dateString = [self.xc_dateFormatter stringFromDate:date];
    if ([self.datesWithEvent containsObject:dateString]) {
        return @"222";
    } else {
        return @"";
    }
}

// 设置日期的显示方式 今日显示“今”
- (NSString *)calendar:(FSCalendar *)calendar titleForDate:(NSDate *)date
{
    if ([self.gregorian isDateInToday:date]) {
        return @"今";
    }
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    if (self.calendar.scope == FSCalendarScopeWeek) {
        [dateFormat setDateFormat:@"MM/dd"];//设定时间格式,这里可以设置成自己需要的格式
    } else {
        [dateFormat setDateFormat:@"dd"];//设定时间格式,这里可以设置成自己需要的格式
    }
    return [dateFormat stringFromDate:date];
    
}

- (FSCalendarCell *)calendar:(FSCalendar *)calendar cellForDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
    GGT_CalendarCell *cell = [calendar dequeueReusableCellWithIdentifier:CalendarCellID forDate:date atMonthPosition:monthPosition];
    cell.isToggle = self.xc_titleButton.isSelected;
    return cell;
}


/**
 * Asks the delegate for subtitle text color in unselected state for the specific date.
 */
- (nullable UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance subtitleDefaultColorForDate:(NSDate *)date
{
    return [UIColor blackColor];
}

/**
 * Asks the delegate for subtitle text color in selected state for the specific date.
 */
- (nullable UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance subtitleSelectionColorForDate:(NSDate *)date
{
    return [UIColor orangeColor];
}

// 默认的Border颜色
- (UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance borderDefaultColorForDate:(NSDate *)date
{
    if ([self.gregorian isDateInToday:date]) {
        return [UIColor blackColor];
    }
    return [UIColor whiteColor];
}

// 选中的Borlder颜色
- (UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance borderSelectionColorForDate:(NSDate *)date
{
    return [UIColor orangeColor];
}

// 设置选中日期的选中颜色
- (UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance fillSelectionColorForDate:(NSDate *)date
{
    return [UIColor purpleColor];
}

// 设置今日的选中颜色
- (UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance fillDefaultColorForDate:(NSDate *)date
{
    if ([self.gregorian isDateInToday:date]) {
        return [UIColor blueColor];
    }
    return [UIColor whiteColor];
}

// 设置border是圆还是方  return 1.0是圆  return 0.0是方
//- (CGFloat)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance borderRadiusForDate:(nonnull NSDate *)date
//{
//    if ([@[@8,@17,@21,@25] containsObject:@([self.gregorian component:NSCalendarUnitDay fromDate:date])]) {
//        return 0.0;
//    }
//    return 1.0;
//}


// 点击cell的事件
- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
    NSLog(@"did select date %@",[self.xc_dateFormatter stringFromDate:date]);
    
    NSMutableArray *selectedDates = [NSMutableArray arrayWithCapacity:calendar.selectedDates.count];
    [calendar.selectedDates enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [selectedDates addObject:[self.xc_dateFormatter stringFromDate:obj]];
    }];
    NSLog(@"selected dates is %@",selectedDates);
    if (monthPosition == FSCalendarMonthPositionNext || monthPosition == FSCalendarMonthPositionPrevious) {
        [calendar setCurrentPage:date animated:YES];
    }
    
    // 更新xc_titleButton上面的文字
    [self.xc_titleButton setTitle:[self.xc_dateFormatter2 stringFromDate:date] forState:UIControlStateNormal];
}
    
@end
