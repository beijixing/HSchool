//
//  CustomSegmentControl.h
//  HiSchool
//
//  Created by ybon on 16/3/18.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomSegmentControlDelegate <NSObject>
- (void)selectedSegmentIndex:(NSInteger) index;
@end

@interface CustomSegmentControl : UIView
@property(nonatomic, assign) id <CustomSegmentControlDelegate>delegate;
- (void)setNormalImage:(UIImage *)normalImage andSelectedImage:(UIImage *)selectedImage;
- (instancetype)initWithFrame:(CGRect)frame andSegmentTitles:(NSArray*)titleArr;
- (void)setBaseLineColor:(UIColor *)color;
- (void)setNormalTitleColor:(UIColor *)color andSelectedTitleColor:(UIColor *)selectedColor;
- (void)setSelectedIndex:(NSInteger)selectedIdx;
@end
