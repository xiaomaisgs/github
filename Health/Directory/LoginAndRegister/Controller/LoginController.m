//
//  LoginController.m
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "LoginController.h"
#import "LoginAndRegisterManager.h"
#import "UserInformationManager.h"
#import "ShareView.h"

#define LOGIN_TAG             456
#define TOREGISTER_TAG        457
#define FINDPASSWORD_TAG      458
@interface LoginController ()<UIScrollViewDelegate,UITextFieldDelegate>
{
    UITextField *_accountTF;
    UITextField *_passwordTF;
    
    LoginAndRegisterManager *_loginAndRegister;
    UserInformationManager *_userInformationManager;
    
    NSMutableDictionary *_loginDataDic;
}
@property (weak, nonatomic) IBOutlet UIImageView *bkGroundImageV;
@property (strong, nonatomic) UIScrollView *scrollV;
@end

@implementation LoginController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT)];
    [self.scrollV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tfEndEditing:)]];
    self.scrollV.showsVerticalScrollIndicator = NO;
    self.scrollV.alwaysBounceVertical = YES;
    [self.view addSubview:self.scrollV];
    
    UILabel *account = [[UILabel alloc] initWithFrame:CGRectMake(39, 170, 51, 27)];
    account.text = @"账号";
    account.font = [UIFont systemFontOfSize:15.0];
    [self.scrollV addSubview:account];
    
    _accountTF = [[UITextField alloc] initWithFrame:CGRectMake(104, 165, UI_SCREEN_WIDTH - 104 - 26, 31)];
    _accountTF.borderStyle = UITextBorderStyleRoundedRect;
    _accountTF.keyboardType = UIKeyboardTypeNumberPad;
    _accountTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _accountTF.font = [UIFont systemFontOfSize:15.0];
    [self.scrollV addSubview:_accountTF];
    
    UILabel *password = [[UILabel alloc] initWithFrame:CGRectMake(39, 238, 41, 21)];
    password.text = @"密码";
    password.font = [UIFont systemFontOfSize:15.0];
    [self.scrollV addSubview:password];
    
    _passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(104, 233, UI_SCREEN_WIDTH - 104 - 26, 31)];
    _passwordTF.borderStyle = UITextBorderStyleRoundedRect;
    _passwordTF.font = [UIFont systemFontOfSize:15.0];
    _passwordTF.secureTextEntry = YES;
    [self.scrollV addSubview:_passwordTF];
    
    UIButton *enter = [UIButton buttonWithType:UIButtonTypeCustom];
    enter.frame = CGRectMake(44, 324, UI_SCREEN_WIDTH - 44 - 44, 44);
    enter.tag = LOGIN_TAG;
    enter.backgroundColor = [UIColor cyanColor];
    [enter setTitle:@"登录" forState:UIControlStateNormal];
    [enter addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollV addSubview:enter];
    
    UIButton *findPassword = [UIButton buttonWithType:UIButtonTypeCustom];
    findPassword.frame = CGRectMake(20, UI_SCREEN_HEIGHT - 20 - 30, 60, 30);
    findPassword.tag = FINDPASSWORD_TAG;
    [findPassword setTitle:@"找回密码" forState:UIControlStateNormal];
    [findPassword addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollV addSubview:findPassword];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerButton setTitle:@"注册>>" forState:UIControlStateNormal];
    registerButton.tag = TOREGISTER_TAG;
    registerButton.frame = CGRectMake(UI_SCREEN_WIDTH - 60 - 20, UI_SCREEN_HEIGHT - 20 - 30, 60, 30);
    [registerButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollV addSubview:registerButton];
    
    _loginAndRegister = [[LoginAndRegisterManager alloc] init];
    _loginDataDic = [NSMutableDictionary dictionary];
    
}

- (void)keyboardWillShow :(NSNotification *)notify
{
    
}

- (void)keyboardWillHide: (NSNotification *)notify
{
    
}

- (void)clickAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case LOGIN_TAG:
            [self judgeLoginInfo];
            break;
        case TOREGISTER_TAG:
            if (self.loginDelegate && [self.loginDelegate respondsToSelector:@selector(toRegister)]) {
                [self.loginDelegate toRegister];
            }
            break;
        case FINDPASSWORD_TAG:
            if (self.loginDelegate && [self.loginDelegate respondsToSelector:@selector(findPassword)]) {
                [self.loginDelegate findPassword];
            }
            break;
            
        default:
            break;
    }
}

- (void)judgeLoginInfo
{
    if (_accountTF.text == nil || [_accountTF.text isEqualToString:@""]) {
        SHOW(@"账户不能为空");
        return;
    }
    if (![UToolBox checkTelNumber:_accountTF.text]) {
        SHOW(@"手机格式不对");
        return;
    }
    [_loginDataDic setObject:_accountTF.text forKey:@"account"];
    
    if (_passwordTF.text == nil || [_passwordTF.text isEqualToString:@""]) {
        SHOW(@"密码不能为空");
        return;
    }
//    if (![UToolBox checkPassword:_passwordTF.text]) {
//        SHOW(@"密码格式不对");
//        return;
//    }
    
    
    [_loginDataDic setObject:[UToolBox md5:_passwordTF.text] forKey:@"password"];
    [_loginDataDic setObject:@(UserType_Patient) forKey:@"userType"];
    __weak typeof(self) weakSelf = self;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_loginAndRegister login:_loginDataDic returnback:^(StatusManager *status, LoginInfo *info) {
        __strong typeof(self) strongSelf = weakSelf;
        if (status.netWorkStatus == kSuccess) {
            LoginInfo *loginInfo = [[LoginInfo alloc] init];
            loginInfo = info;
            loginInfo.account = _accountTF.text;
            loginInfo.password = [UToolBox md5:_passwordTF.text];
            [UserCenter shareUserCenter].loginInfo = loginInfo;
            if (nil == info.userId) {
                [MBProgressHUD hideAllHUDsForView:weakSelf.view animated:YES];
                return;
            }
            [strongSelf->_userInformationManager requestforPatientInfo:[loginInfo.userId intValue] returnBack:^(StatusManager *status, PatientInfo *info) {
                if (status.netWorkStatus == kSuccess) {
                    [UserCenter shareUserCenter].patientInfo = info;
                    if (weakSelf.loginDelegate && [weakSelf.loginDelegate respondsToSelector:@selector(successLogin)]) {
                        [weakSelf.loginDelegate successLogin];
                    }
                }
            }];
        }else{
            SHOW(@"登录失败");
        }
        [MBProgressHUD hideAllHUDsForView:weakSelf.view animated:YES];
    }];
}


#pragma mark - UITextField
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

- (void)tfEndEditing:(UITapGestureRecognizer *)tapGes
{
    [self.view endEditing:YES];
}

@end
