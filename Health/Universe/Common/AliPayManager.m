//
//  AliPayManager.m
//  Health
//
//  Created by 张涛 on 16/6/22.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "AliPayManager.h"
#import "Order.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>

#define ALI_PRIVATEKEY @""
#define PARTNER        @""
#define SELLER_ID      @""
#define NOTIFYURL      @""
#define ALIPAY_SERVICE @"mobile.securitypay.pay"
#define SHOWURL        @"m.alipay.com"
#define APPSCHEME      @"alipaysdk"
#define PAYTIME        @"30m"

static AliPayManager *_aliPay;
@implementation AliPayManager
{
    Order *_order;
}

+ (instancetype)shareAliPay
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (nil == _aliPay) {
            _aliPay = [[AliPayManager alloc] init];
        }
    });
    return _aliPay;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _order = [[Order alloc] init];
        _order.partner = PARTNER;
        _order.sellerID = SELLER_ID;
        _order.notifyURL = NOTIFYURL;
        _order.service = ALIPAY_SERVICE;
        _order.itBPay = PAYTIME;
        _order.showURL = SHOWURL;
        _order.inputCharset = @"utf-8";
    }
    return self;
}

- (void)setProductInfo:(AliPayProduct *)product
{
    _order.outTradeNO = product.orderId;
    _order.subject = product.subject;
    _order.body = product.body;
    _order.totalFee = product.price;
}


- (void)payForAlipay:(AliPayProduct *)product finishPayBack:(void (^)(NSDictionary *resultDic))finishPay
{
    [self setProductInfo:product];
    
    NSString *orderSpec = [_order description];
    id <DataSigner> signer = CreateRSADataSigner(ALI_PRIVATEKEY);
    NSString *signedString = [signer signString:orderSpec];
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
    }
    
    [[AlipaySDK defaultService] payOrder:orderString fromScheme:APPSCHEME callback:^(NSDictionary *resultDic) {
        finishPay(resultDic);
    }];
}

@end
