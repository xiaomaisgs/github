//
//  DrawView.h
//  Health
//
//  Created by 张涛 on 16/6/20.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "BaseView.h"

@interface DrawView : BaseView
- (instancetype)initWithFrame:(CGRect)frame;
- (void)clear;
- (void)save;
@end
