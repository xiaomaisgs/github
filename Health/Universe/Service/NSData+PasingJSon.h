//
//  NSData+PasingJSon.h
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (PasingJSon)

+ (NSDictionary *)pasingJson:(NSData *)data;

@end
