//
//  BabeDetailViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/10.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "BabeDetailViewController.h"

@interface BabeDetailViewController ()
{
    UIScrollView *_scrollView;
}
@end

@implementation BabeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    
    [self createUI];
}
-(void)createUI{
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49)];
    [self.view addSubview:_scrollView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:[self createFrameWithX:5 andY:5 andWidth:310 andHeight:60]];
    label.layer.cornerRadius = 10.0;
    label.layer.borderColor = [UIColor blueColor].CGColor;
    label.layer.borderWidth = 1.0;
    [_scrollView addSubview:label];
    //创建9张图片
    for (int i = 0; i<9; i++) {
        UIButton *photoBtn = [[UIButton alloc]initWithFrame:[self createFrameWithX:10+110*(i%3) andY:70+110*(i/3) andWidth:80 andHeight:100]];
        [photoBtn setBackgroundImage:[UIImage imageNamed:@"moren"] forState:UIControlStateNormal];
        [photoBtn setBackgroundImage:[UIImage imageNamed:@"moren"] forState:UIControlStateHighlighted];
        [photoBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:photoBtn];
    }
    
    UILabel *numLabel = [[UILabel alloc]initWithFrame:[self createFrameWithX:5 andY:395 andWidth:310 andHeight:30]];
//    numLabel.layer.cornerRadius = 10.0;
    numLabel.layer.borderColor = [UIColor blueColor].CGColor;
    numLabel.layer.borderWidth = 1.0;
    [_scrollView addSubview:numLabel];
    if (IS_IPHONE_4_OR_LESS){
        _scrollView.contentSize = CGSizeMake(320, 568);
    }else{
        
    }
//    float heigh = numLabel.frame.size.height+numLabel.frame.origin.y;
//    _scrollView.contentSize = CGSizeMake(0, heigh);
    
    
}

#pragma mark - 点击图片变大
-(void)buttonClicked:(UIButton *)button{
    //把点击的button放在最外面
    [_scrollView bringSubviewToFront:button];
    //用来记住放大之前的位置和大小
    static CGRect frame;
    //如果是没有放大的状态
    if (button.frame.size.width != _scrollView.bounds.size.width) {
        //记录放大之前的位置和大小
        frame = button.frame;
        
        //开始动画块的标志
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        button.frame = _scrollView.bounds;
        [UIView commitAnimations];
    }else{
        //如果已经放大
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        //button还原为放大之前
        button.frame = frame;
        //提交动画
        [UIView commitAnimations];
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
