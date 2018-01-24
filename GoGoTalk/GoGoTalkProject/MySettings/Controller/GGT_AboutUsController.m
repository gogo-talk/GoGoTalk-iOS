//
//  GGT_AboutUsController.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/9.
//  Copyright © 2017年 XieHenry. All rights reserved.
// H5制作

#import "GGT_AboutUsController.h"
#import "GGT_MyClassTimeHeaderCell.h"
#import "GGT_MyClassTimeCell.h"

@interface GGT_AboutUsController () <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *leftArray;
@property(nonatomic, strong) NSArray *rightArray;

@end

@implementation GGT_AboutUsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    self.navigationItem.title = @"关于我们";
    
    
    [self createTableView];
    [self getLoadData];
}



- (void)getLoadData {
    self.leftArray = @[@"客服电话",@"官方网站",@"微信公众号"];
    self.rightArray = @[@"400-8787-276",@"www.gogo-talk.com",@"GoGoTalk青少英语"];
    [self.tableView reloadData];
}



-(void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    self.tableView.scrollEnabled = NO;
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
}

#pragma mark -- tableViewDelegate & tableViewDatasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellStr = @"GGT_MyClassTimeCell";
    GGT_MyClassTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if(cell == nil){
        cell = [[GGT_MyClassTimeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    cell.leftLabel.text = [self.leftArray safe_objectAtIndex:indexPath.row];
    cell.centerLabel.hidden = YES;
    cell.rightLabel.text = [self.rightArray safe_objectAtIndex:indexPath.row];
    
    if (indexPath.row == 0) {
        cell.rightLabel.textColor = UICOLOR_FROM_HEX(ColorEA5851);
    } else {
        cell.rightLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return LineH(49);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return LineH(154);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.width, LineY(144))];
    headerView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH()-LineH(68))/2, LineY(25), LineH(68), LineH(68))];
    logoView.image = [UIImage imageNamed:@"icon-qidongtubiao"];
    [headerView addSubview:logoView];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, logoView.y+logoView.height+LineY(8), SCREEN_WIDTH(), LineH(13))];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    label1.text = [NSString stringWithFormat:@"V%@",app_Version];
    label1.textColor = UICOLOR_FROM_HEX(ColorEA5851);
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = Font(13);
    [headerView addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, label1.y+label1.height+LineY(8), SCREEN_WIDTH(), LineH(13))];
    label2.text = @"GogoTalk 青少外教英语";
    label2.textColor = UICOLOR_FROM_HEX(Color333333);
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = Font(13);
    [headerView addSubview:label2];
    
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, LineY(144), self.tableView.width, LineY(10))];
    lineView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [headerView addSubview:lineView];
    
    return headerView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
