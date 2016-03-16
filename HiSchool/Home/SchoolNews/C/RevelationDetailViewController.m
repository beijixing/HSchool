//
//  RevelationDetailViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/7.
//  Copyright © 2016年 ybon. All rights reserved.
//
//校园爆料详情
#import "RevelationDetailViewController.h"
#import <QuartzCore/QuartzCore.h>       // UITextView边框需导入此头文件
@interface RevelationDetailViewController ()<UITextViewDelegate,UITextViewDelegate>
{
    UILabel *_labelTime;
    NSTimer *_timeNow;
    NSMutableArray *_dataSource;
    
    UILabel *_titleLbl;     //标题
    UILabel *_personLbl;    //记者
    UILabel *_timeLbl;      //时间
    UIImageView *_imageView;    //视频或图片
    UITextView *_newsView;      //新闻内容
    
    UITextView *_commentView;   //评论输入
    UIButton *_publishBtn;  //发布按钮
}
@end

@implementation RevelationDetailViewController
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.96f alpha:1.00f];
    _dataSource = [[NSMutableArray alloc]init];
    [self loadData];
    [self createUI];
    
    //注册通知,监听键盘弹出事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    //注册通知,监听键盘消失事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHidden) name:UIKeyboardDidHideNotification object:nil];
}
-(void)viewWillDisappear:(BOOL)animated{
    DLog(@"停止！！！");
    [_timeNow setFireDate:[NSDate distantFuture]];
}
-(void)loadData{
    DLog(@"请求数据");
}
-(void)createUI{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:scrollView];
    if (IS_IPHONE_4_OR_LESS){
        scrollView.contentSize = CGSizeMake(320, 568);
    }
    
    _titleLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:44 andWidth:300 andHeight:40]];
    _titleLbl.text = @"春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知";
    _titleLbl.font = [UIFont systemFontOfSize:15];
    _titleLbl.textAlignment = NSTextAlignmentCenter;
    _titleLbl.numberOfLines=0;
    _titleLbl.textColor = [UIColor colorWithRed:100.0/255 green:100.0/255 blue:100.0/255 alpha:1];
    [scrollView addSubview:_titleLbl];

    _personLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:84 andWidth:140 andHeight:20]];
    _personLbl.text = @"记者：谁谁谁谁";
    _personLbl.textColor = [UIColor colorWithRed:164.0/255 green:164.0/255 blue:164.0/255 alpha:1];
    _personLbl.font = [UIFont systemFontOfSize:13];
    _personLbl.textAlignment = NSTextAlignmentRight;
    [scrollView addSubview:_personLbl];
    
    _timeLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:170 andY:84 andWidth:140 andHeight:20]];
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *time = [formatter stringFromDate:date];
    _timeLbl.text = [NSString stringWithFormat:@"时间：%@",time];
    _timeLbl.textColor = [UIColor colorWithRed:100.0/255 green:100.0/255 blue:100.0/255 alpha:1];
    _timeLbl.font = [UIFont systemFontOfSize:13];
    _timeLbl.textAlignment = NSTextAlignmentLeft;
    [scrollView addSubview:_timeLbl];
    
    //视频或图片
    _imageView = [[UIImageView alloc]initWithFrame:[self createFrameWithX:10 andY:105 andWidth:300 andHeight:150]];
    _imageView.image = [UIImage imageNamed:@"moren"];
    [scrollView addSubview:_imageView];
    

    //新闻内容
    _newsView = [[UITextView alloc]initWithFrame:[self createFrameWithX:10 andY:260 andWidth:300 andHeight:199]];
    _newsView.editable = NO;
    DLog(@"----%f",_newsView.frame.origin.y+_newsView.frame.size.height);
    // UITextView 边框
    _newsView.layer.borderColor = [UIColor redColor].CGColor;
    _newsView.layer.borderWidth = 1.0;
    _newsView.layer.cornerRadius = 5.0;
    _newsView.text = @"春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知";
    [scrollView addSubview:_newsView];
    

    //评论、分享、收藏、举报
    for (int i = 0; i<=3; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:[self createFrameWithX:70*i+40 andY:464 andWidth:30 andHeight:30]];
        btn.tag = 100+i;
        [btn setImage:[UIImage imageNamed:@"moren"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(sharePress:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:btn];
    }
    
    //获取当前时间并走动
    _labelTime = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 200, 50)];
    [self.view addSubview:_labelTime];
    _timeNow = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerFunc) userInfo:nil repeats:YES];
    
    //获取系统时间
    NSDate * senddate=[NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"HH:mm"];
    NSString * locationString=[dateformatter stringFromDate:senddate];
    NSLog(@"-------%@",locationString);
    //获取系统时间
    NSCalendar * cal=[NSCalendar currentCalendar];
    NSUInteger unitFlags=NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit;
    NSDateComponents * conponent= [cal components:unitFlags fromDate:senddate];
    NSInteger year=[conponent year];
    NSInteger month=[conponent month];
    NSInteger day=[conponent day];
    NSString * nsDateString= [NSString stringWithFormat:@"%4ld年%2ld月%2ld日",(long)year,(long)month,(long)day];
    NSLog(@"+++++++++++++%@",nsDateString);
}
#pragma mark - 时间走动定时器
- (void)timerFunc{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/YY HH:mm:ss"];
    NSString *timestamp = [formatter stringFromDate:[NSDate date]];
    [_labelTime setText:timestamp];//时间在变化的语句
    NSLog(@"%@",timestamp);
}
#pragma mark - 分享收藏按钮点击方法
-(void)sharePress:(UIButton *)sender{
    if (sender.tag == 100) {
        DLog(@"评论");
        _commentView = [[UITextView alloc]init];
        _commentView.tag = 201;
        _commentView.delegate = self;
        _commentView.layer.borderWidth = 1.0;
        _commentView.layer.borderColor = [UIColor blueColor].CGColor;
        [self.view addSubview:_commentView];
        
        UILabel *commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, 100, 20)];
        commentLabel.tag = 999;
        commentLabel.text = @"请输入评论";
        commentLabel.font = [UIFont italicSystemFontOfSize:15];
        commentLabel.textColor = [UIColor colorWithRed:166.0/255 green:166.0/255 blue:166.0/255 alpha:1];
        [_commentView addSubview:commentLabel];
        _publishBtn = [[UIButton alloc]init];
        _publishBtn.tag = 202;
        _publishBtn.backgroundColor = [UIColor grayColor];
        _publishBtn.layer.cornerRadius = 5.0;
        _publishBtn.layer.borderColor = [UIColor blueColor].CGColor;
        _publishBtn.layer.borderWidth = 1.0;
        [_publishBtn setTitle:@"发布" forState:UIControlStateNormal];
        [_publishBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_publishBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [_publishBtn addTarget:self action:@selector(publishPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_publishBtn];
        //评论第一相应
        [_commentView becomeFirstResponder];
        
        
    }else if (sender.tag == 101){
        DLog(@"分享");
    }else if (sender.tag == 102){
        DLog(@"收藏");
    }else{
        DLog(@"举报");
    }
}
#pragma mark - 键盘出现时
-(void)keyboardDidShow:(NSNotification *)notification
{
    //获取键盘高度
    
    NSDictionary *userInfo = [notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    DLog(@"%d",height);
    
//    [UIView animateWithDuration:0.2 animations:^{
        _commentView.frame=CGRectMake(5, SCREEN_HEIGHT-height-190, SCREEN_WIDTH-10, 150);
        _publishBtn.frame = CGRectMake(SCREEN_WIDTH-60, SCREEN_HEIGHT-height-30, 50, 20);
 //   } completion:nil];
}

#pragma mark - 键盘消失时

-(void)keyboardDidHidden
{
//    [UIView animateWithDuration:0.2 animations:^{
//        _zlTableView.frame=CGRectMake(0, 0, SCREEN_WIDTH, _zlTableView.frame.size.height);
//    } completion:nil];
    for (UIView *view in self.view.subviews) {
        if (view.tag == 201 || view.tag==202) {
            [view removeFromSuperview];
        }
    }
}

-(void)publishPressed:(UIButton *)sender{
    //如果发布成功，则消失
    [self.view endEditing:YES];
    for (UIView *view in self.view.subviews) {
        if (view.tag == 201 || view.tag==202) {
            [view removeFromSuperview];
        }
    }
    
}

-(void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length != 0) {
        UILabel *label = [self.view viewWithTag:999];
        label.text = @"";
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
