//
//  VideoView.m
//  HiSchool
//
//  Created by ybon on 16/3/8.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "VideoView.h"

@implementation VideoView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(void)setImageStr:(NSString *)imageStr number:(NSString *)number title:(NSString *)title{
    if (IS_IPHONE_4_OR_LESS||IS_IPHONE_5){
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageStr]];
        [self addSubview:imageView];
        
        UILabel *backLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height-30, self.frame.size.width, 30)];
        backLabel.backgroundColor = [UIColor blackColor];
        backLabel.alpha = 0.3;
        [self addSubview:backLabel];
        
        UIButton *playBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, self.frame.size.height-25, 20, 20)];
        [playBtn setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [self addSubview:playBtn];
        
        UILabel *numLable = [[UILabel alloc] initWithFrame:CGRectMake(30, self.frame.size.height-25,40, 20)];
        numLable.text = number;
        numLable.textColor = [UIColor whiteColor];
        numLable.textAlignment = NSTextAlignmentLeft;
        numLable.font = [UIFont systemFontOfSize:12];
        [self addSubview:numLable];
        
        
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(60, self.frame.size.height-25, self.frame.size.width-60, 20)];
        titleLable.text = title;
        titleLable.textColor = [UIColor whiteColor];
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = [UIFont systemFontOfSize:12];
        [self addSubview:titleLable];

    }else{
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageStr]];
        [self addSubview:imageView];
        
        UILabel *backLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height-30, self.frame.size.width, 30)];
        backLabel.backgroundColor = [UIColor blackColor];
        backLabel.alpha = 0.3;
        [self addSubview:backLabel];
        
        UIButton *playBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, self.frame.size.height-25, 20, 20)];
        [playBtn setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [self addSubview:playBtn];
        
        UILabel *numLable = [[UILabel alloc] initWithFrame:CGRectMake(30, self.frame.size.height-25,40, 20)];
        numLable.text = number;
        numLable.textColor = [UIColor whiteColor];
        numLable.textAlignment = NSTextAlignmentLeft;
        numLable.font = [UIFont systemFontOfSize:13];
        [self addSubview:numLable];
        
        
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(60, self.frame.size.height-25, self.frame.size.width-60, 20)];
        titleLable.text = title;
        titleLable.textColor = [UIColor whiteColor];
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = [UIFont systemFontOfSize:13];
        [self addSubview:titleLable];

    }
}



@end
