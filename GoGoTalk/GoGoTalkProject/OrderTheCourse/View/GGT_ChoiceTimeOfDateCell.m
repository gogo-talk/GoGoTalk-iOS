//
//  GGT_ChoiceTimeOfDateCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/16.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ChoiceTimeOfDateCell.h"
#import "GGT_OrderCourseCollectionViewCell.h"

static CGFloat const xc_cellWidth = 51.0f;
static CGFloat const xc_cellHeight = 50.0f;

@interface GGT_ChoiceTimeOfDateCell() <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *xc_collectionView;
@property (nonatomic, strong) NSMutableArray *xc_dateMuArray;
@end


@implementation GGT_ChoiceTimeOfDateCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
        [self getLoadData];
    }
    return self;
}

- (void)getLoadData {
    self.xc_dateMuArray = [NSMutableArray array];
    for (NSInteger i=0; i<14; i++) {
        [self.xc_dateMuArray addObject:[NSString stringWithFormat:@"%ld",(long)i]];
    }
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
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"选择日期";
    titleLabel.font = Font(14);
    titleLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    [self addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView.mas_right).offset(LineX(5));
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
    xc_layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
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
        make.top.equalTo(titleLabel.mas_bottom).with.offset(LineY(15));
        make.left.equalTo(self.mas_left).offset(LineX(12.5));
        make.right.equalTo(self.mas_right).offset(-LineX(12.5));
        make.height.mas_equalTo(LineY(xc_cellHeight));
    }];
    
    // 注册collectionViewCell
    [self.xc_collectionView registerClass:[GGT_OrderCourseCollectionViewCell class] forCellWithReuseIdentifier:@"GGT_OrderCourseCollectionViewCell"];
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
    return LineH(0);
}

//返回行间距 上下间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return LineH(0);
}

//定义每个UICollectionView 的间距
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(LineY(0), LineX(20), LineY(0), LineX(20));
//}

// 设置cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"GGT_OrderCourseCollectionViewCell";
    GGT_OrderCourseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];

    return cell;
}

// 设置header和footer
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
}

// collectionView的footer高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(0, 0);
}

// collectionView的header高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0, 0);
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
