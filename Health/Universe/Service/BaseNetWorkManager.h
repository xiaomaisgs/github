//
//  BaseNetWorkManager.h
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "HEntance.h"
#import "NSData+PasingJSon.h"
#import "StatusManager.h"

@interface BaseNetWorkManager : NSObject

@property (nonatomic, retain) AFHTTPSessionManager *sessionManager;

- (void)post:(HEntance *)entrance returnBack:(void(^)(StatusManager *status,NSDictionary *bodyDic))handle failedBack:(void(^)(StatusManager *status))failedHandle;
- (void)postFormData:(HEntance *)entrance returnBack:(void (^)(StatusManager *status, NSDictionary *bodyDic))handle failedBack:(void(^)(StatusManager *status))failedHandle;
@end
