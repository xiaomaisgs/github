//
//  HEntance.h
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkManager.h"

@interface HEntance : NSObject

- (void)addObject:(id )object forKey:(id )key;
- (void)addBodyDic:(NSDictionary *)bodyDic;
- (void)addUrlString:(NSString *)urlString;
- (void)addCMD:(int )cmd;

- (NSString *)url;
- (NSDictionary *)headDictionary;
- (NSDictionary *)bodyDictionary;
- (NSDictionary *)postDicFromEntrance;
- (NSString *)type;
- (NSData *)bodyData;
@end
