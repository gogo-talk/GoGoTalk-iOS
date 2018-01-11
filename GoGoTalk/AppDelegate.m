//
//  AppDelegate.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager.h"
#import <Bugly/Bugly.h>
#import "BaseTabBarController.h"
#import "GGT_NewFeatherViewController.h"
#import "GGT_LoginViewController.h"
#import "BaseNavigationController.h"
#import <AVFoundation/AVFoundation.h>
#import <UMSocialCore/UMSocialCore.h>

#define kBuglyAppId      @"ab92f40c75"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    //设置启动页面时间 ------上线的时候打开，平时启动太慢
//     [NSThread sleepForTimeInterval:2.0];
    
    [self initKeyWindow];
    
    [Bugly startWithAppId:kBuglyAppId];
    
    [self initIQKeyboardManager];
    
    //友盟分享
    [self initUmSocialCore];
    
    [self initVideo];
    
    return YES;
}

- (void)initKeyWindow
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    BaseTabBarController *tabVc = [[BaseTabBarController alloc] init];
    GGT_LoginViewController *loginVc = [[GGT_LoginViewController alloc]init];
    GGT_NewFeatherViewController *newVc = [[GGT_NewFeatherViewController alloc]init];
    
    NSString *currentVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *key = @"version";
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [userDefaults objectForKey:key];
    

    if ([currentVersion isEqualToString:lastVersion]) {
        if ([[userDefaults objectForKey:@"login"] isEqualToString:@"yes"]) {
            
            
            self.window.rootViewController = tabVc;
            tabVc.tabBarController.selectedIndex = 2;
            
        } else {

            BaseNavigationController *mainVc = [[BaseNavigationController alloc]initWithRootViewController:loginVc];
            self.window.rootViewController = mainVc;
        }
        
        //启动图和引导图没有状态栏，之后都加载状态栏---并修改为白色
//        [[UIApplication sharedAp plication] setStatusBarHidden:NO];
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
        
    }else{
        // 卸载重装后或第一次进入应用
        [userDefaults setObject:currentVersion forKey:key];
        self.window.rootViewController = newVc;
    }
    
    
    [self.window makeKeyAndVisible];
}


// 初始化IQKeyboardManager
- (void)initIQKeyboardManager
{
    IQKeyboardManager * manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}

- (void)initVideo
{
    NSError *setCategoryErr = nil;
    NSError *activationErr  = nil;
    [[AVAudioSession sharedInstance]
     setCategory: AVAudioSessionCategoryPlayback
     error: &setCategoryErr];
    [[AVAudioSession sharedInstance]
     setActive: YES
     error: &activationErr];
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    
    UIApplication *app = [UIApplication sharedApplication];
    __block    UIBackgroundTaskIdentifier bgTask;
    bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (bgTask != UIBackgroundTaskInvalid)
            {
                bgTask = UIBackgroundTaskInvalid;
            }
        });
    }];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (bgTask != UIBackgroundTaskInvalid)
            {
                bgTask = UIBackgroundTaskInvalid;
            }
        });
    });
}

#pragma mark 配置友盟分享
- (void)initUmSocialCore {
    /* 打开调试日志 */
    [[UMSocialManager defaultManager] openLog:YES];
    // 打开图片水印
    [UMSocialGlobal shareInstance].isClearCacheWhenGetUserInfo = NO;
    
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"59291db4c62dca0f43001c71"];
    
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxf4f5e464e94b9956" appSecret:@"7b6c16881766b8e43bb0f6d8e5064f26" redirectURL:@"http://mobile.umeng.com/social"];
    
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1106211590"/*设置QQ平台的appID*/  appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
    
    /* 设置新浪的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"221400771"  appSecret:@"16f0baf24de41eae8b1b3bbbc8de06d9" redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
    
}

// 支持所有iOS系统---友盟
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
