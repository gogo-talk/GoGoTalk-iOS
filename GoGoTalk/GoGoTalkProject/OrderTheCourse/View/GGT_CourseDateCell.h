//
//  GGT_CourseDateCell.h
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/16.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGT_PageControl.h"
#import "GGT_OrderCourseCollectionViewCell.h"
#import "GGT_DateModel.h"

static CGFloat const xc_cellWidth = 102.0f;
static CGFloat const xc_cellHeight = 78.0f;
static CGFloat const xc_cellMargin = 20.0f;
typedef void(^GetDateBlock)(NSString *dateTime);

@interface GGT_CourseDateCell : UITableViewCell
@property (nonatomic, copy) GetDateBlock getDateBlock;
@property (nonatomic, strong) GGT_PageControl *pageControl;
@property (nonatomic, strong) UIPageControl *currentPageControl;
@property BOOL reFresh;

-(void)getArray:(NSArray *)array;
@end
