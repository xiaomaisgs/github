//
//  NetWorkManager.m
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "NetWorkManager.h"

static NetWorkManager *_netWorkManager;
@implementation NetWorkManager

+ (instancetype)manager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (nil == _netWorkManager) {
            _netWorkManager = [[NetWorkManager alloc] init];
        }
    });
    return _netWorkManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)startWithAid:(NSString *)aid ver:(NSString *)ver ln:(NSString *)ln mod:(NSString *)mod sync:(int )sync uuid:(NSString *)uuid chcode:(NSString *)chcode domain:(NSString *)domain
{
    self.aid = aid;
    self.ver = ver;
    self.ln = ln;
    self.mod = mod;
    self.sync = sync;
    self.chcode = chcode;
    self.domain = domain;
}

@end

