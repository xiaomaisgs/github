//
//  PayHeaderCell.m
//  YiLiao_Patient
//
//  Created by 张涛 on 16/5/30.
//  Copyright © 2016年 常 贤明. All rights reserved.
//

#import "PayHeaderCell.h"

@implementation PayHeaderCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setSearchInfo:(SearchInfo *)searchInfo
{
    _searchInfo = searchInfo;
    if (searchInfo.userName != nil && ![searchInfo.userName isKindOfClass:[NSNull class]]) {
        self.name.text  = [NSString stringWithFormat:@"会诊专家： %@",searchInfo.userName];
    }else{
        self.name.text = @"会诊专家：";
    }
    
    if (nil != searchInfo.typeDesc && ![searchInfo.typeDesc isKindOfClass:[NSNull class]]) {
        self.type.text = [NSString stringWithFormat:@"专家类型： %@",searchInfo.typeDesc];
    }else{
        self.type.text = @"专家类型：";
    }
    if (nil != _searchInfo.time && ![_searchInfo.time isKindOfClass:[NSNull class]]) {
//        self.time.text  = [NSString stringWithFormat:@"预约时间：%@",[StringConvert stringFromInterval:([_searchInfo.time intValue]*24*3600+[[NSDate date] timeIntervalSince1970]) withMode:@"yyyy-MM-dd"]];
    }else{
        self.time.text = @"预约时间：";
    }
    
    if (nil != searchInfo.price && ![searchInfo.price isKindOfClass:[NSNull class]]) {
        self.price.text = [NSString stringWithFormat:@"订单费用：￥%.2f",[searchInfo.price floatValue]];
    }else{
        self.price.text = @"订单费用：";
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
