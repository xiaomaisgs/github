//
//  ShareView.m
//  YiLiao_Patient
//
//  Created by 张涛 on 16/6/13.
//  Copyright © 2016年 常 贤明. All rights reserved.
//

#import "ShareView.h"
#import <objc/runtime.h>

#define SHAREBTN_TAG  222
#define btnWidth  (UI_SCREEN_WIDTH- 50)/ 4
#define btnHeight  btnWidth + 10
#define ITEM_INDEX @"ITEM_INDEX"

@implementation ShareView
{
    UIView *_bottomShareV;
    UIView *_backGroundV;
}

- (instancetype)initWithItems:(NSArray *)items
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT);
        self.items = items;
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews
{
    _backGroundV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT)];
    _backGroundV.alpha = .2;
    _backGroundV.backgroundColor = [UIColor blackColor];
    [self addSubview:_backGroundV];
    
    _bottomShareV = [[UIView alloc] initWithFrame:CGRectMake(0, UI_SCREEN_HEIGHT, UI_SCREEN_WIDTH, 200)];
    _bottomShareV.backgroundColor = [UIColor whiteColor];
    [_backGroundV addSubview:_bottomShareV];
    
    for (int i = 0; i < self.items.count; i++) {
        ShareItem *item = [ShareItem buttonWithType:UIButtonTypeCustom];
        [item setBackgroundImage:[UIImage imageNamed:@"share_wechat"] forState:UIControlStateNormal];
        item.frame = CGRectMake(10 + i%4*(btnWidth + 10), 10 + i/4 *(btnHeight +10) , btnWidth, btnHeight);
        objc_setAssociatedObject(item, ITEM_INDEX, @(SHAREBTN_TAG + i), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [item setTitle:self.items[i] forState:UIControlStateNormal];
        [item addTarget:self action:@selector(selectShare:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomShareV addSubview:item];
    }
    [self show];
    
    [_backGroundV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)]];
}

- (void)selectShare:(UIButton *)btn
{
    int index = [objc_getAssociatedObject(btn, ITEM_INDEX) intValue];
    [self hide];
    if (self.block) {
        self.block(true,index);
    }
}


- (void)show
{
    _backGroundV.userInteractionEnabled = NO;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:.4 animations:^{
        __strong typeof(self) strongSelf = weakSelf;
        CGFloat bHeight = ((self.items.count - 1)/4 +1) *(btnHeight+10) + 10;
        strongSelf->_bottomShareV.frame = CGRectMake(0, UI_SCREEN_HEIGHT - bHeight, UI_SCREEN_WIDTH, bHeight);
    } completion:^(BOOL finished) {
        _backGroundV.userInteractionEnabled = YES;
    }];
}

- (void)hide
{
    _backGroundV.userInteractionEnabled = NO;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:.4 animations:^{
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf->_bottomShareV.frame = CGRectMake(0, UI_SCREEN_HEIGHT, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT);
        [weakSelf.itemsView layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (weakSelf.block) {
            weakSelf.block(0,0);
        }
        _backgroundView.userInteractionEnabled = YES;
    }];
}

@end

@implementation ShareItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12.];
        self.titleLabel.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, btnWidth , btnWidth, 10);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, btnWidth, btnWidth);
}

@end