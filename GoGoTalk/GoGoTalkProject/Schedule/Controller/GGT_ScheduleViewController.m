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
#import "GGT_ScheduleCell.h"

static NSString * const CalendarCellID = @"cell";
static NSString * const xc_TableViewCellID = @"xc_TableViewCellID";

@interface GGT_ScheduleViewController ()<FSCalendarDataSource,FSCalendarDelegate,FSCalendarDelegateAppearance,UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource>
{
    void * _KVOContext;
}

@property (weak, nonatomic) FSCalendar *calendar;
@property (weak, nonatomic) UIButton *previousButton;
@property (weak, nonatomic) UIButton *nextButton;

@property (strong, nonatomic) NSCalendar *gregorian;

@property (strong, nonatomic) NSArray *datesWithEvent;
@property (strong, nonatomic) NSDateFormatter *xc_dateFormatter;
@property (strong, nonatomic) NSDateFormatter *xc_dateFormatter2;
@property (strong, nonatomic) UIButton *xc_titleButton;

@property (strong, nonatomic) UIPanGestureRecognizer *scopeGesture;
@property (strong, nonatomic) UITableView *xc_tableView;
@property (strong, nonatomic) UIView *xc_lineView;

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
        self.xc_dateFormatter2.dateFormat = @"yyyy年MM月";
    }
    return self;
}

// 加载view
- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.view = view;
    
    // 450 for iPad and 300 for iPhone
    CGFloat height = [[UIDevice currentDevice].model hasPrefix:@"iPad"] ? 450 : 345;
    FSCalendar *calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, height)];
    
    calendar.dataSource = self;
    calendar.delegate = self;
    calendar.backgroundColor = [UIColor whiteColor];
    calendar.appearance.headerMinimumDissolvedAlpha = 0;
    calendar.appearance.caseOptions = FSCalendarCaseOptionsHeaderUsesUpperCase;
    calendar.appearance.weekdayTextColor = [UIColor lightGrayColor];
    calendar.appearance.titleTodayColor = UICOLOR_FROM_HEX(kThemeColor);
    calendar.appearance.subtitleDefaultColor = UICOLOR_FROM_HEX(kCalendar_EventColor);
    calendar.appearance.subtitleTodayColor = UICOLOR_FROM_HEX(kThemeColor);
    calendar.appearance.subtitleSelectionColor = UICOLOR_FROM_HEX(kThemeColor);
    calendar.appearance.titlePlaceholderColor = UICOLOR_FROM_HEX(kCalendar_PlaceHolderColor);
    calendar.appearance.subtitlePlaceholderColor = UICOLOR_FROM_HEX(kCalendar_PlaceHolderColor);
    calendar.appearance.titleFont = Font(11);
    calendar.appearance.subtitleFont = Font(10);
    calendar.appearance.weekdayFont = Font(12);
    
    calendar.appearance.subtitleOffset = CGPointMake(0, 10);

    // 隐藏顶部时间
    calendar.headerHeight = 0;
    calendar.weekdayHeight = LineH(44);
    
    [calendar xc_SetCornerWithSideType:XCSideTypeBottomLine cornerRadius:5.0f];
    
    
    
    // cell下面的横线
    calendar.appearance.separators = FSCalendarSeparatorInterRows;
    
    
    [self.view addSubview:calendar];
    self.calendar = calendar;
    
    // 添加约束
    [calendar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@(LineH(345)));
    }];

    [calendar registerClass:[GGT_CalendarCell class] forCellReuseIdentifier:CalendarCellID];
    
    self.xc_lineView = ({
        UIView *xc_lineView =[UIView new];
        xc_lineView.backgroundColor = [UIColor lightGrayColor];
        xc_lineView;
    });
    [calendar.calendarWeekdayView addSubview:self.xc_lineView];
    [self.xc_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(calendar.calendarWeekdayView);
        make.height.equalTo(@0.5);
    }];
    
    
    // 更新数据源 刷新calendar
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 更新数据
            self.datesWithEvent = @[@"2017/05/03",
                                    @"2017/05/04",
                                    @"2017/05/06",
                                    @"2017/05/12",
                                    @"2017/05/25",
                                    @"2017/06/01"];
            [self.calendar reloadData];
    });
    
    // 定义titleView
    [self initTitleView];
}

// 初始化titleView
- (void)initTitleView
{
    UIButton *xc_titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *titleString = [self.xc_dateFormatter2 stringFromDate:[NSDate date]];
    [xc_titleButton setTitle:titleString forState:UIControlStateNormal];
//    [xc_titleButton setFrame:CGRectMake(0, 0, 200, 30)];
    [xc_titleButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [xc_titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [xc_titleButton setTintColor:[UIColor whiteColor]];
    
    UIImage *image = UIIMAGE_FROM_NAME(@"xialajiantou_top_zhankai");
    [xc_titleButton setImage:image forState:UIControlStateNormal];
    [xc_titleButton setImage:UIIMAGE_FROM_NAME(@"xialajiantou_top_shouqi") forState:UIControlStateSelected];
    
    [xc_titleButton.titleLabel sizeToFit];
    [xc_titleButton sizeToFit];
    
    // 设置button的insets
    [xc_titleButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -image.size.width, 0, image.size.width)];
    [xc_titleButton setImageEdgeInsets:UIEdgeInsetsMake(0, xc_titleButton.titleLabel.bounds.size.width, 0, -xc_titleButton.titleLabel.bounds.size.width)];
    [xc_titleButton setFrame:CGRectMake(0, 0, 200, 30)];
    
    
    self.xc_titleButton = xc_titleButton;
    self.navigationItem.titleView = xc_titleButton;
    
    __block BOOL flag = YES;
    
    @weakify(self);
    [[xc_titleButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         @strongify(self);
         
         xc_titleButton.selected = !xc_titleButton.isSelected;
         
         // 要刷新界面
         if (self.calendar.scope == FSCalendarScopeMonth) {
             [self.calendar setScope:FSCalendarScopeWeek animated:YES];
         } else {
             [self.calendar setScope:FSCalendarScopeMonth animated:YES];
         }
         
         if (flag) {
             [UIView animateWithDuration:0.3f animations:^{
//                 self.xc_titleButton.imageView.transform = CGAffineTransformMakeRotation(M_PI);
             } completion:^(BOOL finished) {
                 flag = NO;
             }];
         }
         else {
             [UIView animateWithDuration:0.3f animations:^{
//                 self.xc_titleButton.imageView.transform = CGAffineTransformMakeRotation(0);
             } completion:^(BOOL finished) {
                 flag = YES;
             }];
         }
         
         // 当点击xc_titleButton的时候需要将xc_tableView滚动到顶部
         [self.xc_tableView setContentOffset:CGPointZero animated:YES];
         
     }];
}


- (nullable NSString *)calendar:(FSCalendar *)calendar subtitleForDate:(NSDate *)date
{
    NSString *dateString = [self.xc_dateFormatter stringFromDate:date];
    if ([self.datesWithEvent containsObject:dateString]) {
        
        if (self.calendar.scope == FSCalendarScopeWeek) {
            return @"";     // 不能返回nil
        } else {
            return @"222";
        }
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
        [dateFormat setDateFormat:@"dd"];//设定时间格式,这里可以设置成自己需要的格式
    } else {
        [dateFormat setDateFormat:@"dd"];//设定时间格式,这里可以设置成自己需要的格式
    }
    return [dateFormat stringFromDate:date];
    
}

// 自定义cell
- (FSCalendarCell *)calendar:(FSCalendar *)calendar cellForDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
    GGT_CalendarCell *cell = [calendar dequeueReusableCellWithIdentifier:CalendarCellID forDate:date atMonthPosition:monthPosition];
    cell.isToggle = self.xc_titleButton.isSelected;
    return cell;
}


/**
 * Asks the delegate for subtitle text color in unselected state for the specific date.
 */
//- (nullable UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance subtitleDefaultColorForDate:(NSDate *)date
//{
//    return [UIColor blueColor];
//}

/**
 * Asks the delegate for subtitle text color in selected state for the specific date.
 */
//- (nullable UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance subtitleSelectionColorForDate:(NSDate *)date
//{
//    return [UIColor redColor];
//}

// 默认的Border颜色
//- (UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance borderDefaultColorForDate:(NSDate *)date
//{
//    if ([self.gregorian isDateInToday:date]) {
//        return [UIColor blackColor];
//    }
//    return [UIColor whiteColor];
//}
//
//// 选中的Borlder颜色
//- (UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance borderSelectionColorForDate:(NSDate *)date
//{
//    return [UIColor orangeColor];
//}

// 设置选中日期的选中颜色  圆的颜色
- (UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance fillSelectionColorForDate:(NSDate *)date
{
    return UICOLOR_FROM_HEX(kThemeColor);
}

// 设置今日的选中颜色
- (UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance fillDefaultColorForDate:(NSDate *)date
{
//    if ([self.gregorian isDateInToday:date]) {
//        return [UIColor blueColor];
//    }
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

// 日历左右翻动 调用
- (void)calendarCurrentPageDidChange:(FSCalendar *)calendar
{
    [self.xc_titleButton setTitle:[self.xc_dateFormatter2 stringFromDate:calendar.currentPage] forState:UIControlStateNormal];
}

- (void)calendar:(FSCalendar *)calendar boundingRectWillChange:(CGRect)bounds animated:(BOOL)animated
{
    NSLog(@"%@",(calendar.scope==FSCalendarScopeWeek?@"week":@"month"));
    if (calendar.scope == FSCalendarScopeWeek) {
        self.xc_lineView.hidden = YES;
        calendar.weekdayHeight = LineH(25);
        calendar.appearance.titleOffset = CGPointMake(0, -(LineH(10)));
    } else {
        self.xc_lineView.hidden = NO;
        calendar.weekdayHeight = LineH(44);
        calendar.appearance.titleOffset = CGPointMake(0, 0);
    }
    [self.calendar mas_updateConstraints:^(MASConstraintMaker *make) {
        if (calendar.scope == FSCalendarScopeWeek) {
            make.height.equalTo(@(LineH(49)));
        } else {
            make.height.equalTo(@(CGRectGetHeight(bounds)));
        }
    }];
    [self.view layoutIfNeeded];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.calendar selectDate:[NSDate date] scrollToDate:YES];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.calendar action:@selector(handleScopeGesture:)];
    panGesture.delegate = self;
    panGesture.minimumNumberOfTouches = 1;
    panGesture.maximumNumberOfTouches = 2;
    [self.view addGestureRecognizer:panGesture];
    self.scopeGesture = panGesture;
    
    
    self.xc_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH(), SCREEN_HEIGHT()-450) style:UITableViewStylePlain];
    self.xc_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.xc_tableView.delegate = self;
    self.xc_tableView.dataSource = self;
    [self.view addSubview:self.xc_tableView];
    [self.xc_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.calendar.mas_bottom).offset(10);
        make.right.left.bottom.equalTo(self.view);
    }];
    
    // While the scope gesture begin, the pan gesture of tableView should cancel.
    [self.xc_tableView.panGestureRecognizer requireGestureRecognizerToFail:panGesture];
    
    [self.calendar addObserver:self forKeyPath:@"scope" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:_KVOContext];
    
    self.calendar.scope = FSCalendarScopeMonth;
    
    // For UITest
    self.calendar.accessibilityIdentifier = @"calendar";
    
    [self.xc_tableView registerClass:[GGT_ScheduleCell class] forCellReuseIdentifier:NSStringFromClass([GGT_ScheduleCell class])];
    
    
    __unsafe_unretained UITableView *tableView = self.xc_tableView;
    // 下拉刷新
    tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [tableView.mj_header endRefreshing];
        });
    }];
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    tableView.mj_header.automaticallyChangeAlpha = YES;
    
}

- (void)dealloc
{
    [self.calendar removeObserver:self forKeyPath:@"scope" context:_KVOContext];
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (context == _KVOContext) {
        FSCalendarScope oldScope = [change[NSKeyValueChangeOldKey] unsignedIntegerValue];
        FSCalendarScope newScope = [change[NSKeyValueChangeNewKey] unsignedIntegerValue];
        NSLog(@"From %@ to %@",(oldScope==FSCalendarScopeWeek?@"week":@"month"),(newScope==FSCalendarScopeWeek?@"week":@"month"));
        
        // 当scope状态更改后 需要刷新界面 否则subtitle可能不会显示出来
        // 若刷新后 又会出现闪烁的现象
//        [self.calendar reloadData];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


#pragma mark - <UITableViewDelegate,UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GGT_ScheduleCell *cell = [GGT_ScheduleCell cellWithTableView:tableView forIndexPath:indexPath];
//    cell.backgroundColor = UICOLOR_RANDOM_COLOR();
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return LineH(135);
    return LineH(180);
}


#pragma mark - <UIGestureRecognizerDelegate>
// Whether scope gesture should begin
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    BOOL shouldBegin = self.xc_tableView.contentOffset.y <= -self.xc_tableView.contentInset.top;
    if (self.calendar.scope == FSCalendarScopeWeek) {
        return NO;
    }
    if (shouldBegin) {
        CGPoint velocity = [self.scopeGesture velocityInView:self.view];
        switch (self.calendar.scope) {
            case FSCalendarScopeMonth:
            {
                return velocity.y < 0;
            }
            case FSCalendarScopeWeek:
            {
                if (velocity.y > 0) {
                    [self.calendar setScope:FSCalendarScopeMonth animated:YES];
                }
                return velocity.y > 0;
            }
        }
    }
    return shouldBegin;
}

@end
