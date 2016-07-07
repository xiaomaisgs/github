//
//  UserCenter.m
//  Health
//
//  Created by 张涛 on 16/6/10.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "UserCenter.h"

@implementation UserCenter
static UserCenter *userCenter = nil;
+ (instancetype)shareUserCenter
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (nil == userCenter) {
            userCenter = [[UserCenter alloc] init];
        }
    });
    return userCenter;
}

-(void)setLoginInfo:(LoginInfo *)loginInfo
{
    [UToolBox archiveObject:loginInfo];
}

-(LoginInfo *)loginInfo
{
    Class objClass = [LoginInfo class];
    return [UToolBox unarchiveObjClass:objClass];
}

- (void)setPatientInfo:(PatientInfo *)patientInfo
{
    [UToolBox archiveObject:patientInfo];
}

-(PatientInfo *)patientInfo
{
    Class objClass = [PatientInfo class];
    return [UToolBox unarchiveObjClass:objClass];
}

- (void)setDoctorInfo:(DoctorInfo *)doctorInfo
{
    [UToolBox archiveObject:doctorInfo];
}

-(DoctorInfo *)doctorInfo
{
    Class objClass = [DoctorInfo class];
    return [UToolBox unarchiveObjClass:objClass];
}

- (void)setExpertInfo:(ExpertInfo *)expertInfo
{
    [UToolBox archiveObject:expertInfo];
}

- (ExpertInfo *)expertInfo
{
    Class objClass = [ExpertInfo class];
    return [UToolBox unarchiveObjClass:objClass];
}

@end
