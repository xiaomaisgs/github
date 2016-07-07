//
//  ReplyController.m
//  Health
//
//  Created by 张涛 on 16/6/16.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "ReplyController.h"
#import <objc/runtime.h>

@interface ReplyController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstrait;
@property (weak, nonatomic) IBOutlet UITextView *contentTextV;

@end

@implementation ReplyController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)keyboardWillShow:(NSNotification *)notify
{
    NSDictionary *keyboardInfo = notify.userInfo;
    [UIView animateWithDuration:[keyboardInfo[@"UIKeyboardAnimationDurationUserInfoKey"] floatValue] animations:^{
        self.bottomConstrait.constant = [keyboardInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue].size.height;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)keyboardWillHide:(NSNotification *)notify
{
    [UIView animateWithDuration:[notify.userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] floatValue] animations:^{
        self.bottomConstrait.constant = 0;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)send:(id)sender {
    if ([self.contentTextV.text isEqualToString:@""] || self.contentTextV.text == nil) {
        [UITools showMBProgressHUDInView:self.view withText:@"请输入回帖" withTime:1.];
        return;
    }
    if (self.rBlock) {
        self.rBlock(ReplyStatus_Send,self.contentTextV.text);
    }
    
    [self.contentTextV resignFirstResponder];
}

- (IBAction)cancel:(id)sender {
    [self.contentTextV resignFirstResponder];
    if (self.rBlock) {
        self.rBlock(ReplyStatus_Cancel,nil);
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [self.contentTextV becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
