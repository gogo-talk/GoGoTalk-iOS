//
//  GGTalkSingleton.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGTalkSingleton.h"


static GGTalkSingleton *singleton = nil;
@implementation GGTalkSingleton

+ (GGTalkSingleton *)sharedSingleton {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[GGTalkSingleton alloc]init];
    });
    
    return singleton;
}

@end
