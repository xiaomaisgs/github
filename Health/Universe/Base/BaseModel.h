//
//  BaseModel.h
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ADD_FIELD(fn,strFn) if(nil != strFn)\
{ObjFieldName *obj = [[ObjFieldName alloc] init];\
obj.key = strFn;\
obj.obj = fn;\
[_fieldArray addObject:obj];\
}

@interface ObjFieldName : NSObject
@property (nonatomic, copy) NSString *key;
@property (nonatomic, strong) id obj;
@end

@interface BaseModel : NSObject
{
    NSMutableArray *_fieldArray;
}
- (instancetype)initWithDictionary:(NSDictionary *)objDic;
- (void)assembleFieldName;
@end
