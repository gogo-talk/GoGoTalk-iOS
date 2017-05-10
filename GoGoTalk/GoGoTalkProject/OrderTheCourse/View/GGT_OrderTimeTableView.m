//
//  GGT_OrderTimeTableView.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/2.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_OrderTimeTableView.h"

@implementation GGT_OrderTimeTableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self initDataSource];
        [self initContentView];
        
    }
    return self;
}
- (void)initDataSource {
    
    //对头部的时间数据进行创建
    self.yearsArray = [NSMutableArray array];
    //对头部的周几数据进行创建
    self.weeksArray = [NSMutableArray array];
    
    
    //获取当前设备语言 en-US（英文） zh-Hans-US（中文）
    //    NSArray *appLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    //    NSString *languageName = [appLanguages objectAtIndex:0];
    
    
    //获取2周的数据
    for (int i = 0; i < 14; i ++) {
        //从现在开始的24小时
        NSTimeInterval secondsPerDay = i * 24*60*60;
        NSDate *curDate = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM-dd"];
        NSString *dateStr = [dateFormatter stringFromDate:curDate];//几月几号
        
        NSDateFormatter *weekFormatter = [[NSDateFormatter alloc] init];
        [weekFormatter setDateFormat:@"EEE"];//星期几 @"HH:mm 'on' EEEE MMMM d"];
        NSString *weekStr = [weekFormatter stringFromDate:curDate];
        
        
        //        if ([languageName isEqualToString:@"zh-Hans-US"]) {
        //            [self.weeksArray addObject:weekStr];
        //        } else {//英文语言
        //            //转换英文为中文
        //            NSString *chinaWeekStr = [self cTransformFromE:weekStr];
        //            [self.weeksArray addObject:chinaWeekStr];
        //        }
        
        
        //组合时间
        [self.yearsArray addObject:dateStr];
        [self.weeksArray addObject:weekStr];
    }
    
    
}

#pragma mark 数据创建
- (void)initContentView {
    
    //14天时间 85*14
    _bgScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _bgScrollerView.contentSize = CGSizeMake(LineW(85)*14,LineH(44)+31*LineH(52));
    _bgScrollerView.scrollEnabled = YES;
    _bgScrollerView.showsVerticalScrollIndicator = NO;
    _bgScrollerView.showsHorizontalScrollIndicator = NO;
    _bgScrollerView.pagingEnabled = NO;
    _bgScrollerView.delegate = self;
    _bgScrollerView.bounces = NO;
    [self addSubview:_bgScrollerView];

    for (NSUInteger i =  0; i < self.weeksArray.count; i++) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(LineW(85)*i, 0, LineW(85), LineH(44))];
        [_bgScrollerView addSubview:_headerView];
        
        UILabel *weekLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, LineY(10), LineW(85), LineH(12))];
        weekLabel.text = self.weeksArray[i];
        weekLabel.textAlignment = NSTextAlignmentCenter;
        weekLabel.font = Font(12);
        weekLabel.textColor = UICOLOR_FROM_HEX(Color666666);
        [_headerView addSubview:weekLabel];
        
        
        UILabel *monthLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,weekLabel.y+weekLabel.height+LineY(8), LineW(85), LineH(11))];
        monthLabel.text = self.yearsArray[i];
        monthLabel.textAlignment = NSTextAlignmentCenter;
        monthLabel.font = Font(12);
        weekLabel.textColor = UICOLOR_FROM_HEX(Color999999);
        [_headerView addSubview:monthLabel];
    }
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //设置每个item的大小
    layout.itemSize = CGSizeMake(LineW(1), LineH(1));
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1; //上下的间距 可以设置0看下效果
    layout.sectionInset = UIEdgeInsetsMake(0.f, 0, 9.f, 0);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, LineY(44), LineW(85)*14, 31*LineH(52)) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource =self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.scrollEnabled = NO;
    [_bgScrollerView addSubview:_collectionView];
    [_collectionView registerClass:[TimeCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    
    
    
    _alltimeArray = @[@"08:00",@"08:30",@"09:00",@"09:30",@"10:00",@"10:30",@"11:00",@"11:30",@"12:00",@"12:30",@"13:00",@"13:30",@"14:00",@"14:30",@"15:00",@"15:30",@"16:00",@"16:30",@"17:00",@"17:30",@"18:00",@"18:30",@"19:00",@"19:30",@"20:00",@"20:30",@"21:00",@"21:30",@"22:00",@"22:30"];
    
    
    [_collectionView reloadData];
    
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGFloat offsetY = scrollView.contentOffset.y;

    NSLog(@"----%f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y <= LineH(44)) {
//        _bgScrollerView.y = LineH(44);
        _headerView.y = LineY(44);
//        _bgScrollerView.contentSize = CGSizeMake(LineW(85)*14,LineH(44)+31*LineH(52));

    } else {
        _headerView.y = 0;

//        _bgScrollerView.y = 0;
//        _bgScrollerView.contentSize = CGSizeMake(LineW(85)*14,31*LineH(52));

    }
    
}
#pragma mark - CollectionView ---------------------------------------
//返回分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 32;
}

//返回每个分区的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _alltimeArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"cell";
    TimeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"-----------------");
    }
    //    for (NSUInteger i = 0; i< _alltimeArray.count; i++) {
    //        if (indexPath.row == i) {
    //            cell.timeLabel.text = _alltimeArray[i];
    //            cell.timeLabel.textColor = [UIColor redColor];
    //        }
    //    }
    cell.timeLabel.text = _alltimeArray[indexPath.row];
    cell.timeLabel.textColor = [UIColor blackColor];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",@(indexPath.row).description);
}

#pragma mark -- UICollectionViewDelegate
//设置每个 UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(LineW(85), LineH(52));
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0,0);
}

//定义每个UICollectionView 的纵向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}


-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
    
}


//每一个分组的上左下右间距
//定义每个UICollectionView 的间距
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
////    return UIEdgeInsetsMake(5, 5, 5, 5);
//    return UIEdgeInsetsMake(16, 32, 26,20);
//
//}


//- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//
//}
//
//
//#pragma mark -- UICollectionViewDelegate
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//
//





//转换英文为中文
//-(NSString *)cTransformFromE:(NSString *)theWeek{
//    NSString *chinaStr;
//    if(theWeek){
//        if([theWeek isEqualToString:@"Mon"]){
//            chinaStr = @"周一";
//        }else if([theWeek isEqualToString:@"Tue"]){
//            chinaStr = @"周二";
//        }else if([theWeek isEqualToString:@"Wed"]){
//            chinaStr = @"周三";
//        }else if([theWeek isEqualToString:@"Thu"]){
//            chinaStr = @"周四";
//        }else if([theWeek isEqualToString:@"Fri"]){
//            chinaStr = @"周五";
//        }else if([theWeek isEqualToString:@"Sat"]){
//            chinaStr = @"周六";
//        }else if([theWeek isEqualToString:@"Sun"]){
//            chinaStr = @"周日";
//        }
//    }
//    return chinaStr;
//}



@end
