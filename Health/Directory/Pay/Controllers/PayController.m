//
//  PayController.m
//  YiLiao_Patient
//
//  Created by ui-design on 16/4/21.
//  Copyright (c) 2016年 常 贤明. All rights reserved.
//

#import "PayController.h"
#import "PayHeaderCell.h"
#import "AliPayManager.h"


#define WECHAT_TAG  500
#define AILPAY_TAG  600

@interface PayController ()
{
    PayType  _payType;
    BOOL     _isSelected;
}
@property (nonatomic, strong) UIScrollView  *scrollV;
@property (nonatomic, strong) PayHeaderCell *headerCell;
@end

@implementation PayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"已提交";
    [self createUI];
}

#pragma mark 创建UI
- (void)createUI {
    self.scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT - 64)];
    self.scrollV.backgroundColor = RGB_COLOR_BACKGROUND;
    self.scrollV.alwaysBounceVertical = YES;
    self.scrollV.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollV];
    
    _headerCell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PayHeaderCell class]) owner:nil options:nil] lastObject];
    _headerCell.frame = CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT - 64);
    _headerCell.searchInfo = self.searchInfo;
    [_headerCell.selectPayType addTarget:self action:@selector(choosePayType:) forControlEvents:UIControlEventTouchUpInside];
    [_headerCell.submit addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    _headerCell.selectPayType.tag = AILPAY_TAG;
    
    [self.scrollV addSubview:_headerCell];
    
    self.scrollV.contentSize = CGSizeMake(UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT);
    
}

//选择付款方式
- (void)choosePayType:(id )sender
{
    for (UIView *subView in _headerCell.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)subView;
            btn.selected = NO;
        }
    }
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
    if (btn.selected) {
        switch (btn.tag) {
            case WECHAT_TAG:
                _payType = PayType_wechat;
                break;
            case AILPAY_TAG:
                _payType = PayType_aliPay;
                break;
            default:
                break;
        }
    }
}

//付款
- (void)submitAction:(id )sender
{
    if (_payType == PayType_wechat) {
        //微信支付

    }else if (_payType == PayType_aliPay){
        //支付宝支付
        [[AliPayManager shareAliPay] payForAlipay:[AliPayProduct new] finishPayBack:^(NSDictionary *resultDic) {
            NSLog(@"%@",resultDic);
        }];
    }
}

-(void)dealloc
{
    NSLog(@"%@-----dealloc",NSStringFromClass([self class]));
}

@end
