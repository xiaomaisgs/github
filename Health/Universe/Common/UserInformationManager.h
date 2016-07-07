//
//  UserInformationManager.h
//  Health
//
//  Created by 张涛 on 16/6/10.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "BaseNetWorkManager.h"

@interface UserInformationManager : BaseNetWorkManager

//患者获取自己的用户信息
- (void)requestforPatientInfo:(int)userId returnBack:(void(^)(StatusManager *status,PatientInfo *info))handle;

@end
