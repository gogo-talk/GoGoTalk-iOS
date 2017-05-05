//
//  GGT_HomeBannerTableViewCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_HomeBannerTableViewCell.h"

@implementation GGT_HomeBannerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);

        [self initCellView];
    }
    return self;
}

- (void)initCellView {
    self.bgView = [[UIView alloc]init];
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = LineW(5);
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.bgView];
    
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(LineX(10));
        make.right.equalTo(self.contentView.mas_right).with.offset(-LineX(10));
        make.top.equalTo(self.contentView.mas_top).with.offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(0);
    }];
    
}

//-(void)setFrame:(CGRect)frame{
//    
//    frame.origin.x = LineX(5);
//    frame.size.width -= 2* frame.origin.x;
//    
//    frame.origin.y = LineY(5);
//    frame.size.height -= 1.5* frame.origin.y;
//    [super setFrame:frame];
//    
//}


@end
