//
//  GGT_ChoiceTimeOfTimeCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/16.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ChoiceTimeOfTimeCell.h"

static CGFloat const xc_cellWidth = 63.0f;
static CGFloat const xc_cellHeight = 34.0f;

@interface GGT_ChoiceTimeOfTimeCell() <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *xc_collectionView;
@property (nonatomic, strong) NSArray *xc_dateMuArray;
@end


@implementation GGT_ChoiceTimeOfTimeCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
        [self getLoadData];

    }
    return self;
}

- (void)getLoadData {
    self.xc_dateMuArray = @[@"08:00",@"08:30",@"09:00",@"09:30",@"10:00",@"10:30",@"11:00",@"11:30",@"12:00",@"12:30",@"13:00",@"13:30",@"14:00",@"14:30",@"16:00",@"16:30",@"17:00",@"17:30",@"18:00",@"18:30",@"19:00",@"19:30",@"20:00",@"20:30",@"21:00",@"21:30",@"22:00"];
    [self.xc_collectionView reloadData];
}

-(void)buildUI {
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self addSubview:imgView];
    
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(LineX(10));
        make.top.equalTo(self.mas_top).with.offset(LineY(margin15));
        make.size.mas_equalTo(CGSizeMake(LineW(15), LineW(15)));
    }];
    
    
    UILabel *leftLabel = [[UILabel alloc] init];
    leftLabel.text = @"选择时间";
    leftLabel.font = Font(14);
    leftLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    [self addSubview:leftLabel];
    
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView.mas_right).offset(LineX(5));
        make.top.equalTo(self.mas_top).with.offset(LineY(margin15));
        make.height.mas_equalTo(LineW(15));
    }];
    
    UILabel *rightLabel = [[UILabel alloc] init];
    rightLabel.font = Font(11);
    rightLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    rightLabel.textAlignment = NSTextAlignmentRight;
    //富文本
    NSString *countStr = @"（注:·表示该时间点您已经约过课了哦）";
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:countStr];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:UICOLOR_FROM_HEX(ColorEA5851) range:NSMakeRange(3, 1)];
    rightLabel.attributedText = AttributedStr;
    [self addSubview:rightLabel];
    
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-LineX(10));
        make.top.equalTo(self.mas_top).with.offset(LineY(margin15));
        make.height.mas_equalTo(LineW(15));
    }];
    
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [self addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(LineX(3));
        make.right.equalTo(self.mas_right).offset(-LineX(3));
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(LineH(0.5));
    }];
    
    
#pragma mark ******************collectionView******************
    // collectionView
    UICollectionViewFlowLayout *xc_layout = [[UICollectionViewFlowLayout alloc] init];
    xc_layout.itemSize = CGSizeMake(LineW(xc_cellWidth), LineH(xc_cellHeight));
    xc_layout.minimumLineSpacing = 0;
    xc_layout.minimumInteritemSpacing = 0;
    xc_layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.xc_collectionView = ({
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:xc_layout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.pagingEnabled = YES;
        collectionView.layer.masksToBounds = YES;
        collectionView.layer.cornerRadius = LineH(3);
        collectionView;
    });
    [self addSubview:self.xc_collectionView];
    
    [self.xc_collectionView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leftLabel.mas_bottom).with.offset(LineY(15));
        make.left.equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(-0);
        make.bottom.equalTo(self.mas_bottom).offset(-LineY(0.5));
    }];
    
    // 注册collectionViewCell
    [self.xc_collectionView registerClass:[GGT_OrderTimeCollectionViewCell class] forCellWithReuseIdentifier:@"GGT_OrderTimeCollectionViewCell"];
}

// 组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 每组个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.xc_dateMuArray.count;
}

// 设置cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(LineW(xc_cellWidth), LineH(xc_cellHeight));
}

//返回行内部cell（item）之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return LineW(10);
}

//返回行间距 上下间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return LineW(10);
}

//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(LineY(5), LineX(10), LineY(5), LineX(10));
}

// 设置cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"GGT_OrderTimeCollectionViewCell";
    GGT_OrderTimeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    
//    for (UIView *subView in cell.contentView.subviews) {
//        [subView removeFromSuperview];
//    }
    
    cell.timeLabel.text = [self.xc_dateMuArray safe_objectAtIndex:indexPath.row];
    
    return cell;
}


// 选中cell的时候
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //    GGT_DateModel *model = self.xc_dateMuArray[indexPath.row];
    //    model.selectType = XCCellITypeSelect;
    //    [collectionView reloadData];
    
    
    
    // 选中上面的cell时 要刷新下面数据 请求接口
    //    if (self.getDateBlock) {
    //        self.getDateBlock(model.DateTime);
    //    }
}


// 取消选中cell的时候
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    //    GGT_DateModel *model = self.xc_dateMuArray[indexPath.row];
    //    model.selectType = XCCellTypeDeselect;
    //    [self.xc_dateMuArray replaceObjectAtIndex:indexPath.row withObject:model];
    
}
@end
























#pragma mark  GGT_OrderTimeCollectionViewCell
@implementation GGT_OrderTimeCollectionViewCell
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
        
        self.timeLabel = [[UILabel alloc]init];
        self.timeLabel.textAlignment = NSTextAlignmentCenter;
        self.timeLabel.font = Font(14);
        self.timeLabel.textColor = UICOLOR_FROM_HEX(ColorCCCCCC);
        [self addSubview:self.timeLabel];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY);
            make.height.mas_equalTo(LineH(14));
        }];
        
        
        self.lineView = [[UIView alloc]init];
        self.lineView.backgroundColor = UICOLOR_FROM_HEX(ColorEA5851);
        [self addSubview:self.lineView];
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).with.offset(-LineW(4));
            make.top.equalTo(self.mas_top).with.offset(LineW(4));
            make.size.mas_equalTo(CGSizeMake(LineW(5), LineW(5)));
        }];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineH(3)];
    [self addBorderForViewWithBorderWidth:LineW(1) BorderColor:UICOLOR_FROM_HEX(ColorCCCCCC) CornerRadius:LineH(3)];
    [self.lineView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineW(2.5)];
}

@end
