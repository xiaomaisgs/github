//
//  UToolBox.h
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UToolBox : NSObject

//date转换字符串
+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)formatter;

//时间戳转换时间
+ (NSString *)stringFromDateline:(long long)dateline formatter:(NSString *)formatter;

//正则匹配手机号

+ (BOOL)checkTelNumber:(NSString*)telNumber;

//正则匹配用户密码6-18位数字和字母组合

+ (BOOL)checkPassword:(NSString*)password;

//正则匹配用户姓名,20位的中文或英文

+ (BOOL)checkUserName:(NSString*)userName;

//正则匹配用户身份证号

+ (BOOL)checkUserIdCard:(NSString*)idCard;

//正则匹员工号,12位的数字

+ (BOOL)checkEmployeeNumber:(NSString*)number;

//正则匹配URL

+ (BOOL)checkURL:(NSString*)url;

//转化成MD5 32位
+ (NSString *)md5:(NSString *)str;

//归档
+ (void)archiveObject:(id)obj;

//解档
+ (id)unarchiveObjClass:(Class)objClass;;
@end
