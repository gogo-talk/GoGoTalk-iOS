//
//  GGT_FeedbackMessageController.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/11.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_FeedbackMessageController.h"

@interface GGT_FeedbackMessageController ()

@end

@implementation GGT_FeedbackMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UICOLOR_FROM_HEX(0xf2f2f2);
    [self initViews];
}
-(void)initViews{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yijianfankui_wode"]];
    [imageView sizeToFit];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).with.offset(30);
    }];
    UILabel *hiLabel = [UILabel new];
    hiLabel.textColor = UICOLOR_FROM_HEX(0x333333);
    hiLabel.text = @"Hi:";
    hiLabel.font = Font(16);
    [hiLabel sizeToFit];
    [self.view addSubview:hiLabel];
    [hiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.top.equalTo(imageView.mas_bottom).with.offset(LineY(40));
    }];
    UILabel *messageLabel = [UILabel new];
    messageLabel.numberOfLines = 0;
//    messageLabel.text = @"  您的反馈已经提交成功，GoGoTalk团队会将您提出的建议纳入产品和服务的优化改进中，谢谢您的关注！";
//    messageLabel.font = Font(15);
    
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    //paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    //paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = 6; //设置行间距
    //paraStyle.hyphenationFactor = 1.0;
    //paraStyle.firstLineHeadIndent = 0.0;
    //paraStyle.paragraphSpacingBefore = 0.0;
    //paraStyle.headIndent = 0;
    //paraStyle.tailIndent = 0;
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:13], NSParagraphStyleAttributeName:paraStyle};
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:@"  您的反馈已经提交成功，GoGoTalk团队会将您提出的建议纳入产品和服务的优化改进中，谢谢您的关注！" attributes:dic];
    messageLabel.attributedText = attributeStr;
    messageLabel.textColor = UICOLOR_FROM_HEX(0x333333);
    [messageLabel sizeToFit];
    [self.view addSubview:messageLabel];
    [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.top.equalTo(hiLabel.mas_bottom).with.offset(LineY(15));
        make.right.equalTo(self.view.mas_right).with.offset(-20);
    }];
    UILabel *comLabel = [UILabel new];
    comLabel.textColor = UICOLOR_FROM_HEX(0x666666);
    comLabel.text = @"GoGoTalk团队";
    comLabel.font = Font(14);
    [comLabel sizeToFit];
    [self.view addSubview:comLabel];
    [comLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(messageLabel.mas_bottom).with.offset(30);
        make.right.equalTo(self.view.mas_right).with.offset(-20);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
