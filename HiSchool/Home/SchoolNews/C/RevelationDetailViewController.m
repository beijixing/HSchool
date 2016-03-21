//
//  RevelationDetailViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/7.
//  Copyright © 2016年 ybon. All rights reserved.
//
//校园爆料详情
#import "RevelationDetailViewController.h"
#import "RevelationDetailTableViewCell.h"

#import "UMSocial.h"

#import "ReportViewController.h"
@interface RevelationDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataSource;
    UITableView *_tableView;
    
    UIView *_headView;      //tableView的头视图
    UILabel *_titleLbl;     //标题
    UILabel *_personLbl;    //记者
    UILabel *_timeLbl;      //时间
    UIImageView *_imageView;    //视频或图片
//    UITextView *_newsView;      //新闻内容
    UILabel *_newsLabel;
    
    UILabel *_backLabel;
    UITextField *_commentView;   //评论输入
    UIButton *_publishBtn;  //发布按钮
    
    
    
}
@end

@implementation RevelationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    //导航栏时间标题视图
    [self configNavigationItemWithTitle:@"校园爆料"];
    
    _dataSource = [[NSMutableArray alloc]init];
    [self loadData];
    [self createUI];
    
    //注册通知,监听键盘弹出事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    //注册通知,监听键盘消失事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHidden) name:UIKeyboardDidHideNotification object:nil];
}

-(void)loadData{
    DLog(@"请求数据");
}
-(void)createUI{

    _headView = [[UIView alloc]init];
    [self.view addSubview:_headView];
    
    _titleLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:10 andWidth:300 andHeight:40]];
    _titleLbl.text = @"春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知";
    _titleLbl.font = [UIFont systemFontOfSize:15];
    _titleLbl.textAlignment = NSTextAlignmentCenter;
    _titleLbl.numberOfLines=0;
    _titleLbl.textColor = [UIColor colorWithRed:100.0/255 green:100.0/255 blue:100.0/255 alpha:1];
    [_headView addSubview:_titleLbl];

    _personLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:50 andWidth:140 andHeight:20]];
    _personLbl.text = @"记者：谁谁谁谁";
    _personLbl.textColor = [UIColor colorWithRed:164.0/255 green:164.0/255 blue:164.0/255 alpha:1];
    _personLbl.font = [UIFont systemFontOfSize:11];
    _personLbl.textAlignment = NSTextAlignmentRight;
    [_headView addSubview:_personLbl];
    
    _timeLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:170 andY:50 andWidth:140 andHeight:20]];
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *time = [formatter stringFromDate:date];
    _timeLbl.text = [NSString stringWithFormat:@"%@",time];
    _timeLbl.textColor = [UIColor colorWithRed:164.0/255 green:164.0/255 blue:164.0/255 alpha:1];
    _timeLbl.font = [UIFont systemFontOfSize:11];
    _timeLbl.textAlignment = NSTextAlignmentLeft;
    [_headView addSubview:_timeLbl];
    
    //视频或图片
    _imageView = [[UIImageView alloc]initWithFrame:[self createFrameWithX:10 andY:75 andWidth:300 andHeight:150]];
    _imageView.image = [UIImage imageNamed:@"moren"];
    [_headView addSubview:_imageView];
    

    //新闻内容
//    _newsView = [[UITextView alloc]initWithFrame:[self createFrameWithX:10 andY:230 andWidth:300 andHeight:199]];
//    _newsView.editable = NO;
//    DLog(@"----%f",_newsView.frame.origin.y+_newsView.frame.size.height);
//    // UITextView 边框
//    _newsView.layer.borderColor = [UIColor redColor].CGColor;
//    _newsView.layer.borderWidth = 1.0;
//    _newsView.layer.cornerRadius = 5.0;
//    _newsView.text = @"春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知";
//    [scrollView addSubview:_newsView];
//    
//    scrollView.frame = CGRectMake(0,0,SCREEN_WIDTH, _newsView.frame.origin.y+_newsView.frame.size.height);
    
    //新闻内容
    _newsLabel = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:230 andWidth:300 andHeight:100]];
    _newsLabel.numberOfLines = 0;
    _newsLabel.font = [UIFont systemFontOfSize:13];
    _newsLabel.text = @"将进酒-李白    君不见黄河之水天上来，奔流到海不复回。君不见高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，杯莫停。与君歌一曲，请君为我倾耳听。钟鼓馔玉不足贵，但愿长醉不复醒。古来圣贤皆寂寞，惟有饮者留其名。陈王昔时宴平乐，斗酒十千恣欢谑。主人何为言少钱，径须沽取对君酌。五花马，千金裘，呼儿将出换美酒，与尔同销万古愁";
    //自适应label
    CGSize size = [_newsLabel.text sizeWithFont:_newsLabel.font constrainedToSize:CGSizeMake(_newsLabel.frame.size.width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    //根据计算结果重新设置UILabel的尺寸
//    [_newsLabel setFrame:CGRectMake(20, 100, self.view.frame.size.width-40, size.height)];
    [_newsLabel setFrame:[self createFrameWithX:10 andY:230 andWidth:300 andHeight:size.height]];
    [_headView addSubview:_newsLabel];
    _headView.frame = CGRectMake(0,0,SCREEN_WIDTH, _newsLabel.frame.origin.y+_newsLabel.frame.size.height+60);
    
    UIImageView *cometosay = [[UIImageView alloc]initWithFrame:[self createFrameWithX:0 andY:_newsLabel.frame.origin.y+_newsLabel.frame.size.height+10 andWidth:100 andHeight:30]];
    cometosay.image = [UIImage imageNamed:@"cometosay"];
    [_headView addSubview:cometosay];
    UILabel *newComment = [[UILabel alloc]initWithFrame:[self createFrameWithX:0 andY:_newsLabel.frame.origin.y+_newsLabel.frame.size.height+40 andWidth:100 andHeight:20]];
    newComment.text = @"最新评论";
    newComment.font = [UIFont systemFontOfSize:11];
    newComment.textAlignment = NSTextAlignmentCenter;
    newComment.textColor = [UIColor colorWithRed:0.3922 green:0.3922 blue:0.3922 alpha:1.0];
    [_headView addSubview:newComment];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView = _headView;
    
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT-49-45-64, SCREEN_WIDTH-40, 40)];
    backImage.image = [UIImage imageNamed:@"grayback"];
    [self.view addSubview:backImage];
    

    NSArray *imageName = @[@"collection",@"share",@"report"];
    for (int i = 0; i<4; i++) {
        if (i==0) {
            //评论
            UIButton *commentBtn = [[UIButton alloc]initWithFrame:CGRectMake(20+backImage.frame.size.width/12, backImage.frame.origin.y+5, backImage.frame.size.width/12*4, 30)];
            commentBtn.layer.borderColor = [UIColor colorWithRed:0.64f green:0.64f blue:0.64f alpha:1.00f].CGColor;
            commentBtn.layer.borderWidth = 1.0;
            [commentBtn setTitle:@"我来说两句" forState:UIControlStateNormal];
            [commentBtn setTitleColor:[UIColor colorWithRed:0.64f green:0.64f blue:0.64f alpha:1.00f] forState:UIControlStateNormal];
            commentBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            commentBtn.tag = 100+i;
            [commentBtn addTarget:self action:@selector(sharePress:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:commentBtn];
        }else{
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20+backImage.frame.size.width/12*(6+(i-1)*2), backImage.frame.origin.y+10, backImage.frame.size.width/12, 20)];
            [btn setBackgroundImage:[UIImage imageNamed:imageName[i-1]] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(sharePress:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 100+i;
            [self.view addSubview:btn];
        }
    }
    
    //点击跳到顶部
    UIButton *topBtn = [[UIButton alloc]initWithFrame:[self createFrameWithX:SCREEN_WIDTH-50 andY:backImage.frame.origin.y-40 andWidth:30 andHeight:30]];
    [topBtn setBackgroundImage:[UIImage imageNamed:@"click_top"] forState:UIControlStateNormal];
    [topBtn addTarget:self action:@selector(clickToTop:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topBtn];
}

#pragma mark - tableView代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *string = @"string";
    RevelationDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"RevelationDetailTableViewCell" owner:self options:nil]lastObject];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - 分享收藏按钮点击方法
-(void)sharePress:(UIButton *)sender{
    if (sender.tag == 100) {
        DLog(@"评论");
        
        _backLabel = [[UILabel alloc]init];
        _backLabel.tag = 201;
        _backLabel.backgroundColor = [UIColor colorWithRed:0.95f green:0.96f blue:0.96f alpha:1.00f];
        [self.view addSubview:_backLabel];
        
        
        _commentView = [[UITextField alloc]init];
        _commentView.tag = 202;
        _commentView.layer.borderWidth = 1.0;
        _commentView.layer.borderColor = [UIColor colorWithRed:0.3922 green:0.3922 blue:0.3922 alpha:1.0].CGColor;
        _commentView.layer.cornerRadius = 5.0;
        [self.view addSubview:_commentView];
        
        _publishBtn = [[UIButton alloc]init];
        _publishBtn.tag = 203;
        _publishBtn.layer.cornerRadius = 5.0;
        _publishBtn.layer.borderColor = [UIColor colorWithRed:0.3922 green:0.3922 blue:0.3922 alpha:1.0].CGColor;
        _publishBtn.layer.borderWidth = 1.0;
        _publishBtn.backgroundColor = [UIColor whiteColor];
        [_publishBtn setTitle:@"发布" forState:UIControlStateNormal];
        [_publishBtn setTitleColor:[UIColor colorWithRed:0.3922 green:0.3922 blue:0.3922 alpha:1.0] forState:UIControlStateNormal];
        [_publishBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [_publishBtn addTarget:self action:@selector(publishPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_publishBtn];
        //评论第一相应
        [_commentView becomeFirstResponder];
        
        
    }else if (sender.tag == 101){
        DLog(@"收藏");
    }else if (sender.tag == 102){
        DLog(@"分享");
//        self.tabBarController.tabBar.hidden = YES;
//        UIImageView *shareView = [[UIImageView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-200-64, SCREEN_WIDTH, 200)];
//        shareView.backgroundColor = [UIColor whiteColor];
//        [self.view addSubview:shareView];
//        
//        UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 60, 20)];
//        titleLbl.text = @"分享到";
//        titleLbl.textColor = [UIColor colorWithRed:0.3922 green:0.3922 blue:0.3922 alpha:1.0];
//        [shareView addSubview:titleLbl];
        
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:@"5690674767e58ee2e6000f7e"
                                          shareText:@"你要分享的文字"
                                         shareImage:[UIImage imageNamed:@"moren.png"]
                                    shareToSnsNames:[NSArray arrayWithObjects:
                                        UMShareToQQ,UMShareToSina,UMShareToWechatSession,nil]
                                           delegate:nil];
        [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://www.baidu.com";
        
        
    }else{
        DLog(@"举报");
        ReportViewController *report = [[ReportViewController alloc]init];
        [self.navigationController pushViewController:report animated:YES];
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
    _backLabel.frame = CGRectMake(0, SCREEN_HEIGHT-height-49-60, SCREEN_WIDTH, 60);
    _commentView.frame=CGRectMake(5, SCREEN_HEIGHT-height-49-55, SCREEN_WIDTH-70, 30);
    _publishBtn.frame = CGRectMake(SCREEN_WIDTH-60, SCREEN_HEIGHT-height-49-55, 50, 30);
 //   } completion:nil];
}

#pragma mark - 键盘消失时

-(void)keyboardDidHidden
{
//    [UIView animateWithDuration:0.2 animations:^{
//        _zlTableView.frame=CGRectMake(0, 0, SCREEN_WIDTH, _zlTableView.frame.size.height);
//    } completion:nil];
    for (UIView *view in self.view.subviews) {
        if (view.tag == 201 || view.tag==202 || view.tag==203) {
            [view removeFromSuperview];
        }
    }
}

-(void)publishPressed:(UIButton *)sender{
    //如果发布成功，则消失
    [self.view endEditing:YES];
    for (UIView *view in self.view.subviews) {
        if (view.tag == 201 || view.tag==202 || view.tag==202) {
            [view removeFromSuperview];
        }
    }
    
}

#pragma mark - 点击跳到顶部
-(void)clickToTop:(UIButton *)sender{
    [_tableView setContentOffset:CGPointMake(0,0) animated:YES];
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
