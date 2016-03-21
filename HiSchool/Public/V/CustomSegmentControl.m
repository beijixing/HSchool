//
//  CustomSegmentControl.m
//  HiSchool
//
//  Created by ybon on 16/3/18.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "CustomSegmentControl.h"

@interface CustomSegmentControl ()
{
    NSMutableArray *_buttonsArr;
}
@property (nonatomic, strong)UIImageView *baseLine;
//@property (nonatomic, strong)UIImage *normalImage;
//@property (nonatomic, strong)UIImage *selectedImage;
@property (nonatomic, assign)NSInteger count;
@property (nonatomic, assign)CGFloat buttonWidth;
@property (nonatomic, strong)UIButton *lastSelectedBtn;
@end


@implementation CustomSegmentControl
- (instancetype)initWithFrame:(CGRect)frame andSegmentTitles:(NSArray*)titleArr{
    if (self = [super initWithFrame:frame]) {
        self.baseLine = [[UIImageView alloc] init];
        [self addSubview:self.baseLine];
        _buttonsArr = [[NSMutableArray alloc] init];

        if (titleArr) {
            NSInteger count = titleArr.count;
            self.buttonWidth = frame.size.width/count;
            int i = 0;
            for (NSString *title in titleArr) {
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                [btn setTitle:title forState:UIControlStateNormal];
                [btn setTitle:title forState:UIControlStateSelected];
                [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                btn.tag = i;
                btn.frame = CGRectMake(i*self.buttonWidth, 0, self.buttonWidth, frame.size.height-5);
                i++;
                [_buttonsArr addObject:btn];
                [self addSubview:btn];
            }
            self.baseLine.frame = CGRectMake(0, frame.size.height-2, self.buttonWidth, 2);
        }
    }
    return self;
}

- (void)btnClick:(UIButton *)button {
    if (button ==self.lastSelectedBtn) {
        return;
    }
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.baseLine.frame = CGRectMake(button.tag * self.buttonWidth, self.frame.size.height-2, self.buttonWidth, 2);

    } completion:^(BOOL finished) {
        if (self.lastSelectedBtn) {
            self.lastSelectedBtn.selected = NO;
        }
        button.selected = YES;
        self.lastSelectedBtn = button;
    }];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectedSegmentIndex:)]) {
        [self.delegate selectedSegmentIndex:button.tag];
    }
}

- (void)setNormalImage:(UIImage *)normalImage andSelectedImage:(UIImage *)selectedImage {
//    self.normalImage = normalImage;
//    self.selectedImage = selectedImage;
    for (UIButton *button in _buttonsArr) {
        [button setImage:normalImage forState:UIControlStateNormal];
        [button setImage:selectedImage forState:UIControlStateSelected];
    }
}

- (void)setBaseLineColor:(UIColor *)color {
    self.baseLine.backgroundColor = color;
}

- (void)setNormalTitleColor:(UIColor *)color andSelectedTitleColor:(UIColor *)selectedColor {
    for (UIButton *button in _buttonsArr) {
        [button setTitleColor:color forState:UIControlStateNormal];
        [button setTitleColor:selectedColor forState:UIControlStateSelected];
    }
}


- (void)setSelectedIndex:(NSInteger)selectedIdx {
    for (UIButton *button in _buttonsArr) {
        if (button.tag == selectedIdx) {
            self.baseLine.frame = CGRectMake(button.tag * self.buttonWidth, self.frame.size.height-2, self.buttonWidth, 2);
            if (self.lastSelectedBtn) {
                self.lastSelectedBtn.selected = NO;
            }
            button.selected = YES;
            self.lastSelectedBtn.selected = button;
            break;
        }
    }
}

@end
