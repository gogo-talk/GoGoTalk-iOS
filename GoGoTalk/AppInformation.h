//
//  AppInformation.h
//  GoGoTalk
//
//  Created by 辰 on 2017/4/27.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#ifndef AppInformation_h
#define AppInformation_h



//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"😯😯😄😄\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//屏幕尺寸
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

//等比
#define GGTFrom_X(value) (value*SCREEN_WIDTH)/375
//字体等比
#define GGT_font(font) [UIFont systemFontOfSize:SXFrom_X(font)]


//字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))
//数组是否为空
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))
//字典是否为空
#define IsDicEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))


//公司地址
#define PrefixAddress @"http://www.gogo-talk.com"


#define MainColor [UIColor colorWithHexString:@"#ea5514"]


/**
 @abstract UIAlterController弹框.
 **/
#define LOSAlert(msg) {UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];[alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:0 handler:^(UIAlertAction * _Nonnull action) {}]];;[self presentViewController:alertController animated:YES completion:nil];}
/**
 @abstract 打印CGRECT.
 **/
static inline void DLOG_CGRECT(CGRect rect)
{
    NSLog(@"x = %lf,y = %lf,w = %lf,h = %lf",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
}
/**
 @abstract 打印CGSIZE.
 **/
static inline void DLOG_CGSIZE(CGSize size)
{
    NSLog(@"w = %lf,h = %lf",size.width,size.height);
}
/**
 @abstract 打印CGPOINT.
 **/
static inline void DLOG_CGPOINT(CGPoint point)
{
    NSLog(@"x = %lf,y = %lf",point.x,point.y);
}
/**
 @abstract 获取本机上的软件版本.
 **/
static inline NSString *APP_VERSION()
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}
/**
 @abstract 判断本机是否为iPhone4或者iPhone4s.
 **/
static inline BOOL iPhone4()
{
    return [UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO;
}
/**
 @abstract 判断本机是否为iPhone5或者iPhone5s.
 **/
static inline BOOL iPhone5()
{
    return [UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO;
}
/**
 @abstract 判断本机是否为iPhone6.
 **/
static inline BOOL iPhone6()
{
    return [UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO;
}
/**
 @abstract 判断本机是否为iPhone6Plus.
 **/
static inline BOOL iPhone6Plus()
{
    return [UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO;
}

/*
 @abstract 判断是否是iPad
 */
static inline BOOL iPad()
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

/**
 @abstract 根据HEX值来获取UICOLOR.
 **/
static inline UIColor *UICOLOR_FROM_HEX(NSInteger hex)
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0];
}
/**
 @abstract 根据RGB值来获取UICOLOR.
 **/
static inline UIColor *UICOLOR_FROM_RGB(CGFloat r,CGFloat g,CGFloat b)
{
    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1.0];
}
/**
 @abstract 根据RGB值来获取UICOLOR. alpha=1不透明 alpha=0透明
 **/
static inline UIColor *UICOLOR_FROM_RGB_ALPHA(CGFloat r,CGFloat g,CGFloat b,CGFloat a)
{
    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a];
}
/**
 @abstract 随机色
 **/
static inline UIColor *UICOLOR_RANDOM_COLOR()
{
    return UICOLOR_FROM_RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255));
}

/**
 @abstract 获取本机的操作系统版本.
 **/
static inline NSString* DEVICE_SYSTEM_VERSION()
{
    return [[UIDevice currentDevice] systemVersion];
}
/**
 @abstract 判断本机的版本是否为v版本.
 **/
static inline BOOL SYSTEM_VERION_EQUAL_TO(double v)
{
    return DEVICE_SYSTEM_VERSION().doubleValue == v;
}
/**
 @abstract 判断本机的版本是否为v版本.
 **/
static inline BOOL SYSTEM_VERSION_GETATER_THAN(double v)
{
    return DEVICE_SYSTEM_VERSION().doubleValue >v;
}
/**
 @abstract 判断本机的版本是否为v版本.
 **/
static inline BOOL SYSTEM_VERSION_GETATER_THAN_OR_EQUAL_TO(double v)
{
    return DEVICE_SYSTEM_VERSION().doubleValue >= v;
}
/**
 @abstract 判断本机的版本是否为v版本.
 **/
static inline BOOL SYSTEM_VERSION_LESS_THAN(double v)
{
    return DEVICE_SYSTEM_VERSION().doubleValue < v;
}
/**
 @abstract 判断本机的版本是否为v版本.
 **/
static inline BOOL SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(double v)
{
    return __IPHONE_OS_VERSION_MAX_ALLOWED <= v;
}
/**
 @abstract 根据name来获取图片.
 **/
static inline UIImage *UIIMAGE_FROM_NAME(NSString *name)
{
    return [UIImage imageNamed:name];
}
/**
 @abstract 根据path和type来获取图片.
 @param path 需要查找的文件路径.
 @param type 需要查找的文件类型.(PNG,JPG)
 **/
static inline UIImage *UIIMAGE_FROM_PATH_AND_TYPE(NSString *path,NSString *type)
{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:path ofType:type]];
}





#endif /* AppInformation_h */
