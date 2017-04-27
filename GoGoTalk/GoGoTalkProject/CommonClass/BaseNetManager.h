//
//  BaseNetManager.h
//  GoGoTalk
//
//  Created by 辰 on 2017/4/27.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
typedef void (^RequestFinishedBlock)(id responseObj);
typedef void (^RequestFailedBlock)(NSString *errorMsg);

@interface BaseNetManager : NSObject

//封装AFNetWorking的get请求逻辑
+ (void)afGetRequest:(NSString *)urlString contentType:(NSString *)type finished:(RequestFinishedBlock)finishedBlock
              failed:(RequestFailedBlock)failedBlock;

//封装AFNetWorking的post请求逻辑
+ (void)afPostRequest:(NSString *)urlString parms:(NSDictionary *)dic finished:(RequestFinishedBlock)finishedBlock failed:(RequestFailedBlock)failedBlock;

@end
