//
//  CustomTabBar.h
//  HiSchool
//
//  Created by ybon on 16/3/7.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomTabBar;

@protocol CustomTabBarDelegate <NSObject>

- (void)tabBar:(CustomTabBar *)tabBar selectedFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface CustomTabBar : UIView
@property (nonatomic, assign) id<CustomTabBarDelegate>delegate;
- (void)addButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage;
- (void)setSelectedBarButtonWithIdx:(NSInteger)idx;
@end
