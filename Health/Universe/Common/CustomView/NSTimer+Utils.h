//
//  NSTimer+Utils.h
//  Health
//
//  Created by 张涛 on 16/7/4.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Utils)

- (void)pauseTimer;
- (void)resumeTimer;
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
