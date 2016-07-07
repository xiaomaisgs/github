//
//  NSObject+KeyboardObserve.h
//  Health
//
//  Created by 张涛 on 16/6/10.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KeyboardObserve)

@end

@interface UITableView (KeyboardObserve)

- (void)keyboardWillShow:(NSNotification *)notify andNavigationBarHidden:(BOOL )isHidden;
- (void)keyboardWillHide:(NSNotification *)notify andNavigationBarHidden:(BOOL )isHidden;

@end

@interface UIScrollView (KeyboardObserve)

- (void)keyboardWillShow:(NSNotification *)notify andNavigationBarHidden:(BOOL )isHidden;
- (void)keyboardWillHide:(NSNotification *)notify andNavigationBarHidden:(BOOL )isHidden;

@end