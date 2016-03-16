//
//  NSMutableAttributedString+MLLabel.m
//  MLLabel
//
//  Created by molon on 15/6/5.
//  Copyright (c) 2015年 molon. All rights reserved.
//

#import "NSMutableAttributedString+MLLabel.h"

@implementation NSMutableAttributedString (MLLabel)

- (void)removeAllNSOriginalFontAttributes
{
    [self enumerateAttribute:@"NSOriginalFont" inRange:NSMakeRange(0, self.length) options:0 usingBlock:^(id value, NSRange range, BOOL *stop) {
        if (value){
            [self removeAttribute:@"NSOriginalFont" range:range];
        }
    }];
}


- (void)removeAttributes:(NSArray *)names range:(NSRange)range
{
    for (NSString *name in names) {
        [self removeAttribute:name range:range];
    }
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com