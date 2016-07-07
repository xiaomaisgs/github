//
//  AliPayManager.h
//  Health
//
//  Created by 张涛 on 16/6/22.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "BaseModel.h"
#import "AliPayGlobalClass.h"

@interface AliPayManager : BaseModel

+ (instancetype)shareAliPay;
- (void)payForAlipay:(AliPayProduct *)product finishPayBack:(void (^)(NSDictionary *resultDic))finishPay;

@end
