//
//  NSAttributedString+MLLabel.m
//  Pods
//
//  Created by molon on 15/6/13.
//
//

#import "NSAttributedString+MLLabel.h"

@implementation NSAttributedString (MLLabel)

+ (instancetype)attributedStringWithHTML:(NSString*)htmlString
{
    NSData* htmlData = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
    if (htmlData) {
        __block id attributedString = nil;
        dispatch_block_t block = ^{
            attributedString = [[self alloc] initWithData:htmlData
                                                  options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                            NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                                       documentAttributes:nil
                                                    error:NULL];
        };
        
        //这个解析必须在主线程执行，文档上要求的
        if ([NSThread isMainThread]) {
            block();
        }else{
            dispatch_sync(dispatch_get_main_queue(), block);
        }
        
        return attributedString;
    }
    
    return nil;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com