//
//  NSString+MLExpression.m
//  Pods
//
//  Created by molon on 15/6/18.
//
//

#import "NSString+MLExpression.h"

@implementation NSString (MLExpression)

- (NSAttributedString*)expressionAttributedStringWithExpression:(MLExpression*)expression;
{
    return [MLExpressionManager expressionAttributedStringWithString:self expression:expression];
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com