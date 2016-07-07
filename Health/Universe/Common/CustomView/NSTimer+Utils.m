//
//  NSTimer+Utils.m
//  Health
//
//  Created by 张涛 on 16/7/4.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "NSTimer+Utils.h"

@implementation NSTimer (Utils)

- (void)pauseTimer
{
    if ([self isValid]) {
        [self setFireDate:[NSDate distantFuture]];
    }
}

- (void)resumeTimer
{
    if (self.isValid) {
        [self setFireDate:[NSDate distantPast]];
    }
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (self.isValid) {
        [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
    }
}

@end
