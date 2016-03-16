//
//  MicroDetailViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/10.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "MicroDetailViewController.h"

@interface MicroDetailViewController ()<UITextViewDelegate>
{
    UILabel *_titleLbl;
    UILabel *_authorLbl;
    UILabel *_universityLbl;
    UIImageView *_imageView;
    
    
    UITextView *_commentView;   //评论输入
    UIButton *_publishBtn;  //发布按钮
}
@end

@implementation MicroDetailViewController
-(void)viewWillAppear:(BOOL)animated{
    for (UIView *view in self.view.subviews) {
        [view removeFromSuperview];
    }
    [self createUI];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.96f alpha:1.00f];
    
    [self createUI];
    
    //注册通知,监听键盘弹出事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    //注册通知,监听键盘消失事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHidden) name:UIKeyboardDidHideNotification object:nil];
}
-(void)createUI{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH, SCREEN_HEIGHT-49-40)];
    [self.view addSubview:scrollView];  //根据最后的空间frame再设置scrollview的滚动大小
    if (IS_IPHONE_4_OR_LESS){
        scrollView.contentSize = CGSizeMake(320, 568);
    }
    
    _titleLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:44 andWidth:300 andHeight:40]];
    _titleLbl.text = @"我在学校的那个她";
    _titleLbl.font = [UIFont systemFontOfSize:15];
    _titleLbl.textAlignment = NSTextAlignmentLeft;
    _titleLbl.numberOfLines=0;
    _titleLbl.textColor = [UIColor colorWithRed:100.0/255 green:100.0/255 blue:100.0/255 alpha:1];
    [scrollView addSubview:_titleLbl];
    
    _authorLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:85 andWidth:150 andHeight:20]];
    _authorLbl.text = @"张三";
    _authorLbl.textColor = [UIColor colorWithRed:164.0/255 green:164.0/255 blue:164.0/255 alpha:1];
    _authorLbl.font = [UIFont systemFontOfSize:13];
    _authorLbl.textAlignment = NSTextAlignmentRight;
    [scrollView addSubview:_authorLbl];

    _universityLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:165 andY:85 andWidth:150 andHeight:20]];
    _universityLbl.text = @"山东建筑大学";
    _universityLbl.textColor = [UIColor colorWithRed:164.0/255 green:164.0/255 blue:164.0/255 alpha:1];
    _universityLbl.font = [UIFont systemFontOfSize:13];
    _universityLbl.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:_universityLbl];
    
    _imageView = [[UIImageView alloc]initWithFrame:[self createFrameWithX:10 andY:110 andWidth:300 andHeight:150]];
    _imageView.image = [UIImage imageNamed:@"moren"];
    [scrollView addSubview:_imageView];
    
    
    
    
    
    //评论、分享、收藏、举报
    for (int i = 0; i<=3; i++) {
        //        UIButton *btn = [[UIButton alloc]initWithFrame:[self createFrameWithX:70*i+40 andY:484 andWidth:30 andHeight:30]];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(70*i+40, SCREEN_HEIGHT-49-35, 30, 30)];
        btn.tag = 100+i;
        [btn setImage:[UIImage imageNamed:@"moren"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(sharePress:) forControlEvents:UIControlEventTouchUpInside];
        //        [scrollView addSubview:btn];
        [self.view addSubview:btn];
    }
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
