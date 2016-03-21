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
        self.schoolNameLB.font = [UIFont fontWithName:@"Arial" size:10];
        self.schoolNameLB.textAlignment = NSTextAlignmentLeft;
        self.schoolNameLB.textColor = [UIColor whiteColor];
        self.timeLB = [[UILabel alloc] init];
        self.timeLB.textAlignment = NSTextAlignmentLeft;
        self.timeLB.font = [UIFont fontWithName:@"Arial" size:10];
        self.timeLB.textColor = [UIColor whiteColor];
        self.titleLB.textColor = [UIColor whiteColor];
        self.titleLB = [[UILabel alloc] init];
        self.titleLB.font = [UIFont fontWithName:@"Arial" size:17];
        self.titleLB.textAlignment = NSTextAlignmentCenter;
        self.titleLB.textColor = [UIColor whiteColor];
        
        self.titleImage = [[UIImageView alloc] init];
        self.addressLB = [[UILabel alloc] init];
        self.addressLB.font = [UIFont fontWithName:@"Arial" size:10];
        self.addressLB.textAlignment = NSTextAlignmentLeft;
        self.addressLB.textColor = [UIColor whiteColor];
        
        self.weatherLB = [[UILabel alloc] init];
        self.weatherLB.font = [UIFont fontWithName:@"Arial" size:10];
        self.weatherLB.textAlignment = NSTextAlignmentLeft;
        self.weatherLB.textColor = [UIColor whiteColor];
        self.weatherImage = [[UIImageView alloc] init];
        self.weatherImage.image = [UIImage imageNamed:@"weatherDefault"];
        
        [self addSubview:self.schoolNameLB];
        [self addSubview:self.timeLB];
        [self addSubview:self.titleLB];
        [self addSubview:self.titleImage];
        [self addSubview:self.weatherLB];
        [self addSubview:self.weatherImage];
        [self addSubview:self.addressLB];
        
        self.schoolNameLB.text = @"中国石油大学";
        self.timeLB.text = @"2015.02.17 18:00";
        self.titleLB.text = @"HiSchool";
        self.weatherLB.text = @"阴转小雨";
        self.addressLB.text = @"青岛";
        
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
        make.size.mas_equalTo(CGSizeMake(83*scaleX, 15*scaleX));
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(-15);
    }];
    
    [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80*scaleX, 25*scaleX));
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(-5);
    }];

    [self.addressLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50*scaleX, 15));
        make.right.mas_equalTo(self.weatherImage.mas_left).offset(0);
        make.top.mas_equalTo(self.weatherImage.mas_top).offset(5);
    }];
    
    [self.weatherLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50*scaleX, 15));
        make.right.mas_equalTo(self.weatherImage.mas_left).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-5);
    }];
    
    [self.weatherImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.right.mas_equalTo(self).offset(0);
        make.bottom.mas_equalTo(self).offset(-10);
    }];
}

@end
