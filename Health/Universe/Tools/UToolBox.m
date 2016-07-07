//
//  UToolBox.m
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "UToolBox.h"
#import <CommonCrypto/CommonDigest.h>

@implementation UToolBox

+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)formatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)stringFromDateline:(long long)dateline formatter:(NSString *)formatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:dateline]];
}


//正则匹配手机号

+ (BOOL)checkTelNumber:(NSString*)telNumber;

{
    NSString * PHONE = @"^1\\d{10}$";
    NSPredicate *regexPhone = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHONE];
    return [regexPhone evaluateWithObject:telNumber];
}

//正则匹配用户密码6-18位数字和字母组合

+ (BOOL)checkPassword:(NSString*)password;

{
    
    NSString *pattern = @"//w{6,16}";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:password];
    
    return isMatch;
    
}

//正则匹配用户姓名,20位的中文或英文

+ (BOOL)checkUserName:(NSString*)userName;

{
    
    NSString*pattern = @"^[a-zA-Z\u4E00-\u9FA5]{1,20}";
    
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:userName];
    
    return isMatch;
    
}

//正则匹配用户身份证号15或18位

+ (BOOL)checkUserIdCard: (NSString*) idCard

{
    
    NSString*pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:idCard];
    
    return isMatch;
    
}

//正则匹员工号,12位的数字

+ (BOOL)checkEmployeeNumber : (NSString*) number

{
    
    NSString* pattern = @"^[0-9]{12}";
    
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:number];
    
    return isMatch;
    
}

//正则匹配URL

+ (BOOL)checkURL : (NSString*)url

{
    
    NSString* pattern = @"^[0-9A-Za-z]{1,50}";
    
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:url];
    
    return isMatch;
    
}

+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (void)archiveObject:(id)obj
{
    if (nil == obj) {
        return;
    }
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:obj];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:NSStringFromClass([obj class])];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)unarchiveObjClass:(Class)objClass;
{
    NSData* data = [[NSUserDefaults standardUserDefaults] objectForKey:NSStringFromClass([objClass class])];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end
