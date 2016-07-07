//
//  BaseNetWorkManager.m
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "BaseNetWorkManager.h"

#define TIMEOUTINTEVAL 30
static BaseNetWorkManager *_m;
@implementation BaseNetWorkManager

- (void)post:(HEntance *)entrance returnBack:(void(^)(StatusManager *status,NSDictionary *bodyDic))handle failedBack:(void(^)(StatusManager *status))failedHandle
{
    NSLog(@"发送参数：url：%@,\n postBody：%@",entrance.url,entrance.postDicFromEntrance);
    if (!self.sessionManager) {
        self.sessionManager = [AFHTTPSessionManager manager];
        self.sessionManager.requestSerializer.timeoutInterval = TIMEOUTINTEVAL;
        self.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    [self.sessionManager POST:[entrance url] parameters:[entrance postDicFromEntrance] progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id resault = [NSData pasingJson:responseObject];
        StatusHead *head = [[StatusHead alloc] initWithDictionary:resault[@"head"]];
        StatusManager *status = [StatusManager statusHead:head andNetWorkStatus:head.st == 0 ? kSuccess:kFailed];
        if (status.statusHead.st != 0) {
            failedHandle(status);
        }else{
            handle(status,resault[@"body"]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        StatusManager *status = [[StatusManager alloc] init];
        status.netWorkStatus = kFailed;
        status.statusHead.msg = @"网络连接失败";
        failedHandle(status);
    }];
}

- (void)postFormData:(HEntance *)entrance returnBack:(void (^)(StatusManager *status, NSDictionary *bodyDic))handle failedBack:(void(^)(StatusManager *status))failedHandle
{
    if (!self.sessionManager) {
        self.sessionManager = [AFHTTPSessionManager manager];
        self.sessionManager.requestSerializer.timeoutInterval = TIMEOUTINTEVAL;
        self.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    [self.sessionManager POST:[entrance url] parameters:[entrance postDicFromEntrance] constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFormData:[entrance bodyData] name:[entrance type]];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id resault = [NSData pasingJson:responseObject];
        StatusHead *head = [[StatusHead alloc] initWithDictionary:resault[@"head"]];
        StatusManager *status = [StatusManager statusHead:head andNetWorkStatus:head.st == 0 ? kSuccess:kFailed];
        if (status.statusHead.st != 0) {
            failedHandle(status);
        }else{
            handle(status,resault[@"body"]);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"网络无法连接");
    }];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
