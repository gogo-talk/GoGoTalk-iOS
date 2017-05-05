//
//  GGT_EditAgeSexController.h
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "BaseBackViewController.h"

@interface GGT_EditAgeSexController : BaseBackViewController
@property(nonatomic, strong) NSString *titleName;  //导航栏标题
@property(nonatomic, strong) NSString *prompt;  //输入框提示信息
@property(nonatomic, strong) NSString *info;
@property(nonatomic, strong) NSDictionary *params;  //参数
@end
