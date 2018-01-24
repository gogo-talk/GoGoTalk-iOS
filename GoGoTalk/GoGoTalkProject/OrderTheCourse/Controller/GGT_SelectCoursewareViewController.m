//
//  GGT_SelectCoursewareViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/10.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_SelectCoursewareViewController.h"

@interface GGT_SelectCoursewareViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) NSInteger selcetedIndex;

@property (nonatomic, copy) NSString *selectStr;

@end

@implementation GGT_SelectCoursewareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选择课件";
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    
    [self setLeftItem:@"guanbi_xuanzekejian"];
    [self setRightBarButtonItemTitle:@"确定"];
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, LineY(10), SCREEN_WIDTH(), SCREEN_HEIGHT()-64-LineH(10)) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [self.view addSubview:self.tableView];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"TableViewCell"];
    }

    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return LineH(49);
}


- (void)rightAction {
    if (self.changeBlock) {
        self.changeBlock(self.selectStr);
    }
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
