//
//  PayHeaderCell.h
//  YiLiao_Patient
//
//  Created by 张涛 on 16/5/30.
//  Copyright © 2016年 常 贤明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayGlobalClass.h"

@interface PayHeaderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIButton *selectPayType;
@property (weak, nonatomic) IBOutlet UIButton *submit;
@property (nonatomic, strong) SearchInfo *searchInfo;
@end
