//
//  GGT_ChoiceTimeOfDateCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/16.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ChoiceTimeOfDateCell.h"
#import "GGT_ChoiceTimeOfDateView.h"
#import "GGT_ChoiceTimeOfDateView.h"


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
    NSMutableArray *arr1 = [NSMutableArray array];
    NSMutableArray *arr2 = [NSMutableArray array];

    for (NSInteger i=0; i<7; i++) {
        [arr1 addObject:[NSString stringWithFormat:@"%ld",(long)i]];
    }
    for (NSInteger i=8; i<14; i++) {
        [arr2 addObject:[NSString stringWithFormat:@"%ld",(long)i]];
    }
    self.xc_dateMuArray = [NSMutableArray arrayWithObjects:arr1,arr2, nil];
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
    
    
#pragma mark ******************UIScrollView******************
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH()*2, LineH(50));
    [self addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(-0);
        make.top.equalTo(titleLabel.mas_bottom).with.offset(LineY(15));
        make.height.mas_equalTo(LineH(50));
    }];
    
    
    GGT_ChoiceTimeOfDateView *dateView1 = [[GGT_ChoiceTimeOfDateView alloc] initWithFrame:CGRectZero getArray: [self.xc_dateMuArray safe_objectAtIndex:0]];
    dateView1.layer.masksToBounds = YES;
    dateView1.layer.cornerRadius = LineH(3);
    dateView1.layer.borderWidth = LineH(1);
    dateView1.layer.borderColor = UICOLOR_FROM_HEX(ColorEA5851).CGColor;
    [scrollView addSubview:dateView1];
    
    [dateView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scrollView.mas_left).offset(0);
        make.top.equalTo(scrollView.mas_top).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH(), LineH(50)));
    }];
    
    
    GGT_ChoiceTimeOfDateView *dateView2 = [[GGT_ChoiceTimeOfDateView alloc] initWithFrame:CGRectZero getArray: [self.xc_dateMuArray safe_objectAtIndex:1]];
    dateView2.layer.masksToBounds = YES;
    dateView2.layer.cornerRadius = LineH(3);
    dateView2.layer.borderWidth = LineH(1);
    dateView2.layer.borderColor = UICOLOR_FROM_HEX(ColorEA5851).CGColor;
    [scrollView addSubview:dateView2];
    
    [dateView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scrollView.mas_left).offset(SCREEN_WIDTH());
        make.top.equalTo(scrollView.mas_top).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH(), LineH(50)));
    }];
    
}




@end
