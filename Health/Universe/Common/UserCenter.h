//
//  UserCenter.h
//  Health
//
//  Created by 张涛 on 16/6/10.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserCenter : NSObject

@property (nonatomic, assign) BOOL loginStatus;

@property (nonatomic, retain) LoginInfo *loginInfo;
@property (nonatomic, retain) PatientInfo *patientInfo;
@property (nonatomic, retain) DoctorInfo *doctorInfo;
@property (nonatomic, retain) ExpertInfo *expertInfo;

+ (instancetype)shareUserCenter;

@end
