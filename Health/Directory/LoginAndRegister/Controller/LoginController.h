//
//  LoginController.h
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "BaseController.h"

@protocol LoginControllerDelegate;
@interface LoginController : BaseController

@property (nonatomic, weak) id<LoginControllerDelegate>loginDelegate;

@end

@protocol LoginControllerDelegate <NSObject>

- (void)successLogin;

- (void)findPassword;

- (void)toRegister;

@end