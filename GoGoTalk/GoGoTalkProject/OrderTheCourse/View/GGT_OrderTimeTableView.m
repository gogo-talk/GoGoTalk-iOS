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
        
        [self initContentView];
        [self initDataSource];
    }
    return self;
}


#pragma mark 数据创建
- (void)initDataSource {
    
    //对头部的时间数据进行创建
    self.yearsArray = [NSMutableArray array];
    //对头部的周几数据进行创建
    self.weeksArray = [NSMutableArray array];

    //获取2周的数据
    for (int i = 0; i < 14; i ++) {
        //从现在开始的24小时
        NSTimeInterval secondsPerDay = i * 24*60*60;
        NSDate *curDate = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM-dd"];
        NSString *dateStr = [dateFormatter stringFromDate:curDate];//几月几号
        
        NSDateFormatter *weekFormatter = [[NSDateFormatter alloc] init];
        [weekFormatter setDateFormat:@"EEEE"];//星期几 @"HH:mm 'on' EEEE MMMM d"];
        NSString *weekStr = [weekFormatter stringFromDate:curDate];
        
        //转换英文为中文
        NSString *chinaWeekStr = [self cTransformFromE:weekStr];
    
        //组合时间
        [self.yearsArray addObject:dateStr];
        [self.weeksArray addObject:chinaWeekStr];
    }
    
    
    
    
    
    
}


//转换英文为中文
-(NSString *)cTransformFromE:(NSString *)theWeek{
    NSString *chinaStr;
    if(theWeek){
        if([theWeek isEqualToString:@"Monday"]){
            chinaStr = @"一";
        }else if([theWeek isEqualToString:@"Tuesday"]){
            chinaStr = @"二";
        }else if([theWeek isEqualToString:@"Wednesday"]){
            chinaStr = @"三";
        }else if([theWeek isEqualToString:@"Thursday"]){
            chinaStr = @"四";
        }else if([theWeek isEqualToString:@"Friday"]){
            chinaStr = @"五";
        }else if([theWeek isEqualToString:@"Saturday"]){
            chinaStr = @"六";
        }else if([theWeek isEqualToString:@"Sunday"]){
            chinaStr = @"日";
        }
    }
    return chinaStr;
}


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
    [_collectionView registerClass:[GGT_OrderTimeCollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    //这个是横向滑动
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self addSubview:_collectionView];

    
    //这是头部与脚部的注册
    [_collectionView registerClass:[GGT_OrderTimeHeaderCollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionHeaderView"];

    
    
    
    NSArray *idArray = @[@"13",@"34",@"1",@"4",@"14",@"20",@"28",@"21",@"24",@"17",@"5",@"18",@"10",@"19",@"22",@"538",@"9",@"11",@"15",@"8",@"7",@"30",@"29",@"23",@"16",@"2",@"6",@"27",@"3",@"32",@"33",@"31",@"26",@"25",@"12"];
    
    _dateArray = [NSMutableArray array];
    _dateArray = (NSMutableArray *)idArray;
    [_collectionView reloadData];
    
    
}


#pragma mark 以下是UICollectionView的代理
//返回每个item
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GGT_OrderTimeCollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    
    
    [cell getCellStr:[NSString stringWithFormat:@"%@",[_dateArray objectAtIndex:indexPath.row]]];
    
//    if (isClern == YES) {
//        cell.nameLabel.textColor = [UIColor colorWithHexString:@"#666666"];
//        cell.contentView.backgroundColor = [UIColor colorWithHexString:@"f3f4f8"];
//    }
    
    
    return cell;
}

//返回分区个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//返回每个分区的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_dateArray count];
}

//头部和脚部的加载
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    GGT_OrderTimeHeaderCollectionViewCell *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionHeaderView" forIndexPath:indexPath];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(110, 20, 100, 30)];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        label.text=@"头";
    }
    view.backgroundColor = UICOLOR_RANDOM_COLOR();
    [view addSubview:label];
    
    return view;
}

//每一个分组的上左下右间距
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
//    return UIEdgeInsetsMake(5, 5, 5, 5);
    return UIEdgeInsetsMake(16, 32, 26,20);

}

//头部试图的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(50, 60);
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
    CGSize describeSize=[[NSString stringWithFormat:@"%@",[_dateArray objectAtIndex:indexPath.row]] boundingRectWithSize:CGSizeMake(200, 24) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    
    return CGSizeMake(describeSize.width+16, 24);
}



//定义每个UICollectionView 的纵向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}


-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


@end
