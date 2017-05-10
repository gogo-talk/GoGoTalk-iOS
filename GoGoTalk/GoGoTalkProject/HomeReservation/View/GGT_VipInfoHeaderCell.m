//
//  GGT_VipInfoHeaderCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/8.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_VipInfoHeaderCell.h"

@implementation GGT_VipInfoHeaderCell

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
    
    
    //虚线
    for (int i=0; i<2; i++) {
        UIView *lineView = [[UIView alloc]init];
        lineView.frame = CGRectMake(LineX(118)*(i+1), LineY(18.5), LineW(0.5), LineH(33));
        //划虚线边框
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        [shapeLayer setBounds:self.bounds];
        [shapeLayer setPosition:self.center];
        [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
        
        // 设置虚线颜色为blackColor
        [shapeLayer setStrokeColor:[UICOLOR_FROM_HEX(ColorCCCCCC) CGColor]];
        
        // 3.0f设置虚线的宽度
        [shapeLayer setLineWidth:LineW(0.5)];
        [shapeLayer setLineJoin:kCALineJoinRound];
        
        // 3=线的宽度 1=每条线的间距
        [shapeLayer setLineDashPattern:
        [NSArray arrayWithObjects:[NSNumber numberWithInt:3],
        [NSNumber numberWithInt:2],nil]];

        // Setup the path
        CGMutablePathRef path = CGPathCreateMutable();
        // 0,10代表初始坐标的x，y
        // 320,10代表初始坐标的x，y
        CGPathMoveToPoint(path, NULL, LineX(118)*(i+1), LineY(18.5));
        CGPathAddLineToPoint(path, NULL, LineX(118)*(i+1),LineH(51.5));
        
        [shapeLayer setPath:path];
        CGPathRelease(path);
        // 可以把self改成任何你想要的UIView, 下图演示就是放到UITableViewCell中的
        [self.bgView.layer addSublayer:shapeLayer];
        [self.bgView addSubview:lineView];
    }
    
    
    
    NSArray *iconImgArray = @[@"chidao_xuexishuju",@"yixue_xuexishuju",@"quexi_xuexishuju"];
    NSArray *unitArray = @[@"次",@"分",@"次"];
    NSArray *desArray = @[@"迟到",@"已学",@"缺席"];
    for (int i = 0; i < 3; i ++) {
        //迟到次数
        UIImageView *laterImgView = [[UIImageView alloc]init];
        laterImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",iconImgArray[i]]];
        [self.bgView addSubview:laterImgView];
        

        //迟到次数
        UILabel *numLabel  = [[UILabel alloc]init];
        numLabel.font = Font(24);
        numLabel.tag = 200 + i;
        numLabel.textColor = UICOLOR_FROM_HEX(Color333333);
        [self.bgView addSubview:numLabel];

        
        [laterImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bgView.mas_left).with.offset(LineX(30)+LineW(118)*i);
            make.top.equalTo(self.bgView.mas_top).with.offset(LineY(18));
            make.size.mas_equalTo(CGSizeMake(LineW(24), LineH(24)));
        }];
        
        
        [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(laterImgView.mas_right).with.offset(LineX(5));
            make.top.equalTo(self.bgView.mas_top).with.offset(LineY(20));
            make.height.mas_equalTo(LineH(24));
        }];
        
        
        UILabel *ciLabel  = [[UILabel alloc]init];
        ciLabel.text = unitArray[i];
        ciLabel.font = Font(10);
        ciLabel.textColor = UICOLOR_FROM_HEX(Color999999);
        [self.bgView addSubview:ciLabel];
        
        
        [ciLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(numLabel.mas_right).with.offset(LineX(5));
            make.top.equalTo(self.bgView.mas_top).with.offset(LineY(27));
            make.height.mas_equalTo(LineH(10));
        }];

        
        UILabel *chidaoLabel  = [[UILabel alloc]init];
        chidaoLabel.text = desArray[i];
        chidaoLabel.font = Font(10);
        chidaoLabel.textColor = UICOLOR_FROM_HEX(Color999999);
        [self.bgView addSubview:chidaoLabel];
        
        
        [chidaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(numLabel.mas_left);
            make.top.equalTo(numLabel.mas_bottom).with.offset(LineY(5));
            make.height.mas_equalTo(LineH(10));
        }];
    }
   
    
    //迟到次数
    UILabel *label1 = (UILabel *)[self viewWithTag:200];
    self.lateCountLabel = label1;
    
    
    //已学时长
    UILabel *label2 = (UILabel *)[self viewWithTag:201];
    self.learnTimeLabel = label2;
    
    //缺席次数
    UILabel *label3 = (UILabel *)[self viewWithTag:202];
    self.missCountLabel = label3;
    
}


@end
