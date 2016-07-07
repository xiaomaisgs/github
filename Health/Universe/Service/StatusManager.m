//
//  StatusManager.m
//  Health
//
//  Created by 张涛 on 16/6/8.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "StatusManager.h"

@implementation StatusHead

-(void)assembleFieldName
{
    ADD_FIELD(self.st, @"ST");
    ADD_FIELD(self.cmd, @"CMD");
    ADD_FIELD(self.msg, @"MSG");
}

@end

@implementation StatusManager

+ (instancetype)statusHead:(StatusHead *)statusHead andNetWorkStatus:(NetWorkStatus )netWorkStatus
{
    StatusManager *status = [[StatusManager alloc] init];
    status.statusHead = statusHead;
    status.netWorkStatus = netWorkStatus;
    return status;
}

@end
