//
//  DrawView.m
//  Health
//
//  Created by 张涛 on 16/6/20.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView
{
    UIBezierPath *_path;
    NSMutableArray *_paths;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(drawInView:)]];
        _paths = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(drawInView:)]];
        _paths = [NSMutableArray array];
    }
    return self;
}

- (void)drawInView:(UIPanGestureRecognizer *)panGes
{
    CGPoint gesPoint = [panGes locationInView:panGes.view];
    
    if (panGes.state == UIGestureRecognizerStateBegan) {
        UIBezierPath *path = [[UIBezierPath alloc] init];
        [path moveToPoint:gesPoint];
        
        path.lineWidth = 3;
        path.lineCapStyle = kCGLineCapRound;
        path.lineJoinStyle = kCGLineJoinBevel;
        _path = path;
        [_paths addObject:path];
        
    }else if (panGes.state == UIGestureRecognizerStateChanged){
        [_path addLineToPoint:gesPoint];
        
        [self setNeedsDisplay];
    }
    
}

-(void)drawRect:(CGRect)rect
{
    for (UIBezierPath *path in _paths) {
        if ([path isKindOfClass:[UIImage class]]) {
            UIImage *image = (UIImage *)path;
            [image drawInRect:rect];
        }else{
             [[UIColor greenColor] setStroke];
            [path stroke];
        }
    }
}

- (void)clear
{
    [_paths removeAllObjects];
    [self setNeedsDisplay];
}

- (void)save
{
    UIGraphicsBeginImageContext(CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *currentImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(currentImage, self, @selector(image:didFinishSavingWithError:contextInfo:), 0);
}

- (void)image:(UIImage*)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)context
{
    if (error) {
        
    }else{
        long timeLine = [[NSDate date] timeIntervalSince1970];
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *picPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%ld_pic",timeLine]];
        NSData *imageData = UIImageJPEGRepresentation(image, 0);
        [imageData writeToFile:picPath atomically:YES];
    }
}

@end
