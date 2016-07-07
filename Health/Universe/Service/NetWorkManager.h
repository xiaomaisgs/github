//
//  NetWorkManager.h
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkManager : NSObject

@property (nonatomic, copy) NSString *aid;
@property (nonatomic, copy) NSString *ver;
@property (nonatomic, copy) NSString *ln;
@property (nonatomic, copy) NSString *mod;
@property (nonatomic, copy) NSString *de;
@property (nonatomic, assign) int sync;
@property (nonatomic, copy) NSString *chcode;
@property (nonatomic, copy) NSString *domain;

+ (instancetype)manager;
- (void)startWithAid:(NSString *)aid ver:(NSString *)ver ln:(NSString *)ln mod:(NSString *)mod sync:(int )sync uuid:(NSString *)uuid chcode:(NSString *)chcode domain:(NSString *)domain;

@end

/*
 "aid":"1and6uu",
 "ver":"1.0",
 "ln":"cn",
 "mod":"ios",
 "de":"2011-07-13 00:00:00",
 "sync":1,
 "uuid":188111,
 "cmd":10003,
 "chcode":" ef19843298ae8f2134f "
 */