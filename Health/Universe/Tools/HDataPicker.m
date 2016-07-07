//
//  HDataPicker.m
//  Health
//
//  Created by 张涛 on 16/6/6.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "HDataPicker.h"

@implementation HDataPicker
{
    UIDatePicker *_dataPicker;
    UIView *_backView; //半透明背景
    UIView *_toolBar;  //控制栏
}

- (instancetype)initWithFrame:(CGRect)frame date:(NSDate *)date mode:(UIDatePickerMode *)mode
{
    self = [super init];
    if (self) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _backView.backgroundColor = [UIColor blackColor];
        _backView.alpha = 0.0;
        [self addSubview:_backView];
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        backButton.backgroundColor = [UIColor clearColor];
        [backButton addTarget:self action:@selector(hideDataPicker:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backButton];
        
        _dataPicker = [[UIDatePicker alloc] init];
        [self setPickerFormmer];
        [_dataPicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
        [_backView addSubview:_dataPicker];
    }
    return self;
}

- (void)setPickerFormmer
{
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-CN"];
    _dataPicker.locale = locale;
    
    NSCalendar *gregorin = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:0];
    [offsetComponents setMonth:0];
    [offsetComponents setDay:0];
    [offsetComponents setHour:0];
    [offsetComponents setMinute:0];
    [offsetComponents setSecond:0];
    
    NSDate *maxDate = [gregorin dateByAddingComponents:offsetComponents toDate:[NSDate date] options:0];
    _dataPicker.maximumDate = maxDate;
    _dataPicker.minimumDate = [NSDate date];
}

- (void)dateChange:(id )sender
{
    UIDatePicker *dataPicker = (UIDatePicker *)sender;
    if (self.hDatePickerDelegate && [self.hDatePickerDelegate respondsToSelector:@selector(datePickerChangeForDate:)]) {
        [self.hDatePickerDelegate datePickerChangeForDate:dataPicker.date];
    }
}

- (void)hideDataPicker:(id )sender
{
    
}

@end
