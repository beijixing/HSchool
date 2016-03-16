//
//  FriendShipCell.m
//  HiSchool
//
//  Created by ybon on 16/3/10.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "FriendShipCell.h"

@implementation FriendShipCell
{
    UIImageView *_iconImageView;//显示图片
    UILabel *_titleLabel;//显示文字
   
}//重写初始化方法
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}
-(void)createSubViews
{
    _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, self.frame.size.width-20, self.frame.size.width-20)];
    _iconImageView.layer.cornerRadius = 10;
    [self.contentView addSubview:_iconImageView];
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    //设置选中时的背景视图，只要继承于UIView的视图对象都可以
    self.selectedBackgroundView = view;
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _iconImageView.frame.size.height, self.frame.size.width, self.frame.size.height-_iconImageView.frame.size.height)];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:11];
    _titleLabel.numberOfLines = 0;
    //contentView是苹果提供的与cell本身一样大小的空白view，建议将自定义的控件添加到contentView上
    [self.contentView addSubview:_titleLabel];
    
}

//通过设置属性值刷新显示内容
-(void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = _title;
}
-(void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    //这种方式是不推荐的
    //    _iconImageView.image = [UIImage imageNamed:_imageName];
    
    NSArray *array = [imageName componentsSeparatedByString:@"."];
    //获取图片路径
    NSString *path = [[NSBundle mainBundle]pathForResource:array[0] ofType:array[1]];
    //通过路径读取图片数据
    NSData *imageData = [[NSData alloc]initWithContentsOfFile:path];
    //创建图片对象
    UIImage *image = [[UIImage alloc]initWithData:imageData];
    //用_iconImageView上显示
    _iconImageView.image = image;
}



- (void)awakeFromNib {
    // Initialization code
}

@end
