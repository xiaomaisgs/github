//
//  ApliPayGlobalClass.h
//  Health
//
//  Created by 张涛 on 16/6/22.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "BaseModel.h"

@interface  AliPayGlobalClass: BaseModel

@end


@interface AliPayProduct : BaseModel

@property (nonatomic, copy) NSString *subject;   //订单名称
@property (nonatomic, copy) NSString *body;      //订单描述
@property (nonatomic, copy) NSString *orderId;     //订单号
@property (nonatomic, copy) NSString *price;       //价格
@property (nonatomic, copy) NSString *paymentType;  //1 商品购买
@property (nonatomic, copy) NSString *goodsType;    //具体区分本地交易的商品类型,1：实物交易; (不传情况下的默认值),0：虚拟交易; (不允许使用信用卡等规则)。
@property (nonatomic, copy) NSString *rnCheck;      //支付时是否发起实名校验,F：不发起实名校验; (不传情况下的默认值),T：发起实名校验;(商户业务需要买家实名认证)
@property (nonatomic, copy) NSString *appenv;       //标识客户端来源。参数值内容约定如下：appenv=“system=客户端平台名^version=业务系统版本”
@end