//
//  GGT_DateModel.h
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/16.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    XCCellITypeSelect,              // 0    // 选中的cell
    XCCellTypeDeselect,         // 1    // 没有预约课
} XCCellType;

@interface GGT_DateModel : NSObject
@property (nonatomic, assign) XCCellType selectType;
@property (nonatomic, assign) NSInteger IsPuncTuation;
@property (nonatomic, strong) NSString *Time;
@property (nonatomic, strong) NSString *WeekDay;
@property (nonatomic, strong) NSString *DateTime;
@end

