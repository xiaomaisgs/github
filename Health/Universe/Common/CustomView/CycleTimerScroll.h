//
//  CycleTimerScroll.h
//  Health
//
//  Created by 张涛 on 16/7/4.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CycleTimerScrollDelegate <NSObject>

- (NSString *)scrollToCurrentPage:(NSInteger)currentPageIndex;

- (void) selectedImageView:(NSInteger )selectedIndex;

@end

@interface CycleTimerScroll : UIView

@property (nonatomic, weak) id <CycleTimerScrollDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame contetnViews:(NSArray *)contentViews animationDuration:(CGFloat)duration;

@end
