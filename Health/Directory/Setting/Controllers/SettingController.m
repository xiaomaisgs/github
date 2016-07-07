//
//  SettingController.m
//  Health
//
//  Created by 张涛 on 16/6/6.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "SettingController.h"
#import "SetNormalCell.h"
#import "SetSexChooseCell.h"

@interface SettingController ()<UITableViewDelegate,UITableViewDataSource,SetSexChooseCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *setTableView;
@property (strong, nonatomic) NSArray *subjects;
@property (assign, nonatomic) NSInteger sexType;

@end

static NSString *normalCellId = @"noramalCellId";
static NSString *sexCellId = @"sexCellId";
@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"设置";
    self.subjects = @[@"姓名：",@"社保卡号：",@"身份证：",@"生日：",@"性别：",@"区域：",@"病种："];
}

#pragma mark - UITableViewDelegate UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4) {
       SetSexChooseCell *cell = [SetSexChooseCell cellWithTableView:tableView cellId:sexCellId];
        cell.sexChooseDelegate = self;
        return cell;
    }else
    {
        SetNormalCell *cell = [SetNormalCell cellWithTableView:tableView cellId:normalCellId];
        cell.subject.text = self.subjects[indexPath.row];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 3) {
        UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT)];
    }
}

#pragma mark - sexChoosCellDelegate
- (void)sexChooseForType:(SexType )type
{
    self.sexType = type;
}

@end
