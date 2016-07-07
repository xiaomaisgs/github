//
//  PayController.h
//  YiLiao_Patient
//
//  Created by ui-design on 16/4/21.
//  Copyright (c) 2016年 常 贤明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayGlobalClass.h"

typedef enum {
    PayType_aliPay ,
    PayType_wechat
}PayType;

@interface PayController : UIViewController
@property (nonatomic, strong) SearchInfo *searchInfo;
@property (nonatomic, assign) int orderId;
@end
