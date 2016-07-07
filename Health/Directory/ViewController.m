//
//  ViewController.m
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkManager.h"
#import "LoginController.h"
#import "ReplyController.h"
#import <objc/runtime.h>
#import "ShareView.h"
#import "HomeController.h"
#import "SettingController.h"
#import "NewsController.h"
#import "PayController.h"

@interface ViewController ()<LoginControllerDelegate>
{
    UINavigationController *_nav;
    ReplyController *_replyC;
    ShareView *_shareV;
    UITabBarController *_tabbar;
}
@end

#define SEND_BTN_INDEX @"SEND_BTN_INDEX"
#define SEND_BTN_TAG 234
@implementation ViewController

- (void)addChildViewControllers
{
    HomeController *homeVC = [[HomeController alloc] init];
    homeVC.title = @"首页";
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    
    
    SettingController *setVC = [[SettingController alloc] init];
    setVC.title = @"设置";
    UINavigationController *setNav = [[UINavigationController alloc] initWithRootViewController:setVC];
    
    NewsController *news = [[NewsController alloc] init];
    news.title = @"画图";
    UINavigationController *newsNav = [[UINavigationController alloc] initWithRootViewController:news];
    
    PayController *payVC = [[PayController alloc] init];
    payVC.title = @"支付";
    UINavigationController *payNav = [[UINavigationController alloc] initWithRootViewController:payVC];
    
    _tabbar = [[UITabBarController alloc] init];
    _tabbar.tabBar.tintColor = [UIColor lightGrayColor];
    _tabbar.viewControllers = @[homeNav,newsNav,payNav,setNav];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllers];
    if ([UserCenter shareUserCenter].loginInfo.password) {
        [[NetWorkManager manager] startWithAid:nil ver:APPVERSION ln:@"cn" mod:@"ios" sync:1 uuid:nil chcode:nil domain:DOMAIN_ADDRESS];
        [self toLogin];
    }else{
        [self addChildViewController:_tabbar];
        [self.view addSubview:_tabbar.view];
    }
}

- (void)share:(id)sender
{
    NSInteger index = [objc_getAssociatedObject(sender, SEND_BTN_INDEX) integerValue];
    if (index == SEND_BTN_TAG) {
        _shareV = [[ShareView alloc] initWithItems:@[@"微信",@"朋友圈",@"QQ",@"QQ空间",@"新浪好友"]];
        __weak typeof(self)weakSelf = self;
        _shareV.block = ^(int status,int index){
            __strong typeof(self)strongSelf = weakSelf;
            [strongSelf->_shareV removeFromSuperview];
            strongSelf->_shareV = nil;
            if (status) {
                [weakSelf shareAtIndex:index];
            }
        };
        [[UIApplication sharedApplication].keyWindow addSubview:_shareV];
    }
}

- (void)reply:(id)sender
{
    NSInteger index = [objc_getAssociatedObject(sender, SEND_BTN_INDEX) integerValue];
    if (index == SEND_BTN_TAG) {
        _replyC = [[ReplyController alloc] initWithNibName:NSStringFromClass([ReplyController class]) bundle:nil];
        __weak typeof(self)weakSelf = self;
        _replyC.rBlock = ^(int stadus,NSString *content){
            __strong typeof(self)strongSelf = weakSelf;
            [strongSelf->_replyC.view removeFromSuperview];
            strongSelf->_replyC = nil;
            
            if (stadus == ReplyStatus_Send) {
                
            }
        };
        [[UIApplication sharedApplication].keyWindow addSubview:_replyC.view];
    }
}

- (void)toLogin
{
    LoginController *loginVC = [[LoginController alloc] init];
    loginVC.loginDelegate = self;
    _nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [self.view addSubview:_nav.view];
}

- (void)toRegister
{
    
}

- (void)findPassword
{
    
}

- (void)successLogin
{
    [UserCenter shareUserCenter].loginStatus = YES;
    
    [[NetWorkManager manager] startWithAid:nil ver:APPVERSION ln:@"cn" mod:@"ios" sync:1 uuid:[[UserCenter shareUserCenter].loginInfo.userId stringValue] chcode:[[UserCenter shareUserCenter].loginInfo.chcode stringValue] domain:DOMAIN_ADDRESS];
    
    
    if (_nav) {
        [_nav.view removeFromSuperview];
        _nav = nil;
    }
}

- (void)shareAtIndex:(int)index
{
    
}
@end
