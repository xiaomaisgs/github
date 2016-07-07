//
//  ShareView.h
//  YiLiao_Patient
//
//  Created by 张涛 on 16/6/13.
//  Copyright © 2016年 常 贤明. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^shareBlock)(int status,int index);

@interface ShareView : UIView
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIView *itemsView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *itemsViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (strong, nonatomic) NSArray *items;
@property (copy, nonatomic) shareBlock block;
- (instancetype)initWithItems:(NSArray *)items;
- (void)show;
- (void)hide;
@end

@interface ShareItem : UIButton

@end