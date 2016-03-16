//
//  HttpRequest.m
//  Y
//
//  Created by Y on 15/10/26.
//  Copyright (c) 2015年 Y. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest


//获取家政个数
+(NSURLSessionDataTask *)getWiferyType:(void (^)(id obj,NSError *err))sucess{
    NSString * path = WIFERYTYPE;
    DLog(@"路径----%@",path);
    return [[AFAppDotNetAPIClient sharedClient]GET:path parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary* responseObject) {
        NSDictionary * dict =responseObject;
        NSArray * array = dict[@"result"];
        if (sucess) {
            sucess(array,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        DLog(@"请求家政失败-------%@--------",error.description);
    }];
}




@end
