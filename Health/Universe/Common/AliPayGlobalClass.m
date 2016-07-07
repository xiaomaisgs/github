//
//  ApliPayGlobalClass.m
//  Health
//
//  Created by 张涛 on 16/6/22.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "AliPayGlobalClass.h"

@implementation AliPayGlobalClass

@end

@implementation AliPayProduct
{
    @private
    NSString *_orderID;
}

- (void)setOrderId:(NSString *)orderId
{
    [self generateOrderId:orderId];
    self.orderId = orderId;
}

- (NSString *)orderId
{
    return _orderID;
}


//订单规则
- (void)generateOrderId:(NSString *)sourceOrderID
{
    static int number = 15;
    NSMutableString *resultStr = [NSMutableString string];
    srand((unsigned)time(0));
    for (int i = 0; i < number; i++) {
        unsigned index = rand() % sourceOrderID.length;
        NSString *oneOrder = [sourceOrderID substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneOrder];
    }
    _orderID = resultStr;
}

@end