//
//  UITools.m
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "UITools.h"

@implementation UITools

+ (void)showMBProgressHUDInView:(UIView *)view withText:(NSString *)text withTime:(int)time
{
    MBProgressHUD *mbHud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:mbHud];
    mbHud.mode = MBProgressHUDModeText;
    mbHud.labelText = text;
    [mbHud show:YES];
    [mbHud hide:YES afterDelay:time];
}

@end
