//
//  CheckButton.h
//  HiSchool
//
//  Created by ybon on 16/3/11.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckButton : UIView
@property(nonatomic, assign) BOOL selectedState;
- (void)setNormalImage:(UIImage *)normalImage andSelectedImage:(UIImage *)selectedImage;
- (void)setTitleColor:(UIColor *)titleColor andFont:(UIFont *)font andTitleText:(NSString *)text ;
@end
