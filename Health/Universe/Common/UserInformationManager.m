//
//  UserInformationManager.m
//  Health
//
//  Created by 张涛 on 16/6/10.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "UserInformationManager.h"

@implementation UserInformationManager

//患者获取自己的用户信息
- (void)requestforPatientInfo:(int)userId returnBack:(void(^)(StatusManager *status,PatientInfo *info))handle
{
    HEntance *entrance = [[HEntance alloc] init];
    [entrance addObject:@(userId) forKey:@"userId"];
    [entrance addCMD:CMD_PATIENTINFO];
    [entrance addUrlString:URL_USER];
    
    [self post:entrance returnBack:^(StatusManager *status, NSDictionary *bodyDic) {
        PatientInfo *patientInfo = [[PatientInfo alloc] initWithDictionary:bodyDic];
        handle(status,patientInfo);
    } failedBack:^(StatusManager *status) {
        handle(status,nil);
    }];
}

@end
