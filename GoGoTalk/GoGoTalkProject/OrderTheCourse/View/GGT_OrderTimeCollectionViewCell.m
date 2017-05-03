//
//  GGT_OrderTimeCollectionViewCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/3.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_OrderTimeCollectionViewCell.h"

@implementation GGT_OrderTimeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 24)];
    _nameLabel.font = [UIFont systemFontOfSize:15];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    [self.contentView addSubview:_nameLabel];
}

-(void)getCellStr:(NSString *)str{
    CGSize describeSize=[str boundingRectWithSize:CGSizeMake(200, 24) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    _nameLabel.text = str;
    _nameLabel.width = describeSize.width+16;
    
}

@end
