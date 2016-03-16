//
//  HotspotsDetailViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/9.
//  Copyright © 2016年 ybon. All rights reserved.
//
//热点论战详情
#import "HotspotsDetailViewController.h"

@interface HotspotsDetailViewController ()<UITextViewDelegate>
{
    UIImageView *_headView;
    UILabel *_numLabel;
    
    UITextView *_commentView;   //评论输入
    UIButton *_supportBtn;  //支持按钮
    UIButton *_cancelBtn;  //取消按钮
    UIButton *_opposeBtn;   //反对按钮
}
@end

@implementation HotspotsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.96f alpha:1.00f];
    self.navigationController.navigationBarHidden = YES;
    [self createUI];
    
    //注册通知,监听键盘弹出事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    //注册通知,监听键盘消失事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHidden) name:UIKeyboardDidHideNotification object:nil];
}
-(void)createUI{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH, SCREEN_HEIGHT-49-40)];
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    if (IS_IPHONE_4_OR_LESS){
        scrollView.contentSize = CGSizeMake(320, 568);
    }
    
    _headView = [[UIImageView alloc]initWithFrame:[self createFrameWithX:10 andY:30 andWidth:300 andHeight:150]];
    _headView.backgroundColor = [UIColor blueColor];
    _headView.layer.cornerRadius = 10;
    [scrollView addSubview:_headView];
    
    _numLabel = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:190 andWidth:300 andHeight:30]];
    _numLabel.layer.cornerRadius = 10.0;
    _numLabel.layer.borderWidth = 1.0;
    _numLabel.layer.borderColor = [UIColor blackColor].CGColor;
    _numLabel.text = @"正方人数：10人  反方人数：10人";
    _numLabel.textAlignment = NSTextAlignmentLeft;
    [scrollView addSubview:_numLabel];
    
    
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
-(void)sharePress:(UIButton *)sender{
    if (sender.tag == 100) {
        DLog(@"评论");
        _commentView = [[UITextView alloc]init];
        _commentView.tag = 201;
        _commentView.delegate = self;
        [self.view addSubview:_commentView];
        
        UILabel *commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, 100, 20)];
        commentLabel.tag = 999;
        commentLabel.text = @"请输入评论";
        commentLabel.font = [UIFont italicSystemFontOfSize:15];
        commentLabel.textColor = [UIColor colorWithRed:166.0/255 green:166.0/255 blue:166.0/255 alpha:1];
        [_commentView addSubview:commentLabel];
        
//        _publishBtn = [[UIButton alloc]init];
//        _publishBtn.tag = 202;
//        _publishBtn.backgroundColor = [UIColor grayColor];
//        [_publishBtn setTitle:@"发布" forState:UIControlStateNormal];
//        [_publishBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_publishBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//        [_publishBtn addTarget:self action:@selector(publishPressed:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:_publishBtn];

        
        
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
    

    _commentView.frame=CGRectMake(5, SCREEN_HEIGHT-height-190, SCREEN_WIDTH-10, 150);
    _commentView.layer.borderColor = [UIColor blueColor].CGColor;
    _commentView.layer.borderWidth = 1.0;
        
    NSArray *titleArr = @[@"支持",@"取消",@"反对"];
    for (int i=0; i<3; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(((SCREEN_WIDTH-150)/4+50)*i+(SCREEN_WIDTH-150)/4, SCREEN_HEIGHT-height-30, 50, 20)];
        btn.layer.borderColor = [UIColor blueColor].CGColor;
        btn.layer.borderWidth = 1.0;
        btn.layer.cornerRadius = 10;
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 202+i;
        [self.view addSubview:btn];
    }
}

#pragma mark - 键盘消失时

-(void)keyboardDidHidden
{
    //    [UIView animateWithDuration:0.2 animations:^{
    //        _zlTableView.frame=CGRectMake(0, 0, SCREEN_WIDTH, _zlTableView.frame.size.height);
    //    } completion:nil];
    for (UIView *view in self.view.subviews) {
        if (view.tag == 201 || view.tag==202|| view.tag==203|| view.tag==204) {
            [view removeFromSuperview];
        }
    }
}

-(void)btnPressed:(UIButton *)sender{
    [self.view endEditing:YES];
    for (UIView *view in self.view.subviews) {
        if (view.tag == 201 || view.tag==202|| view.tag==203|| view.tag==204) {
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
