//
//  MineDormCell.m
//  HiSchool
//
//  Created by ybon on 16/3/18.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "MineDormCell.h"

@interface MineDormCell ()
{
    float scaleX;
}
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIButton *editBtn;
@property (nonatomic, strong)UIButton *deleteBtn;
@property (nonatomic, strong)UIButton *setDefaultBtn;
@property (nonatomic, strong)UIImageView *verticalLine;
@end

@implementation MineDormCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        scaleX = SCREEN_WIDTH / 320;
        
        self.dormBackgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width/2, frame.size.width/2)];
        [self addSubview:self.dormBackgroundImage];
        
        self.dormIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width/2 - 8*scaleX, frame.size.width/2 - 8*scaleX)];
        self.dormIcon.layer.cornerRadius = (frame.size.width/2 - 8*scaleX)/2;
        [self addSubview:self.dormIcon];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width/2, 30*scaleX)];
        [self addSubview:self.titleLabel];
        self.editBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.editBtn.frame = CGRectMake(0, 0, 25*scaleX, 25*scaleX);
        [self addSubview:self.editBtn];
        self.verticalLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1, 15*scaleX)];
        [self addSubview:self.verticalLine];
        
        self.deleteBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.deleteBtn.frame = CGRectMake(0, 0, 25*scaleX, 25*scaleX);
        [self addSubview:self.deleteBtn];
        
        self.setDefaultBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.setDefaultBtn.frame = CGRectMake(0, 0, frame.size.width/2, 20*scaleX);
        [self addSubview:self.setDefaultBtn];
    }
    return self;
}
@end
