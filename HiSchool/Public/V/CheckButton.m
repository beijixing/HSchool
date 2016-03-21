//
//  CheckButton.m
//  HiSchool
//
//  Created by ybon on 16/3/11.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "CheckButton.h"
#import "Masonry.h"
@interface CheckButton ()

@property (nonatomic, strong) UIImageView *indicatorIcon;
@property (nonatomic, strong) UILabel *desLabel;
@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *selectedImage;

@end

@implementation CheckButton
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.indicatorIcon = [[UIImageView alloc] init];
        self.desLabel = [[UILabel alloc] init];
        [self addSubview:self.indicatorIcon];
        [self addSubview:self.desLabel];
        [self layoutSubviews];
        
       UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureEvent:)];
        [self addGestureRecognizer:gesture];
        _selectedState = false;
    }
    return self;
}

- (void)layoutSubviews {
    [self.indicatorIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.mas_height);
        make.width.mas_equalTo(self.mas_height);
        make.left.mas_equalTo(2);
        make.top.mas_equalTo(2);
    }];
    
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.indicatorIcon.mas_right).offset(4);
        make.top.mas_equalTo(2);
        make.right.mas_equalTo(self.mas_right).offset(-2);
        make.bottom.mas_equalTo(2);
    }];
}

- (void)setNormalImage:(UIImage *)normalImage andSelectedImage:(UIImage *)selectedImage {
    self.normalImage = normalImage;
    self.selectedImage = selectedImage;
}

- (void)setTitleColor:(UIColor *)titleColor andFont:(UIFont *)font andTitleText:(NSString *)text {
    self.desLabel.text = text;
    if (titleColor) {
        self.desLabel.textColor = titleColor;
    }
    
    if (font) {
        self.desLabel.font = font;
    }
}

- (void)setSelectedState:(BOOL)selectedState
{
    _selectedState = selectedState;
    if (self.selectedState) {
        self.indicatorIcon.image = self.selectedImage;
    }else {
        self.indicatorIcon.image = self.normalImage;
    }
}

- (void)tapGestureEvent:(UIGestureRecognizer *)gesture {
    _selectedState = !_selectedState;
    [self setSelectedState:_selectedState];
}

@end
