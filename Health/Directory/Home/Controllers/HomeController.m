//
//  HomeController.m
//  Health
//
//  Created by 张涛 on 16/6/11.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "HomeController.h"
#import <objc/runtime.h>
#import "HomeGlobalClass.h"

@interface HomeController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;
@property (nonatomic, retain) NSMutableArray *dataArray;

@end

#define HEADER_KEY @"HADER_KEY"
#define SELECTION_INDEX 230
@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self prepareData];
    
}

- (void)prepareData
{
    HomeModel *model1 = [[HomeModel alloc] init];
    model1.contentArray = @[@"1",@"2",@"3",@"4"];
    model1.title = @"一";
    HomeModel *model2 = [[HomeModel alloc] init];
    model2.contentArray = @[@"3",@"4",@"5"];
    model2.title = @"二";
    self.dataArray = [NSMutableArray arrayWithObjects:model1,model2, nil];
}

- (void)headAction:(UIButton *)btn
{
    NSInteger selectIndex = [objc_getAssociatedObject(btn, HEADER_KEY) integerValue];
    HomeModel *model = self.dataArray[selectIndex - SELECTION_INDEX];
    model.isHidden = !model.isHidden;
    [self.homeTableView reloadSections:[NSIndexSet indexSetWithIndex:selectIndex - SELECTION_INDEX] withRowAnimation:UITableViewRowAnimationTop];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.dataArray[section] isHidden]) {
        return 0;
    }
    return [self.dataArray[section] contentArray].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return .01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *header = [UIButton buttonWithType:UIButtonTypeCustom];
    [header setTitle:[self.dataArray[section] title] forState:UIControlStateNormal];
    header.titleLabel.tintColor = [UIColor blackColor];
    header.backgroundColor = [ UIColor lightGrayColor];
    [header addTarget:self action:@selector(headAction:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(header, HEADER_KEY, @(SELECTION_INDEX+section), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeModel *home = self.dataArray[indexPath.section];
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = home.contentArray[indexPath.row];
    return cell;
}

@end
