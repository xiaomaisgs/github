//
//  SetSexChooseCell.h
//  Health
//
//  Created by 张涛 on 16/6/6.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"

@protocol SetSexChooseCellDelegate;
@interface SetSexChooseCell : BaseCell

@property (weak, nonatomic) id<SetSexChooseCellDelegate> sexChooseDelegate;

@end

@protocol SetSexChooseCellDelegate <NSObject>

- (void)sexChooseForType:(SexType )type;

@end