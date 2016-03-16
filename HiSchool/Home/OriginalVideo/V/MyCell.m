//
//  MyCell.m
//  UICollectionView_base
//
//  Created by ybon on 16/3/10.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

//重写初始化方法
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}
-(void)setImageStr:(NSString *)imageStr  title:(NSString *)title university:(NSString *)university{
    if (IS_IPHONE_4_OR_LESS||IS_IPHONE_5){
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height-22)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageStr]];
        [self addSubview:imageView];
        
        
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height-20, self.frame.size.width, 10)];
        titleLable.text = title;
        titleLable.textColor = [UIColor colorWithRed:0.3922 green:0.3922 blue:0.3922 alpha:1.0];
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = [UIFont systemFontOfSize:10];
        [self addSubview:titleLable];
        
        UILabel *universityLable = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height-8,self. frame.size.width, 8)];
        universityLable.text = university;
        universityLable.textColor = [UIColor colorWithRed:0.5647 green:0.5647 blue:0.5647 alpha:1.0];
        universityLable.textAlignment = NSTextAlignmentRight;
        universityLable.font = [UIFont systemFontOfSize:10];
        [self addSubview:universityLable];
    }else{
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height-33)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageStr]];
        [self addSubview:imageView];
        
        
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height-30, self.frame.size.width, 15)];
        titleLable.text = title;
        titleLable.textColor = [UIColor colorWithRed:0.3922 green:0.3922 blue:0.3922 alpha:1.0];
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = [UIFont systemFontOfSize:13];
        [self addSubview:titleLable];
        
        UILabel *universityLable = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height-12,self. frame.size.width, 12)];
        universityLable.text = university;
        universityLable.textColor = [UIColor colorWithRed:0.5647 green:0.5647 blue:0.5647 alpha:1.0];
        universityLable.textAlignment = NSTextAlignmentLeft;
        universityLable.font = [UIFont systemFontOfSize:13];
        [self addSubview:universityLable];
        
    }
}


@end
