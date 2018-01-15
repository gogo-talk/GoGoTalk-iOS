//
//  GGT_InfoListViewController.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_InfoListViewController.h"
#import "GGT_InfoListCell.h"
#import "GGT_EditUserInfoController.h"
#import "GGT_EditPasswordController.h"
#import "UIImage+Category.h"
#import "GGT_ChoicePickView.h"

@interface GGT_InfoListViewController() <UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *leftTitleArray;
@end


@implementation GGT_InfoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    self.navigationItem.title = @"个人信息";
    [self setLeftBackButton];
    
    
    [self createTableView];
    [self getLoadData];
    
    
}

- (void)getLoadData {
    NSArray *array1 = @[@"头像"];
    NSArray *array2 = @[@"手机号",@"英文名",@"中文名",@"生日",@"性别",@"家长称呼",@"所在地"];
    NSArray *array3 = @[@"修改密码"];

    self.leftTitleArray = [NSMutableArray array];
    self.leftTitleArray = [NSMutableArray arrayWithObjects:array1,array2,array3, nil];
    [self.tableView reloadData];
}



-(void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
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
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return 1;
    }else if(section == 1){
        return 7;
    } else {
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellStr = @"GGT_InfoListCell";
    GGT_InfoListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if(cell == nil){
        cell = [[GGT_InfoListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    

    cell.leftLabel.text = [[self.leftTitleArray safe_objectAtIndex:indexPath.section] safe_objectAtIndex:indexPath.row];
    cell.rightLabel.text = [[self.leftTitleArray safe_objectAtIndex:indexPath.section] safe_objectAtIndex:indexPath.row];

    if (indexPath.section == 0) {
        cell.headerImgButton.hidden = NO;
        [cell.headerImgButton addTarget:self action:@selector(headerImgButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        [cell freshCell:YES];
    } else {
        [cell freshCell:NO];
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 1:
            switch (indexPath.row) {
                case 1: //英文名
                {
                    GGT_EditUserInfoController *vc = [[GGT_EditUserInfoController alloc]init];
                    vc.navigationItem.title = @"英文名";
                    vc.placeStr = @"请输入您的英文名";
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                case 2: //中文名
                {
                    GGT_EditUserInfoController *vc = [[GGT_EditUserInfoController alloc]init];
                    vc.navigationItem.title = @"中文名";
                    vc.placeStr = @"请输入您的中文名";
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                case 3: //生日
                {
                    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH(), SCREEN_HEIGHT())];
                    bgView.backgroundColor = [UIColor blackColor];
                    bgView.alpha = 0.5;
                    [self.view.window addSubview:bgView];
                    
                    
                    GGT_ChoicePickView *view = [[GGT_ChoicePickView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) method:BirthdayType];
                    view.backgroundColor = UICOLOR_FROM_HEX(0xF5F6F8);
                    view.tag = 222;
                    __weak GGT_ChoicePickView *weakview = view;
                    
                    view.birthdayBlock = ^(NSString *dateStr) {
                        [self changePickViewData:dateStr IDStr:@"" type:@"birthdayType"];
                        
                        //默认打印日期是当前日期，今日日期， 2017年05月27日
                        [weakview removeFromSuperview];
                        [bgView removeFromSuperview];
                    };
                    
                    view.cancleBlock = ^(BOOL cancleBool) {
                        [weakview removeFromSuperview];
                        [bgView removeFromSuperview];
                    };
                    
                    [self.view.window addSubview:view];
                    
                    [view mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerX.equalTo(self.view.mas_centerX);
                        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH(), LineH(256)));
                        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
                    }];
                    
                }
                    break;
                case 4: //性别
                {
                    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH(), SCREEN_HEIGHT())];
                    bgView.backgroundColor = [UIColor blackColor];
                    bgView.alpha = 0.5;
                    [self.view.window addSubview:bgView];
                    
                    GGT_ChoicePickView *view = [[GGT_ChoicePickView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) method:SexType];
                    view.backgroundColor = UICOLOR_FROM_HEX(0xF5F6F8);
                    view.tag = 111;
                    __weak GGT_ChoicePickView *weakview = view;
                    view.sexBlock = ^(NSString *dateStr) {
                        //默认选中是男
                        [self changePickViewData:dateStr IDStr:@"" type:@"sexType"];
                        [weakview removeFromSuperview];
                        [bgView removeFromSuperview];

                    };
                    view.cancleBlock = ^(BOOL cancleBool) {
                        [weakview removeFromSuperview];
                        [bgView removeFromSuperview];
                    };
                    [self.view.window addSubview:view];
                    
                    [view mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerX.equalTo(self.view.mas_centerX);
                        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH(), LineH(150)));
                        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
                    }];
                }
                    break;
                case 5: //家长称呼
                {
                    GGT_EditUserInfoController *vc = [[GGT_EditUserInfoController alloc]init];
                    vc.navigationItem.title = @"家长称呼";
                    vc.placeStr = @"请输入您的称呼";
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                case 6: //所在地
                {
                    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH(), SCREEN_HEIGHT())];
                    bgView.backgroundColor = [UIColor blackColor];
                    bgView.alpha = 0.5;
                    [self.view.window addSubview:bgView];
                    
                    GGT_ChoicePickView *view = [[GGT_ChoicePickView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) method:AddressType];
                    view.backgroundColor = UICOLOR_FROM_HEX(0xF5F6F8);
                    __weak GGT_ChoicePickView *weakview = view;
                    view.tag = 333;
                    view.addressBlock = ^(NSString *addressStr,NSString *addressIdStr) {
                        [self changePickViewData:addressStr IDStr:addressIdStr type:@"addressType"];
                        
                        //直接点击完成，打印null，可以默认选中北京市的第一条信息 北京市-北京市-东城区
                        [weakview removeFromSuperview];
                        [bgView removeFromSuperview];
                    };
                    
                    view.cancleBlock = ^(BOOL cancleBool) {
                        [weakview removeFromSuperview];
                        [bgView removeFromSuperview];
                    };
                    [self.view.window addSubview:view];
                    
                    [view mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerX.equalTo(self.view.mas_centerX);
                        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH(), LineH(256)));
                        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
                    }];
                }
                    break;
                    
                default:
                    break;
            }
            break;
        case 2: //修改密码
        {
            GGT_EditPasswordController *vc = [[GGT_EditPasswordController alloc]init];
            vc.navigationItem.title = @"修改密码";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return LineH(75);
    } else if (indexPath.section == 1){
        return LineH(49);
    }else if (indexPath.section == 2){
        return LineH(49);
    }
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return LineH(10);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.width, LineY(10))];
    headerView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    return headerView;
}



#pragma mark 头像设置
-(void)headerImgButtonClick {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *button1 = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //相机相册的选择
        UIImagePickerController * picker=[[UIImagePickerController alloc]init];
        picker.delegate=self;
        picker.allowsEditing = YES;//设置可编辑
        //相机
        if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        [self presentViewController:picker animated:YES completion:nil];
    }];
    
    UIAlertAction *button2 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //相机相册的选择
        UIImagePickerController * picker=[[UIImagePickerController alloc]init];
        picker.delegate=self;
        picker.allowsEditing = YES;//设置可编辑
        [self presentViewController:picker animated:YES completion:nil];
        
    }];
    
    UIAlertAction *button3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:button1];
    [alert addAction:button2];
    [alert addAction:button3];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //获取image   UIImagePickerControllerOriginalImage
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    UIImage *iconImage = [image imageScaledToSize:CGSizeMake(400, 400)];
    
    
    GGT_InfoListCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [cell.headerImgButton setBackgroundImage:iconImage forState:(UIControlStateNormal)];
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)changePickViewData:(NSString *)changeStr   IDStr:(NSString *)idStr  type:(NSString *)Type {
 
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
