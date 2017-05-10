//
//  BaseService.m
//  Clap
//
//  Created by 辰 on 16/7/29.
//  Copyright © 2016年 Chn. All rights reserved.
//

#import "BaseService.h"

static NSString * const xc_returnCode = @"returnCode";
static NSString * const xc_returnMsg = @"returnMsg";
static NSString * const xc_message = @"message";

@interface BaseService()

@end

@implementation BaseService

+ (instancetype)share
{
    static BaseService *shareInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    
    return shareInstance;
}

- (instancetype)init
{
    if (self = [super init]) {
        
        // 1. 获得网络监控管理者
        AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
        
        // 2. 设置网络状态改变后的处理
        [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            // 当网络状态改变了, 就会调用这个block
            switch (status) {
                case AFNetworkReachabilityStatusUnknown: // 未知网络
                    self.netWorkStaus = AFNetworkReachabilityStatusUnknown;
#ifdef DEBUG
                    [self showExceptionDialog:@"未知网络"];
#endif
                    break;
                    
                case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                    self.netWorkStaus = AFNetworkReachabilityStatusNotReachable;
#ifdef DEBUG
                    [self showExceptionDialog:@"没有网络(断网)"];
#endif
                    break;
                    
                case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                    self.netWorkStaus = AFNetworkReachabilityStatusReachableViaWWAN;
#ifdef DEBUG
                    [self showExceptionDialog:@"手机自带网络"];
#endif
                    break;
                    
                case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                    self.netWorkStaus = AFNetworkReachabilityStatusReachableViaWiFi;
#ifdef DEBUG
                    [self showExceptionDialog:@"WIFI"];
#endif
                    break;
            }
        }];
        
        // 3.开始监控
        [mgr startMonitoring];
        
    }
    return self;
}

#pragma mark - public method
#pragma mark 不带 参数加密
- (void)requestWithPath:(NSString *)urlStr
                 method:(NSInteger)method
             parameters:(id)parameters
                  token:(BOOL)isLoadToken
         viewController:(UIViewController *)viewController
                success:(AFNSuccessResponse)success
                failure:(AFNFailureResponse)failure
{
    
    urlStr = [urlStr stringByAppendingPathComponent:PrefixAddress];
    
    switch (method) {
        case XCHttpRequestGet:
        {
            self.manager = [AFHTTPSessionManager manager];
            //            self.manager.requestSerializer.timeoutInterval = 5;
            [self.manager GET:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                NSDictionary *dic = responseObject;
                if ([[dic objectForKey:xc_returnCode]integerValue] == 0)
                {
                    success(responseObject);
                }
                else {
                    NSError *error = [[NSError alloc]initWithDomain:@"com.gogo-talk.GoGoTalk.HD" code:1001 userInfo:@{xc_message:[dic objectForKey:xc_returnMsg]}];
                    failure(error);
                    [self alertErrorMessage:error];
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure(error);
                //                [self alertErrorMessage:error];
#ifdef DEBUG
                [self alertErrorMessage:error];
#else
                NSError *newError = [[NSError alloc]initWithDomain:@"com.gogo-talk.GoGoTalk.HD" code:1001 userInfo:@{xc_message:@"网络异常"}];
                [self alertErrorMessage:newError];
#endif
            }];
        }
            break;
        case XCHttpRequestPost:
        {
            // 增加请求的head
            if (isLoadToken == YES) {
//                NSString * userTokenStr = [AppHelper readObjectFromUserDefaultsWithKey:userToken];
//                NSMutableDictionary * moDict = [NSMutableDictionary dictionary];
//                [moDict setValue:userTokenStr forKey:userToken];
//                NSString * moString = [NSString jsonStringWithDictionary:moDict];
//                [mgr.requestSerializer setValue:moString forHTTPHeaderField:@"mobilehead"];
            }
            
            [self.manager POST:urlStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *dic = responseObject;
                if ([[dic objectForKey:xc_returnCode]integerValue] == 1)
                {
                    success(responseObject);
                }
                else {
                    NSError *error = [[NSError alloc]initWithDomain:@"com.gogo-talk.GoGoTalk.HD" code:1001 userInfo:@{xc_message:[dic objectForKey:xc_returnMsg], xc_returnCode:[dic objectForKey:xc_returnCode]}];
                    failure(error);
                    [self alertErrorMessage:error];
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure(error);
                //                [self alertErrorMessage:error];
#ifdef DEBUG
                [self alertErrorMessage:error];
#else
                NSError *newError = [[NSError alloc]initWithDomain:@"com.gogo-talk.GoGoTalk.HD" code:1001 userInfo:@{xc_message:@"网络异常"}];
                [self alertErrorMessage:newError];
#endif
            }];
        }
            break;
        case XCHttpRequestDelete:
        {
            [self.manager DELETE:urlStr parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure(error);
                //                [self alertErrorMessage:error];
#ifdef DEBUG
                [self alertErrorMessage:error];
#else
                NSError *newError = [[NSError alloc]initWithDomain:@"com.gogo-talk.GoGoTalk.HD" code:1001 userInfo:@{xc_message:@"网络异常"}];
                [self alertErrorMessage:newError];
#endif
            }];
        }
            break;
        case XCHttpRequestPut:
        {
            [self.manager PUT:urlStr parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure(error);
                //                [self alertErrorMessage:error];
#ifdef DEBUG
                [self alertErrorMessage:error];
#else
                NSError *newError = [[NSError alloc]initWithDomain:@"com.gogo-talk.GoGoTalk.HD" code:1001 userInfo:@{xc_message:@"网络异常"}];
                [self alertErrorMessage:newError];
#endif
            }];
        }
            break;
            
        default:
            break;
    }
}


- (void)sendPostRequestWithPath:(NSString *)url
                     parameters:(NSDictionary *)parameters
                          token:(BOOL)isLoadToken
                 viewController:(UIViewController *)viewController
                        success:(AFNSuccessResponse)success
                        failure:(AFNFailureResponse)failure
{
    [self requestWithPath:url method:XCHttpRequestPost parameters:parameters token:isLoadToken viewController:viewController success:success failure:failure];
}

- (void)sendGetRequestWithPath:(NSString *)url
                viewController:(UIViewController *)viewController
                       success:(AFNSuccessResponse)success
                       failure:(AFNFailureResponse)failure
{
    [self requestWithPath:url method:XCHttpRequestGet parameters:nil token:nil viewController:viewController success:success failure:failure];
}



#pragma mark - private method
#pragma mark 弹出网络错误提示框
- (void)showExceptionDialog:(NSString *)message
{
    NSLog(@"%@", message);
}

#pragma mark 弹出网络错误提示框2
- (void)alertErrorMessage:(NSError *)error
{
    NSDictionary *userInfoDic = error.userInfo;
    UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"" message:userInfoDic[xc_message] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertV show];
    
}

@end
