//
//  LoginAndRegisterManager.m
//  Health
//
//  Created by 张涛 on 16/6/8.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "LoginAndRegisterManager.h"

@implementation LoginAndRegisterManager

//测试
- (void)requestTest:(NSDictionary *)entranceDic returnBack:(void(^)(StatusManager *status))handle
{
    HEntance *entrance = [[HEntance alloc] init];
    [entrance addUrlString:URL_TEST];
    [entrance addBodyDic:entranceDic];
    
    [self post:entrance returnBack:^(StatusManager *status, NSDictionary *bodyDic) {
        
    } failedBack:^(StatusManager *status) {
        
    }];
}

- (void)registerForChodeType:(NSString *)phone andUserType:(int)userType andChodeType:(int)chodeType returnBack:(void(^)(StatusManager *status,NSString* chcode))handle{
    HEntance *entrance = [[HEntance alloc] init];
    [entrance addCMD:CMD_CHCODE];
    [entrance addUrlString:URL_REGISTER];
    [entrance addObject:phone forKey:@"phone"];
    [entrance addObject:@(userType) forKey:@"userType"];
    [entrance addObject:@(chodeType) forKey:@"chodeType"];
    
    [self post:entrance returnBack:^(StatusManager *status, NSDictionary *bodyDic) {
        NSString *chcode = bodyDic[@"chcode"];
        if (chcode != nil && ![chcode isEqualToString:@""]) {
            handle(status,chcode);
        }
    } failedBack:^(StatusManager *status) {
        handle(status,nil);
    }];
}

- (void)registerForAccount:(NSDictionary *)entranceDic returnBack:(void(^)(StatusManager *status,long userId))handle
{
    HEntance *entrance = [[HEntance alloc] init];
    [entrance addCMD:CMD_REGISTER];
    [entrance addUrlString:URL_REGISTER];
    [entrance addBodyDic:entranceDic];
    
    [self post:entrance returnBack:^(StatusManager *status, NSDictionary *bodyDic) {
        long userId = [bodyDic[@"userId"] longValue];
        if (userId != 0) {
            handle(status,userId);
        }
    } failedBack:^(StatusManager *status) {
        handle(status,kFailed);
    }];
}

- (void)login:(NSDictionary *)entranceDic  returnback:(void(^)(StatusManager *status,LoginInfo *info))handle;
{
    HEntance *entrance = [[HEntance alloc] init];
    [entrance addBodyDic:entranceDic];
    [entrance addCMD:CMD_LOGIN];
    [entrance addUrlString:URL_REGISTER];
    
    [self post:entrance returnBack:^(StatusManager *status, NSDictionary *bodyDic) {
        LoginInfo *info = [[LoginInfo alloc] init];
        [info setValuesForKeysWithDictionary:bodyDic];
        handle (status,info);
    } failedBack:^(StatusManager *status) {
        handle (status,nil);
    }];
}



@end
