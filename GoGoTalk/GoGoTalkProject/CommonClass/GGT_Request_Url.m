//
//  GGT_Request_Url.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_Request_Url.h"

@implementation GGT_Request_Url

//注册
+ (NSString *)URL_Resigt {
    return [NSString stringWithFormat:@"%@/API/User/AddUser",PrefixAddress];
    
}

//登录
+ (NSString *)URL_Login {
    return [NSString stringWithFormat:@"%@/API/User/AppLogin",PrefixAddress];
    
}

//发送修改密码短信
+ (NSString *)URL_GetChangePasswordSMS {
    return [NSString stringWithFormat:@"%@/API/User/SendChangePwdSMS",PrefixAddress];

}

//通过手机验证吗修改密码
+ (NSString *)URL_ChangePwdByCode {
    return [NSString stringWithFormat:@"%@/API/User/ChangePwdByCode",PrefixAddress];
    
}


@end
