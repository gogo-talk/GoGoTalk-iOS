//
//  GGT_Request_URL.h
//  GoGoTalk
//
//  Created by 辰 on 2017/5/10.
//  Copyright © 2017年 Chn. All rights reserved.
//

#ifndef GGT_Request_URL_h
#define GGT_Request_URL_h


static NSString * const BASE_REQUEST_URL = @"http://learnapi.gogo-talk.com:9332";


static NSString * const URL_Resigt = @"/API/User/AddUser";
static NSString * const URL_Login = @"/API/User/AppLogin";
static NSString * const URL_GetChangePasswordSMS = @"/API/User/SendChangePwdSMS";
static NSString * const URL_ChangePwdByCode = @"/API/User/ChangePwdByCode";

#endif /* GGT_Request_URL_h */
