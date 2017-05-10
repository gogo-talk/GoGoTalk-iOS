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
    //创建一个layout布局类
//    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
//    //设置布局方向为垂直流布局
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    //设置每个item的大小为100*100
//    layout.itemSize = CGSizeMake(100, 100);
//    
//    layout.minimumInteritemSpacing = 0;
//    layout.minimumLineSpacing = 1; //上下的间距 可以设置0看下效果
//    
//    layout.sectionInset = UIEdgeInsetsMake(0.f, 0, 9.f, 0);
//    
//    
//    //创建collectionView 通过一个布局策略layout来创建
//    _collectionView = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:layout];
//    //代理设置
//    _collectionView.delegate=self;
//    _collectionView.dataSource=self;
//    _collectionView.backgroundColor = [UIColor colorWithHexString:@"f3f4f8"];
//    //注册item类型 这里使用系统的类型
//    //    [_collectionView registerClass:[GGT_OrderTimeCollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
//    [_collectionView registerClass:[UICollectionView class] forCellWithReuseIdentifier:@"cellid"];
//    
//    //这个是横向滑动
//    //    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    [self addSubview:_collectionView];
//    
//
//    //这是头部与脚部的注册
//    [_collectionView registerClass:[GGT_OrderTimeHeaderCollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionHeaderView"];
//    
//    
//    
    

    

        //14天时间
        UIScrollView *headerScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH(), LineH(44))];
        headerScrollerView.contentSize = CGSizeMake(SCREEN_WIDTH()/4*7, 30);
        headerScrollerView.scrollEnabled = YES;
        headerScrollerView.showsVerticalScrollIndicator = NO;
        headerScrollerView.showsHorizontalScrollIndicator = NO;
        headerScrollerView.pagingEnabled = NO;
        for (NSUInteger i =  0; i < 7; i++) {
            UIButton *weekButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH()/4*i, 0, SCREEN_WIDTH()/4, 30)];
            weekButton.backgroundColor = [UIColor redColor];
            [weekButton setTitle:@"周六" forState:UIControlStateNormal];
            //weekButton.titleLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)i+1];
            [headerScrollerView addSubview:weekButton];
        }
        [self addSubview:headerScrollerView];
        
        //每天可约时间的view
        UIView *momentView = [[UIView alloc]initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH(),144)];
        momentView.backgroundColor = [UIColor orangeColor];
        [self addSubview:momentView];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(SCREEN_WIDTH()/4, 36);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 1; //上下的间距 可以设置0看下效果
        layout.sectionInset = UIEdgeInsetsMake(0.f, 0, 9.f, 0);

        UICollectionView *momentCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, momentView.frame.size.width, momentView.frame.size.height) collectionViewLayout:layout];
        momentCollectionView.delegate = self;
        momentCollectionView.dataSource =self;
        momentCollectionView.backgroundColor = [UIColor whiteColor];
        [momentView addSubview:momentCollectionView];
        [momentCollectionView registerClass:[TimeCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
//    }
    
    
    //这个是数据源
    if (!_alltimeArray) {
        _alltimeArray = [[NSArray alloc]init];
        _alltimeArray = @[@"8.00",@"9.00",@"10.00",@"11.00",@"12.00",@"13.00",@"14.00",@"15.00",@"16.00",@"17.00",@"18.00",@"19.00",@"20.00",@"21.00",@"22.00",@"23.00"];
        
    }
    

}
#pragma mark - CollectionView ---------------------------------------
//section 的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//cell的个数
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
    for (NSUInteger i = 0; i< _alltimeArray.count; i++) {
        if (indexPath.row == i) {
            cell.timeLabel.text = _alltimeArray[i];
            cell.timeLabel.textColor = [UIColor redColor];
        }
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",@(indexPath.row).description);
}

#pragma mark -- UICollectionViewDelegate
//设置每个 UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH()/4-1, 35);
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





/*

- (void)initContentView {
    //创建一个layout布局类
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    //设置布局方向为垂直流布局
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置每个item的大小为100*100
    layout.itemSize = CGSizeMake(100, 100);
    
    //创建collectionView 通过一个布局策略layout来创建
    _collectionView = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:layout];
    //代理设置
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.backgroundColor = [UIColor colorWithHexString:@"f3f4f8"];
    //注册item类型 这里使用系统的类型
//    [_collectionView registerClass:[GGT_OrderTimeCollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [_collectionView registerClass:[UICollectionView class] forCellWithReuseIdentifier:@"cellid"];

    //这个是横向滑动
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self addSubview:_collectionView];

    
    //这是头部与脚部的注册
    [_collectionView registerClass:[GGT_OrderTimeHeaderCollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionHeaderView"];

    
    
    
//    NSArray *idArray = @[@"08:00",@"08:30",@"09:00",@"09:30",@"10:00",@"10:30",@"11:00",@"11:30",@"12:00",@"12:30",@"13:00",@"13:30",@"14:00",@"14:30",@"15:00",@"15:30",@"16:00",@"16:30",@"17:00",@"17:30",@"18:00",@"18:30",@"19:00",@"19:30",@"20:00",@"20:30",@"21:00",@"21:30",@"22:00",@"22:30",@"23:00",@"23:30",@"24:00"];
    
    NSString *a = @"8:00";
    NSMutableArray *arr = [NSMutableArray array];
    _dateArray = [NSMutableArray array];
    for (int i=0; i<3; i++) {
        [arr addObject:a];
    }
    
    for (int i=0; i<2; i++) {
        [_dateArray addObject:arr];
    }

    NSLog(@"---%@",_dateArray);

//    for (int i=0; i<14; i++) {
//        [_dateArray addObject:idArray];
//    }
//    _dateArray = (NSMutableArray *)idArray;
    [_collectionView reloadData];
    
}


#pragma mark 以下是UICollectionView的代理
//返回每个item
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    GGT_OrderTimeCollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    
        UICollectionView * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];

//    [cell getCellStr:[NSString stringWithFormat:@"%@",[_dateArray objectAtIndex:indexPath.row]]];
    
//    if (isClern == YES) {
//        cell.nameLabel.textColor = [UIColor colorWithHexString:@"#666666"];
//        cell.contentView.backgroundColor = [UIColor colorWithHexString:@"f3f4f8"];
//    }
    
    
    return cell;
}

//返回分区个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
    return 2;
//    return 33;

}

//返回每个分区的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return [_dateArray[section] count];
    return [_dateArray count];

}

//头部和脚部的加载
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        GGT_OrderTimeHeaderCollectionViewCell *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionHeaderView" forIndexPath:indexPath];
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(110, 20, 100, 30)];
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            label.text=@"头";
        }
        view.backgroundColor = UICOLOR_RANDOM_COLOR();
        [view addSubview:label];
        
        return view;
    }
    return nil;

}

//每一个分组的上左下右间距
//定义每个UICollectionView 的间距
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
////    return UIEdgeInsetsMake(5, 5, 5, 5);
//    return UIEdgeInsetsMake(16, 32, 26,20);
//
//}

//头部试图的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(50, 60);

    }
    
    return CGSizeMake(0, 0);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //    NSLog(@"%@",@(indexPath.row).description);
    
//    isClern = NO;
    
//    GGT_OrderTimeCollectionViewCell * selectedCell =(GGT_OrderTimeCollectionViewCell *) [_collectionView cellForItemAtIndexPath:indexPath];
//    
//    selectedCell.contentView.backgroundColor = MainColor;
//    selectedCell.nameLabel.textColor = WHITEColor;
//    selectedCell.contentView.layer.masksToBounds = YES;
//    selectedCell.contentView.layer.cornerRadius = IPAD_X(2);
//    
//    
//    _nowCityLable.text = [NSString stringWithFormat:@"%@",[_collectionArray objectAtIndex:indexPath.row]];
//    
//    
//    NSString *nameStr =  _collectionArray[indexPath.row];
//    NSString *nameIdStr =  _collectionIdArray[indexPath.row];
//    if (IsStrEmpty(shengStr)) {
//        shengStr = @"安徽省";
//    }
//    NSString *blockStr = [NSString stringWithFormat:@"%@/%@",shengStr,nameStr];
//    
//    NSLog(@"选择的城市%@----城市id-%@",blockStr,nameIdStr);
//    self.CityChangedBlock(blockStr,nameIdStr);
//    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    GGT_OrderTimeCollectionViewCell * deselectedCell =(GGT_OrderTimeCollectionViewCell *) [_collectionView cellForItemAtIndexPath:indexPath];
    
    deselectedCell.nameLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    deselectedCell.contentView.backgroundColor = [UIColor colorWithHexString:@"f3f4f8"];
    
}

#pragma mark -- UICollectionViewDelegate
//设置每个 UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    CGSize describeSize=[[NSString stringWithFormat:@"%@",[_dateArray objectAtIndex:indexPath.row]] boundingRectWithSize:CGSizeMake(200, 24) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
//    return CGSizeMake(describeSize.width+16, 24);
    return CGSizeMake(LineW(40), LineH(40));

}



//定义每个UICollectionView 的纵向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 14;
}
*/

//-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
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


//转换英文为中文
-(NSString *)cTransformFromE:(NSString *)theWeek{
    NSString *chinaStr;
    if(theWeek){
        if([theWeek isEqualToString:@"Mon"]){
            chinaStr = @"周一";
        }else if([theWeek isEqualToString:@"Tue"]){
            chinaStr = @"周二";
        }else if([theWeek isEqualToString:@"Wed"]){
            chinaStr = @"周三";
        }else if([theWeek isEqualToString:@"Thu"]){
            chinaStr = @"周四";
        }else if([theWeek isEqualToString:@"Fri"]){
            chinaStr = @"周五";
        }else if([theWeek isEqualToString:@"Sat"]){
            chinaStr = @"周六";
        }else if([theWeek isEqualToString:@"Sun"]){
            chinaStr = @"周日";
        }
    }
    return chinaStr;
}



@end
