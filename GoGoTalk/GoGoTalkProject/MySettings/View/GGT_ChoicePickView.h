//
//  GGT_ChoicePickView.h
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/15.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PickViewType) {
    BirthdayType,
    SexType,
    AddressType,
};

/**
 取消按钮的block
 */
typedef void(^CancleBlock) (BOOL cancleBool);
/**
 生日
 */
typedef void(^BirthdayBlock) (NSString *dateStr);
/**
性别
 */
typedef void(^SexBlock) (NSString *sexStr);
/**
所在地
 */
typedef void(^AddressBlock) (NSString *addressStr,NSString *addressIdStr);

@interface GGT_ChoicePickView : UIView <UIPickerViewDataSource,UIPickerViewDelegate>
- (instancetype)initWithFrame:(CGRect)frame method:(NSInteger)method;

//生日
@property (nonatomic, copy) BirthdayBlock birthdayBlock;
//性别
@property (nonatomic, copy) SexBlock sexBlock;
//所在地
@property (nonatomic, copy) AddressBlock addressBlock;
//取消按钮
@property (nonatomic, copy) CancleBlock cancleBlock;

@end
