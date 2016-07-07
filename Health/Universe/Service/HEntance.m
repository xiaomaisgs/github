//
//  HEntance.m
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "HEntance.h"
@interface HEntance ()
{
@private
    NSMutableDictionary *_headParameter;
    NSMutableDictionary *_bodyParameter;
    NSString            *_urlString;
    NSData              *_bodyData;
    NSString            *_type;
}

@end

@implementation HEntance

- (instancetype)init
{
    self = [super init];
    if (self) {
        _headParameter = [NSMutableDictionary dictionary];
        _bodyParameter = [NSMutableDictionary dictionary];
        _urlString = [NSMutableString string];
        
        
        [_headParameter setValue:[NetWorkManager manager].ver forKey:@"ver"];
        [_headParameter setValue:[NetWorkManager manager].ln forKey:@"ln"];
        [_headParameter setValue:[NetWorkManager manager].aid forKey:@"aid"];
        [_headParameter setValue:[NetWorkManager manager].mod forKey:@"mod"];
        [_headParameter setValue:[NetWorkManager manager].de forKey:@"de"];
        [_headParameter setValue:@([NetWorkManager manager].sync) forKey:@"sync"];
        [_headParameter setValue:[NetWorkManager manager].chcode forKey:@"chcode"];
        
    }
    return self;
}

- (void)addObject:(id )object forKey:(id )key
{
    if (nil != object) {
        [_bodyParameter setValue:object forKey:key];
    }
}

- (void)addBodyDic:(NSDictionary *)bodyDic
{
    if (nil != bodyDic) {
        [_bodyParameter addEntriesFromDictionary:bodyDic];
    }
}

- (void)addUrlString:(NSString *)urlString
{
    _urlString = [NSString stringWithFormat:@"%@/%@",[NetWorkManager manager].domain,urlString];
}

- (void)addCMD:(int )cmd
{
    [_headParameter setValue:@(cmd) forKey:@"cmd"];
}

- (void)addData:(NSData *)data type:(NSString *)type
{
    _bodyData = data;
    _type     = type;
}

- (NSString *)url
{
    return _urlString;
}

- (NSDictionary *)headDictionary
{
    return _headParameter;
}

- (NSDictionary *)bodyDictionary
{
    return _bodyParameter;
}

- (NSDictionary *)postDicFromEntrance
{
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:_headParameter forKey:@"head"];
    [parameter setValue:_bodyParameter forKey:@"con"];
    return parameter;
}

- (NSString *)type
{
    return _type;
}

- (NSData *)bodyData
{
    return _bodyData;
}
@end

/*
 head":
	{
 "aid":"1and6uu",
 "ver":"1.0",
 "ln":"cn",
 "mod":"ios",
 "de":"2011-07-13 00:00:00",
 "sync":1,
 "uuid":188111,
 "cmd":10003,
 "chcode":" ef19843298ae8f2134f "
	}
*/