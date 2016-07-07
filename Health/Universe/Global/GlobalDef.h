//
//  GlobalDef.h
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#ifndef GlobalDef_h
#define GlobalDef_h

#define APPVERSION  [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"]
#define UI_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define UI_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define RGB(__r, __g, __b) [UIColor colorWithRed:(__r / 255.0) green:(__g / 255.0) blue:(__b / 255.0) alpha:1]
#define RGB_COLOR_BACKGROUND     RGB(248.,248.,248.)

#define SHOW(message) [UITools showMBProgressHUDInView:self.view withText:message withTime:1.5]

typedef enum{
    kSuccess,
    kFailed,
}NetWorkStatus;

typedef enum {
    SexType_Man = 1,
    SexType_Woman,
}SexType;

typedef enum {
    UserType_Doctor  = 1,
    UserType_Patient = 2,
    UserType_Expert  = 3
}UserType;

#endif /* GlobalDef_h */
