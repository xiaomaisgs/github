//
//  SetNormalCell.h
//  Health
//
//  Created by 张涛 on 16/6/6.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"

@interface SetNormalCell : BaseCell
@property (weak, nonatomic) IBOutlet UILabel *subject;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIView *spliteLine;

@end
