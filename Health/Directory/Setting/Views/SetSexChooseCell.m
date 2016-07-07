//
//  SetSexChooseCell.m
//  Health
//
//  Created by 张涛 on 16/6/6.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "SetSexChooseCell.h"

@interface SetSexChooseCell ()
@property (weak, nonatomic) IBOutlet UIButton *manButton;
@property (weak, nonatomic) IBOutlet UIButton *womanButton;

@end
@implementation SetSexChooseCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)manSelected:(id)sender {
    if (self.sexChooseDelegate && [self.sexChooseDelegate respondsToSelector:@selector(sexChooseForType:)]) {
        self.womanButton.selected = NO;
        self.manButton.selected = YES;
        [self.sexChooseDelegate sexChooseForType:SexType_Man];
    }
}
- (IBAction)womanSelected:(id)sender {
    if (self.sexChooseDelegate && [self.sexChooseDelegate respondsToSelector:@selector(sexChooseForType:)]) {
        self.womanButton.selected = YES;
        self.manButton.selected = NO;
        [self.sexChooseDelegate sexChooseForType:SexType_Woman];
    }
}

@end
