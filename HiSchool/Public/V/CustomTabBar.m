//
//  CustomTabBar.m
//  HiSchool
//
//  Created by ybon on 16/3/7.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "CustomTabBar.h"

@interface CustomTabBar ()

@property (nonatomic, weak)UIButton *selectedBtn;

@end

@implementation CustomTabBar
- (void)addButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    UIButton *button = [[UIButton alloc] init];
    
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    button.tag = self.subviews.count;
    [self addSubview:button];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//    if (self.subviews.count == 1) {
//        [self buttonClick:button];
//    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat buttonSpace = (self.bounds.size.width - 5*self.bounds.size.height)/6;
    CGFloat buttonWidth = self.bounds.size.height;
    NSInteger count = self.subviews.count;
    for (int i = 0; i <count; i++) {
        UIButton *btn = self.subviews[i];
        CGFloat x = i *(buttonWidth  + buttonSpace) + buttonSpace;
        CGFloat height = self.bounds.size.height;
        btn.frame = CGRectMake(x, 0, buttonWidth, height);
    }
}

-(void)buttonClick:(UIButton*)button {
    self.selectedBtn.selected = NO;
    button.selected = YES;
    self.selectedBtn = button;
    
    if ([self.delegate respondsToSelector:@selector(tabBar:selectedFrom:to:)]) {
        [self.delegate tabBar:self selectedFrom:self.selectedBtn.tag to:button.tag];
    }
}

- (void)setSelectedBarButtonWithIdx:(NSInteger)idx {
    for (UIButton *button in self.subviews) {
        if (button.tag == idx) {
            [self buttonClick:button];
            break;
        }
    }
}
@end
