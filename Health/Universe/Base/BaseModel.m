//
//  BaseModel.m
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "BaseModel.h"

@implementation ObjFieldName

@end

@implementation BaseModel

- (instancetype)initWithDictionary:(NSDictionary *)objDic
{
    self = [super init];
    if (self) {
        _fieldArray = [NSMutableArray array];
        [self assembleFieldName];
        [self pasingWithDictionary:objDic];
    }
    return self;
}

- (void)assembleFieldName
{
    
}

- (void)pasingWithDictionary:(NSDictionary *)dic
{
    if (nil == dic) {
        return;
    }
    NSMutableDictionary *resouceDic = [NSMutableDictionary dictionary];
    for (ObjFieldName *obj in _fieldArray) {
        if (nil != obj.key && ![obj.key isKindOfClass:[NSNull class]]) {
            id value;
            if (nil != [dic objectForKey:obj.key]) {
                value = [dic objectForKey:obj.key];
            }
            [resouceDic setObject:value forKey:obj.obj];
        }
    }
    [self setValuesForKeysWithDictionary:resouceDic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
