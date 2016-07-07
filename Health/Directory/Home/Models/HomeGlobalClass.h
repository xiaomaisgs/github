//
//  HomeGlobalClass.h
//  Health
//
//  Created by 张涛 on 16/6/17.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "BaseModel.h"

@interface HomeGlobalClass : BaseModel

@end

@interface HomeModel : BaseModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) NSArray *contentArray;
@property (nonatomic, assign) BOOL  isHidden;

@end