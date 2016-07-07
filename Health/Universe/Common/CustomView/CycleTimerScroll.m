//
//  CycleTimerScroll.m
//  Health
//
//  Created by 张涛 on 16/7/4.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "CycleTimerScroll.h"
#import "NSTimer+Utils.h"
#import <objc/runtime.h>
#import "UIImageView+WebCache.h"

#define CYCLEIMAGEV_TAG 1234
#define PIC_PLACEHOLDER @""

@interface CycleTimerScroll ()<UIScrollViewDelegate>
{
    NSInteger _duration;
    NSInteger _currentPage;
    NSMutableArray *_contentViews;
}
@property (nonatomic, retain) UIScrollView *contentScroll;
@property (nonatomic, retain) NSTimer *timer;

@end

@implementation CycleTimerScroll

- (instancetype)initWithFrame:(CGRect)frame contetnViews:(NSArray *)contentViews animationDuration:(CGFloat)duration
{
    self = [super initWithFrame:frame];
    if (self) {
        _duration = duration;
        
        self.contentScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        self.contentScroll.showsVerticalScrollIndicator = NO;
        self.contentScroll.showsHorizontalScrollIndicator = NO;
        self.contentScroll.contentSize = CGSizeMake(CGRectGetWidth(frame)*contentViews.count, CGRectGetHeight(frame));
        
        _contentViews =[NSMutableArray arrayWithArray:contentViews];
        [_contentViews addObject:[contentViews firstObject]];
        [_contentViews insertObject:contentViews[contentViews.count - 2] atIndex:0];
        for (NSInteger i = 0 ; i < contentViews.count + 2; i++) {
            UIImageView *imgV =[[UIImageView alloc] initWithFrame:CGRectMake(i *CGRectGetWidth(frame), 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
            imgV.tag = CYCLEIMAGEV_TAG + i;
            [imgV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesAction:)]];
            [self.contentScroll addSubview:imgV];
        }
        [self.contentScroll setContentOffset:CGPointMake(CGRectGetWidth(self.contentScroll.frame), 0)];
        [self addSubview:self.contentScroll];
        
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(cycleScroll:) userInfo:nil repeats:YES];
    }
    return self;
}


- (void)tapGesAction:(UITapGestureRecognizer *)tapGes
{
    NSInteger currentPageIndex = tapGes.view.tag - CYCLEIMAGEV_TAG;
    if ( self.delegate && [self.delegate respondsToSelector:@selector(selectedImageView:)]) {
        currentPageIndex = [self calculateCurrentpage:currentPageIndex];
        [self.delegate selectedImageView:currentPageIndex] ;
    }
}

- (void)cycleScroll:(NSTimer *)timer
{
    [self scrollViewDidScroll:self.contentScroll];
}

- (NSInteger)calculateCurrentpage:(NSInteger)currentPage
{
    NSInteger resaultPage;
    if (currentPage == _contentViews.count - 1) {
        resaultPage = 1;
    }else if (currentPage == 0){
        resaultPage = _contentViews.count -1;
    }else{
        resaultPage = currentPage;
    }
    return resaultPage;
}

- (void)cancelDonwloadPics
{
    for (UIView *view in self.contentScroll.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            [(UIImageView *)view sd_cancelCurrentImageLoad];
        }else{
            for (UIView *subViews in view.subviews) {
                if ([subViews isKindOfClass:[UIImageView class]]) {
                    [(UIImageView *)subViews sd_cancelCurrentImageLoad];
                }
            }
        }
    }

}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer pauseTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self.timer resumeTimerAfterTimeInterval:_duration];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _currentPage = [self calculateCurrentpage:CGRectGetMinX(scrollView.frame)/CGRectGetWidth(scrollView.frame)];
        UIImageView *currentImageView = [scrollView viewWithTag:_currentPage + CYCLEIMAGEV_TAG];
    [self cancelDonwloadPics];
    [currentImageView sd_setImageWithURL:[NSURL URLWithString:[_delegate scrollToCurrentPage:_currentPage]] placeholderImage:[UIImage imageNamed:PIC_PLACEHOLDER]];
    [self.contentScroll setContentOffset:CGPointMake(_currentPage *CGRectGetWidth(scrollView.frame), 0)];
}

@end
