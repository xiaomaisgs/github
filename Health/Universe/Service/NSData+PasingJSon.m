//
//  NSData+PasingJSon.m
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "NSData+PasingJSon.h"

@implementation NSData (PasingJSon)

+ (NSDictionary *)pasingJson:(NSData *)data
{
    NSError *error = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    return error ? nil:res;
}

@end
