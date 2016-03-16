//
//  HttpRequest.h
//  Y
//
//  Created by Y on 15/10/26.
//  Copyright (c) 2015年 Y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFAppDotNetAPIClient.h"
@interface HttpRequest : NSObject

//获取家政个数
+(NSURLSessionDataTask *)getWiferyType:(void (^)(id obj,NSError *err))sucess;



@end










