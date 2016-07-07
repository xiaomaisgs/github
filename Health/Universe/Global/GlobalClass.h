//
//  GlobalClass.h
//  Health
//
//  Created by 张涛 on 16/6/10.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "BaseModel.h"

@interface GlobalClass : BaseModel

@end

@interface LoginInfo : BaseModel <NSCoding>

@property (nonatomic, retain) NSNumber *userId;
@property (nonatomic, retain) NSNumber *chcode;
@property (nonatomic, retain) NSNumber *createTime;
@property (nonatomic, copy)   NSString *account;
@property (nonatomic, copy)   NSString *password;

@end

@interface PatientInfo : BaseModel<NSCoding>

@property (nonatomic, retain) NSNumber *userId;         // 用户id
@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) NSString *remark;     //备注
@property (nonatomic, retain) NSString *headPortralt;
@property (nonatomic, retain) NSNumber *mobile;
@property (nonatomic, retain) NSString *idNumber;   //身份证
@property (nonatomic, retain) NSString *socialNumber;   //社保卡号
@property (nonatomic, retain) NSString *email;      //
@property (nonatomic, retain) NSNumber *sex;
@property (nonatomic, retain) NSNumber *birthday;
@property (nonatomic, retain) NSNumber *provinceNo; //省份
@property (nonatomic, retain) NSNumber *cityNo;
@property (nonatomic, retain) NSNumber *countryNO;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSNumber *bodyHeight;         // 身高
@property (nonatomic, retain) NSNumber *bodyWeight;         // 体重
@property (nonatomic, retain) NSNumber *extendType;
@property (nonatomic, retain) NSNumber *mpId;
@property (nonatomic, retain) NSString *mpName;
@property (nonatomic, retain) NSString *mpDesc;
@property (nonatomic, retain) NSNumber *createTime;
@property (nonatomic, retain) NSNumber *logoinTime;
@property (nonatomic, retain) NSString *source;
@property (nonatomic, retain) NSNumber *doctorId;
@property (nonatomic, retain) NSNumber *doctorType;

@end

@interface DoctorInfo : BaseModel<NSCoding>

@property (nonatomic, retain) NSNumber *userId;         // 用户id
@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) NSString *headPortralt;
@property (nonatomic, retain) NSNumber *mobile;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSNumber *sex;
@property (nonatomic, retain) NSNumber *birthday;
@property (nonatomic, retain) NSNumber *hospitalId;
@property (nonatomic, retain) NSString *hospitalName;
@property (nonatomic, retain) NSNumber *deptId;
@property (nonatomic, retain) NSString *deptName;
@property (nonatomic, retain) NSNumber *jobtitleId;
@property (nonatomic, copy) NSString *jobtitle;
@property (nonatomic, retain) NSString *introduce;
@property (nonatomic, retain) NSNumber *isFriend;         // 好友关系
@property (nonatomic, retain) NSNumber *groupId;         // 好友所在分组
@property (nonatomic, retain) NSString *source;
@property (nonatomic, retain) NSNumber *doctorType;

@end

@interface ExpertInfo : BaseModel<NSCoding>

@property (nonatomic, retain) NSNumber *userId;         // 用户id
@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) NSString *headPortralt;
@property (nonatomic, retain) NSNumber *mobile;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSNumber *sex;
@property (nonatomic, retain) NSNumber *birthday;
@property (nonatomic, retain) NSNumber *hospitalId;
@property (nonatomic, retain) NSString *hospitalName;
@property (nonatomic, retain) NSNumber *deptId;
@property (nonatomic, retain) NSString *deptName;
@property (nonatomic, retain) NSNumber *jobtitleId;
@property (nonatomic, copy) NSString *jobtitle;
@property (nonatomic, retain) NSString *introduce;
@property (nonatomic, retain) NSString *source;
@property (nonatomic, retain) NSNumber *isFriend;
@property (nonatomic, retain) NSNumber *groupId;    // 好友所在分组id
@property (nonatomic, retain) NSNumber *expertType;
@property (nonatomic, retain) NSString *typeDesc;

@end