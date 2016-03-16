//
//  NavigationBarTitleVIew.m
//  HiSchool
//
//  Created by ybon on 16/3/7.
//  Copyright © 2016年 ybon. All rights reserved.
//

/*
 创建一个单例来管理该视图，为的是不重复请求数据。
 */
#import "NavigationBarTitleVIew.h"
#import "Masonry.h"
@implementation NavigationBarTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.schoolNameLB = [[UILabel alloc] init];
        self.schoolNameLB.font = [UIFont fontWithName:@"Arial" size:12];
        self.schoolNameLB.textAlignment = NSTextAlignmentLeft;
        self.timeLB = [[UILabel alloc] init];
        self.timeLB.textAlignment = NSTextAlignmentLeft;
        self.timeLB.font = [UIFont fontWithName:@"Arial" size:12];
        self.titleLB = [[UILabel alloc] init];
        self.titleLB.font = [UIFont fontWithName:@"Arial" size:13];
        self.titleLB.textAlignment = NSTextAlignmentCenter;
        
        self.titleImage = [[UIImageView alloc] init];
        
        
        self.weatherLB = [[UILabel alloc] init];
        self.weatherLB.font = [UIFont fontWithName:@"Arial" size:12];
        self.weatherLB.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.schoolNameLB];
        [self addSubview:self.timeLB];
        [self addSubview:self.titleLB];
        [self addSubview:self.titleImage];
        [self addSubview:self.weatherLB];
        
        self.schoolNameLB.text = @"中国石油大学";
        self.timeLB.text = @"2015.02.17 18:00";
        self.titleLB.text = @"HiSchool";
        self.weatherLB.text = @"青岛 阴转小雨";
        
        [self layoutSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    float scaleX = SCREEN_WIDTH/320;
    [self.schoolNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
    }];
    
    [self.timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(120, 20));
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
    }];
    
    [self.titleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80*scaleX, 30*scaleX));
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(-5);
    }];
    
    [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80*scaleX, 30*scaleX));
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(-5);
    }];

    [self.weatherLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.right.mas_equalTo(self).offset(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.addressLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.right.mas_equalTo(self).offset(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.weatherImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.right.mas_equalTo(self).offset(0);
        make.bottom.mas_equalTo(0);
    }];
}

@end
