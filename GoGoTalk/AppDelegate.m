//
//  AppDelegate.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "AppDelegate.h"
#import <IQKeyboardManager.h>
#import <Bugly/Bugly.h>
#import "BaseTabBarController.h"
#import "GGT_NewFeatherViewController.h"
#import "GGT_LoginViewController.h"

#define kBuglyAppId      @"ab92f40c75"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self initKeyWindow];
    
    [Bugly startWithAppId:kBuglyAppId];
    
    [self initIQKeyboardManager];
    
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
        if ([[userDefaults objectForKey:@"login"] isEqualToString:@"yes"]){
            
            UINavigationController *mainVc = [[UINavigationController alloc]initWithRootViewController:tabVc];
            self.window.rootViewController = mainVc;
            
        }else{
            UINavigationController *mainVc = [[UINavigationController alloc]initWithRootViewController:loginVc];
            self.window.rootViewController = mainVc;
        }
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


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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
