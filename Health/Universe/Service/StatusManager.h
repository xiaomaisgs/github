//
//  StatusManager.h
//  Health
//
//  Created by 张涛 on 16/6/8.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface StatusHead : BaseModel

@property (nonatomic, retain) NSString *msg;
@property (nonatomic, retain) NSString *st;
@property (nonatomic, retain) NSString *cmd;

@end

@interface StatusManager : BaseModel

@property (nonatomic, retain) StatusHead *statusHead;
@property (nonatomic, assign) NetWorkStatus netWorkStatus;
+ (instancetype)statusHead:(StatusHead *)statusHead andNetWorkStatus:(NetWorkStatus )netWorkStatus;

@end
