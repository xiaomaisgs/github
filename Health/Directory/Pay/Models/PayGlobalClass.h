//
//  PayGlobalClass.h
//  Health
//
//  Created by 张涛 on 16/6/22.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "BaseModel.h"

@interface PayGlobalClass : BaseModel

@end


@interface SearchInfo : BaseModel

@property (nonatomic, retain) NSNumber *userId;     // 用户id
@property (nonatomic, retain) NSNumber *type;   //专家类型
@property (nonatomic, retain) NSString *typeDesc;   //专家类型描述
@property (nonatomic, retain) NSNumber *sex;        // 用户性别
@property (nonatomic, retain) NSString *userName;   // 姓名
@property (nonatomic, retain) NSString *headportrait;// 头像
@property (nonatomic, retain) NSNumber *isFriend;   // 是否是好友
@property (nonatomic, retain) NSString *hospital;   //医院
@property (nonatomic, retain) NSString *jobtitle;   // 职称
@property (nonatomic, retain) NSString *dept;  // 科室
@property (nonatomic, retain) NSNumber *price;  //会诊价格
@property (nonatomic, retain) NSNumber *time;   //预约会诊天数
@property (nonatomic, retain) NSString *introduce; //专家简介

@end