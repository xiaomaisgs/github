//
//  ReplyController.h
//  Health
//
//  Created by 张涛 on 16/6/16.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ReplyStatus_Send = 1,
    ReplyStatus_Cancel
}ReplyStatus;
typedef void(^ReplyBlock)(int status,NSString *content);

@interface ReplyController : UIViewController

@property (nonatomic, copy) ReplyBlock rBlock;

@end
