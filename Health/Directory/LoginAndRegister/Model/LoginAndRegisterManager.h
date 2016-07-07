//
//  LoginAndRegisterManager.h
//  Health
//
//  Created by 张涛 on 16/6/8.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "BaseNetWorkManager.h"
#import "LoginAndRegiserClass.h"

@interface LoginAndRegisterManager : BaseNetWorkManager

- (void)requestTest:(NSDictionary *)entranceDic returnBack:(void(^)(StatusManager *status))handle;

//获取验证码
- (void)registerForChodeType:(NSString *)phone andUserType:(int)userType andChodeType:(int)chodeType returnBack:(void(^)(StatusManager *status,NSString* chcode))handle;

//注册账户
- (void)registerForAccount:(NSDictionary *)entranceDic returnBack:(void(^)(StatusManager *status,long userId))handle ;

//登录
- (void)login:(NSDictionary *)entranceDic  returnback:(void(^)(StatusManager *status,LoginInfo *info))handle;

@end
