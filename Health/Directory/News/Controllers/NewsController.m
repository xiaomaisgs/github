//
//  NewsController.m
//  Health
//
//  Created by 张涛 on 16/6/20.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "NewsController.h"
#import "DrawView.h"
#import "SelectsView.h"

@interface NewsController ()
@property (weak, nonatomic) IBOutlet DrawView *drawView;
@property (weak, nonatomic) IBOutlet UIButton *changeColorBtn;
@property (strong, nonatomic) SelectsView *selectedV;
@end

@implementation NewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"画板";
    self.view.backgroundColor  = [UIColor lightGrayColor];
}

- (IBAction)changeColor:(id)sender {
    if (!self.selectedV) {
        self.selectedV = [[SelectsView alloc] initWithArray:@[@"红色",@"绿色",@"紫色"] forSender:self.changeColorBtn];
        [self.view addSubview:self.selectedV];
        [self.view bringSubviewToFront:self.changeColorBtn];
    }
    [self.selectedV show];
    
}

- (IBAction)clearDrawView:(id)sender {
    [self.drawView clear];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
