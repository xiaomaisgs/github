//
//  HDataPicker.h
//  Health
//
//  Created by 张涛 on 16/6/6.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "BaseView.h"

@protocol HDataPickerDelegate <NSObject>

- (void)datePickerChangeForDate:(NSDate *)date;
- (void)hideDataPicker;
- (void)datePickerRelease;

@end

@interface HDataPicker : BaseView

@property (nonatomic, weak) id<HDataPickerDelegate>hDatePickerDelegate;
- (instancetype)initWithFrame:(CGRect)frame date:(NSDate *)date mode:(UIDatePickerMode *)mode;

@end
