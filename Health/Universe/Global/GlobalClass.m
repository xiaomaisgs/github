//
//  GlobalClass.m
//  Health
//
//  Created by 张涛 on 16/6/10.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "GlobalClass.h"

@implementation GlobalClass

@end

@implementation LoginInfo

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.userId     = [coder decodeObjectForKey:@"userId"];
        self.chcode     = [coder decodeObjectForKey:@"chcode"];
        self.createTime = [coder decodeObjectForKey:@"createTime"];
        self.account    = [coder decodeObjectForKey:@"account"];
        self.password   = [coder decodeObjectForKey:@"password"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.userId forKey:@"userId"];
    [aCoder encodeObject:self.chcode forKey:@"chcode"];
    [aCoder encodeObject:self.createTime forKey:@"createTime"];
    [aCoder encodeObject:self.account forKey:@"account"];
    [aCoder encodeObject:self.password forKey:@"password"];
}

- (void)assembleFieldName
{
    ADD_FIELD(_userId,     @"USERID");
    ADD_FIELD(_chcode,     @"CHCODE");
    ADD_FIELD(_createTime, @"CREATETIME");
}

@end

@implementation PatientInfo
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.userId = [coder decodeObjectForKey:@"userId"];
        self.userName = [coder decodeObjectForKey:@"userName"];
        self.remark = [coder decodeObjectForKey:@"remark"];
        self.headPortralt = [coder decodeObjectForKey:@"headPortralt"];
        self.mobile = [coder decodeObjectForKey:@"mobile"];
        self.idNumber = [coder decodeObjectForKey:@"idNumber"];
        self.socialNumber = [coder decodeObjectForKey:@"socialNumber"];
        self.email = [coder decodeObjectForKey:@"email"];
        self.sex = [coder decodeObjectForKey:@"sex"];
        self.birthday = [coder decodeObjectForKey:@"birthday"];
        self.provinceNo = [coder decodeObjectForKey:@"provinceNo"];
        self.cityNo = [coder decodeObjectForKey:@"cityNo"];
        self.countryNO = [coder decodeObjectForKey:@"countryNO"];
        self.bodyHeight = [coder decodeObjectForKey:@"bodyHeight"];
        self.bodyWeight = [coder decodeObjectForKey:@"bodyWeight"];
        self.extendType = [coder decodeObjectForKey:@"extendType"];
        self.mpId = [coder decodeObjectForKey:@"mpId"];
        self.mpName = [coder decodeObjectForKey:@"mpName"];
        self.mpDesc = [coder decodeObjectForKey:@"mpDesc"];
        self.createTime = [coder decodeObjectForKey:@"createTime"];
        self.logoinTime = [coder decodeObjectForKey:@"logoinTime"];
        self.source = [coder decodeObjectForKey:@"source"];
        self.doctorId = [coder decodeObjectForKey:@"doctorId"];
        self.doctorType = [coder decodeObjectForKey:@"doctorType"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.userId forKey:@"userId"];
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.remark forKey:@"remark"];
    [aCoder encodeObject:self.headPortralt forKey:@"headPortralt"];
    [aCoder encodeObject:self.mobile forKey:@"mobile"];
    [aCoder encodeObject:self.idNumber forKey:@"idNumber"];
    [aCoder encodeObject:self.socialNumber forKey:@"socialNumber"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.sex forKey:@"sex"];
    [aCoder encodeObject:self.birthday forKey:@"birthday"];
    [aCoder encodeObject:self.provinceNo forKey:@"provinceNo"];
    [aCoder encodeObject:self.cityNo forKey:@"cityNo"];
    [aCoder encodeObject:self.countryNO forKey:@"countryNO"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.bodyHeight forKey:@"bodyHeight"];
    [aCoder encodeObject:self.bodyWeight forKey:@"bodyWeight"];
    [aCoder encodeObject:self.extendType forKey:@"extendType"];
    [aCoder encodeObject:self.mpId forKey:@"mpId"];
    [aCoder encodeObject:self.mpName forKey:@"mpName"];
    [aCoder encodeObject:self.mpDesc forKey:@"mpDesc"];
    [aCoder encodeObject:self.createTime forKey:@"createTime"];
    [aCoder encodeObject:self.logoinTime forKey:@"logoinTime"];
    [aCoder encodeObject:self.source forKey:@"source"];
    [aCoder encodeObject:self.doctorId forKey:@"doctorId"];
    [aCoder encodeObject:self.doctorType forKey:@"doctorType"];
}

-(void)assembleFieldName
{
    ADD_FIELD(_userId, @"USERID");
    ADD_FIELD(_userName, @"USERNAME");
    ADD_FIELD(_headPortralt, @"HEADPORTRAIT");
    ADD_FIELD(_mobile, @"MOBILE");
    ADD_FIELD(_idNumber, @"IDNUMBER");
    ADD_FIELD(_socialNumber, @"SOCIALNUM");
    ADD_FIELD(_email, @"EMAIL");
    ADD_FIELD(_sex, @"SEX");
    ADD_FIELD(_birthday, @"BIRTHDAY");
    ADD_FIELD(_provinceNo, @"PROVINCENO");
    ADD_FIELD(_cityNo, @"CITYNO");
    ADD_FIELD(_countryNO, @"COUNTRYNO");
    ADD_FIELD(_address, @"ADDRESS");
    ADD_FIELD(_bodyHeight, @"BODYHEIGHT");
    ADD_FIELD(_bodyWeight, @"BODYWEIGHT");
    ADD_FIELD(_extendType, @"EXTENDTYPE");
    ADD_FIELD(_mpId, @"MPID");
    ADD_FIELD(_mpName, @"MPNAME");
    ADD_FIELD(_mpDesc, @"MPDESC");
    ADD_FIELD(_createTime, @"CREATETIME");
    ADD_FIELD(_logoinTime, @"LOGINTIME");
    ADD_FIELD(_source, @"SOURCE");
    ADD_FIELD(_doctorId, @"DOCTORID");
    ADD_FIELD(_doctorType, @"DOCTORTYPE");
    ADD_FIELD(_remark, @"REMARK");
}

@end

@implementation DoctorInfo



@end

@implementation ExpertInfo



@end