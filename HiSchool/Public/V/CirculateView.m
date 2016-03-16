//
//  HeaderView.m
//  YbYoutianNew
//
//  Created by macbook on 16/1/3.
//  Copyright © 2016年 YBON. All rights reserved.
//

#import "CirculateView.h"
#import "UIImageView+WebCache.h"
#import "TimerManager.h"
@interface CirculateView ()<TimerManagerDelegate>
{
    NSMutableArray *_imagesArray;
}
@end

@implementation CirculateView

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
    _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    //指定滚动视图的代理
    _scrollView.delegate = self;
    
    //设置按页滚动
    _scrollView.pagingEnabled = YES;
    //隐藏滚动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.directionalLockEnabled = YES;
    _scrollView.alwaysBounceHorizontal = YES;
    _scrollView.alwaysBounceVertical = NO;
    [self addSubview:_scrollView];
    
    _pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width-200, 30)];
    _pageControl.center = CGPointMake(self.frame.size.width/2, self.frame.size.height - 15);
    _pageControl.backgroundColor = [UIColor clearColor];
    _pageControl.currentPageIndicatorTintColor=[UIColor colorWithRed:0.94f green:0.75f blue:0.00f alpha:1.0f];
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPage = 0;
    [self addSubview:_pageControl];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tapGesture];
}

- (void)tapAction:(UIGestureRecognizer *) gesture {
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(circulateViewClicked:)]) {
            [self.delegate circulateViewClicked: _pageIndex];
        }
    }
}

-(void)addScrollImages:(NSArray *)array
{
    _imagesArray = [[NSMutableArray alloc] initWithArray: array];
    if (_imagesArray.count == 0) {
        UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        bgImageView.image = [UIImage imageNamed:@"beijingtu"];
        [self addSubview:bgImageView];
    }
    
    //根据数据多少，设置显示尺寸大小
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * ([_imagesArray count]), 0);
    //刷新显示的图片
    for (UIView * subView in _scrollView.subviews)
    {
        //移除所有的子视图
        [subView removeFromSuperview];
    }
    //添加新的显示图片
    NSArray *colors = [NSArray arrayWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor orangeColor], nil];
    int i = 0;
    for(int j = 0; j <_imagesArray.count ;j++)
    {
        UIImageView *imageView = [[UIImageView alloc]init];
        //设置图片位置和大小
        imageView.frame = CGRectMake(i * _scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
        imageView.backgroundColor = colors[j];
        [_scrollView addSubview:imageView];
        i++;
    }
    
    //设置_pageControl
    _pageControl.currentPage = 0;
    _pageControl.numberOfPages = [_imagesArray count];
    if ([_imagesArray count] > 0) {
//        _titleLabel1.text = adModel.name;
    }
    
    if ([_imagesArray count] <= 1) {
        _scrollView.scrollEnabled = NO;
    }
}

//结束减速，滚动结束
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / self.frame.size.width;
    _pageControl.currentPage = index;
    _pageIndex = index;
}

-(void)nextPage{
    NSLog(@"nextPage....");
    if ([_imagesArray count] <= 1)
        return;
    //滚动视图变化
    _pageIndex++;
    _scrollView.contentOffset = CGPointMake(_scrollView.frame.size.width * _pageIndex, 0);
    if (_pageIndex == [_imagesArray count]) {
        _scrollView.contentOffset = CGPointMake(0, 0);
        _pageIndex = 0;
    }
    //页面控件变化
    _pageControl.currentPage = _pageIndex;
}

- (void)timerManagerSecondsEvent {
    if (self.delayTime%2 == 0) {
        [self nextPage];
    }
    self.delayTime++;
}

-(void)startScroll {
     [TimerManager sharedManager].delegate = self;
}

-(void)stopScroll {
    [[TimerManager sharedManager] removeDelegate:self];
}

@end
