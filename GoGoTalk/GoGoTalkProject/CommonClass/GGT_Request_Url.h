//
//  GGT_Request_Url.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GGT_Request_Url : NSObject
//注册
+ (NSString *)URL_Resigt;

//登录
+ (NSString *)URL_Login;

//发送修改密码短信
+ (NSString *)URL_GetChangePasswordSMS;

//通过手机验证吗修改密码
+ (NSString *)URL_ChangePwdByCode;



@end
