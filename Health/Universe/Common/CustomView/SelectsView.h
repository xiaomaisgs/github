//
//  SelectsView.h
//  Health
//
//  Created by 张涛 on 16/6/21.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "BaseView.h"


@protocol SelectItemDelegate <NSObject>

@optional
- (void)itemSelectedAction:(NSInteger)index;

@end

@interface SelectsView : BaseView<SelectItemDelegate>

-(instancetype)initWithArray:(NSArray *)items forSender:(id)sender;
- (void)show;

@end

@interface SelectItem : UIView

@property (nonatomic, weak) id <SelectItemDelegate>delegate;

@end