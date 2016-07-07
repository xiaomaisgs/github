//
//  SelectsView.m
//  Health
//
//  Created by 张涛 on 16/6/21.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "SelectsView.h"
#import <objc/runtime.h>

#define ICON_WIDTH  30
#define ICON_HEIGHT 30

#define SELECTVIEW_WIDTH    UI_SCREEN_WIDTH/3
#define SELECTVIEW_HEIGHT   SELECTVIEW_WIDTH *.6

#define ITEM_INDEX  222
#define ITEM_KEY   @"ITEM_KEY"

@interface SelectsView ()
{
    CGPoint itemCenter;
}
@property (nonatomic, retain) NSArray *items;
@property (nonatomic, assign) BOOL isOpen;

@end
@implementation SelectsView

-(instancetype)initWithArray:(NSArray *)items forSender:(id)sender
{
    UIControl *control = (UIControl *)sender;
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.items = items;
        self.frame = CGRectMake(CGRectGetMidX(control.frame) - SELECTVIEW_WIDTH/2, CGRectGetMaxY(control.frame) - CGRectGetHeight(control.frame) - SELECTVIEW_HEIGHT, SELECTVIEW_WIDTH, SELECTVIEW_HEIGHT);
        [self setUpViews];
    }
    return self;
}

- (void)setUpViews
{
    for (int i = 0; i < self.items.count; i++) {
        SelectItem *item = [[SelectItem alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame)/2 - ICON_WIDTH/2, CGRectGetHeight(self.frame), ICON_WIDTH, ICON_HEIGHT)];
        itemCenter = item.center;
        item.userInteractionEnabled = YES;
        item.delegate = self;
        item.tag = ITEM_INDEX + i;
        [item addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)]];
        [self addSubview:item];
    }
}

- (void)show
{
    CGFloat partX = CGRectGetWidth(self.frame)/(self.items.count + 1);
    CGFloat partY = CGRectGetHeight(self.frame) / ((int)(self.items.count/2) +1);

    for (int i = 0; i < self.items.count; i++) {
        SelectItem *item = [self viewWithTag:ITEM_INDEX + i];
        CGFloat pointX = partX *(i + 1);
        CGFloat pointY = CGRectGetHeight(self.frame) - partY *(i+1);
        if (pointY < 0) {
            pointY = 0 - pointY;
        }
        pointY = pointY + ICON_HEIGHT/2;
        if (!self.isOpen) {
            [self addAnimationWithOldPositon:itemCenter toNewPosition:CGPointMake(pointX, pointY) andDuration:.3 rotationCount:2 oldScale:.0 toNewScale:1. addItem:^(CAAnimationGroup *groupAnimation) {
                [item.layer addAnimation:groupAnimation forKey:nil];
            }];
            [item.layer setPosition:CGPointMake(pointX, pointY)];
        }else{
            [self addAnimationWithOldPositon:CGPointMake(pointX, pointY) toNewPosition:itemCenter andDuration:.3 rotationCount:2 oldScale:1. toNewScale:.0 addItem:^(CAAnimationGroup *groupAnimation) {
                [item.layer addAnimation:groupAnimation forKey:nil];
            }];
            [item.layer setPosition:itemCenter];
        }
        
    }
    self.isOpen = !self.isOpen;
}

- (void)tapAction:(UITapGestureRecognizer *)ges
{
    
}

- (void)addAnimationWithOldPositon:(CGPoint)oldPoint toNewPosition:(CGPoint)newPoint andDuration:(CGFloat)duration rotationCount:(float)rotationCount oldScale:(float)oldScale toNewScale:(CGFloat)newScale addItem:(void(^)(CAAnimationGroup *))addAnimationItem
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:oldPoint];
    [path addLineToPoint:newPoint];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.fromValue = [NSValue valueWithCGPoint:oldPoint];
    moveAnimation.toValue = [NSValue valueWithCGPoint:newPoint];
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.duration = duration;
    moveAnimation.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.];
    rotateAnimation.toValue = [NSNumber numberWithFloat:rotationCount * M_PI];
    rotateAnimation.removedOnCompletion = NO;
    rotateAnimation.duration = duration;
    rotateAnimation.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:oldScale];
    scaleAnimation.toValue = [NSNumber numberWithFloat:newScale];
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.duration = duration;
    scaleAnimation.fillMode = kCAFillModeForwards;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.delegate = self;
    animationGroup.duration = duration;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.animations = @[animation,moveAnimation,rotateAnimation,scaleAnimation];
    
    addAnimationItem(animationGroup);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
}

@end

@implementation SelectItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpViews];
    }
    return self;
}

- (void)setUpViews
{
    UIImageView *iconV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    iconV.layer.cornerRadius = CGRectGetHeight(self.frame)/2;
    iconV.clipsToBounds = YES;
    iconV.backgroundColor = [UIColor cyanColor];
    iconV.userInteractionEnabled = YES;
    [self addSubview:iconV];
}


@end