//
//  BaseNetManager.m
//  GoGoTalk
//
//  Created by 辰 on 2017/4/27.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "BaseNetManager.h"

@implementation BaseNetManager

+ (void)afGetRequest:(NSString *)urlString contentType:(NSString *)type finished:(RequestFinishedBlock)finishedBlock failed:(RequestFailedBlock)failedBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if (type.length) {
        //jason
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:type, nil];
    }else{
        //xml自动解析
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finishedBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failedBlock(error.localizedDescription);
    }];
}

+ (void)afPostRequest:(NSString *)urlString parms:(NSDictionary *)dic finished:(RequestFinishedBlock)finishedBlock failed:(RequestFailedBlock)failedBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:urlString parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finishedBlock(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failedBlock(error.localizedDescription);

    }];
}

@end
