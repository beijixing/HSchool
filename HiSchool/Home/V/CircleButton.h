//
//  CircleButton.h
//  HiSchool
//
//  Created by ybon on 16/3/8.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CircleButtonClick)(NSInteger tag, NSString *title);

@interface CircleButton : UIView
@property (nonatomic, copy)CircleButtonClick btnClickBlock;
- (void)addButtonImage:(UIImage *)image andSelectedImage:(UIImage *)selectedImage;
- (void)setupTitileLabelFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)txt;
@end
