//
//  NoticeDetailViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/9.
//  Copyright © 2016年 ybon. All rights reserved.
//
//社团公告详情
#import "NoticeDetailViewController.h"

@interface NoticeDetailViewController ()
{
    NSMutableArray *_dataSource;
    
    UILabel *_titleLbl;
    UILabel *_personLbl;
    UITextView *_newsView;
    UILabel *_timeLbl;
}
@end

@implementation NoticeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.96f alpha:1.00f];
    self.navigationController.navigationBarHidden = YES;
    
    _dataSource = [[NSMutableArray alloc]init];
    [self loadData];
    [self createUI];
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
    
    _titleLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:64 andWidth:300 andHeight:40]];
    _titleLbl.text = @"公告标题：XXXXXXXXXX";
    _titleLbl.font = [UIFont systemFontOfSize:15];
    _titleLbl.textAlignment = NSTextAlignmentCenter;
    _titleLbl.numberOfLines=0;
    _titleLbl.textColor = [UIColor colorWithRed:100.0/255 green:100.0/255 blue:100.0/255 alpha:1];
    [scrollView addSubview:_titleLbl];
    
    _personLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:104 andWidth:300 andHeight:20]];
    _personLbl.text = @"发件人：用户名";
    _personLbl.textColor = [UIColor colorWithRed:164.0/255 green:164.0/255 blue:164.0/255 alpha:1];
    _personLbl.font = [UIFont systemFontOfSize:13];
    _personLbl.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:_personLbl];
    
    _newsView = [[UITextView alloc]initWithFrame:[self createFrameWithX:10 andY:130 andWidth:300 andHeight:200]];
    _newsView.editable = NO;
    DLog(@"----%f",_newsView.frame.origin.y+_newsView.frame.size.height);
    // UITextView 边框
    _newsView.layer.borderColor = [UIColor redColor].CGColor;
    _newsView.layer.borderWidth = 1.0;
    _newsView.layer.cornerRadius = 5.0;
    _newsView.text = @"春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知春江水暖鸭先知";
    [scrollView addSubview:_newsView];
    
    UIButton *fileBtn = [[UIButton alloc]initWithFrame:[self createFrameWithX:10 andY:340 andWidth:150 andHeight:20]];
    [fileBtn setTitle:@"附件(文件大小不超过2M" forState:UIControlStateNormal];
    [fileBtn setTitleColor:[UIColor colorWithRed:164.0/255 green:164.0/255 blue:164.0/255 alpha:1] forState:UIControlStateNormal];
    [fileBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    fileBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    fileBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [fileBtn addTarget:self action:@selector(downloadFiles:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:fileBtn];
    
    _timeLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:160 andY:340 andWidth:150 andHeight:20]];
    _timeLbl.text = @"社团名称和时间";
    _timeLbl.textColor = [UIColor colorWithRed:164.0/255 green:164.0/255 blue:164.0/255 alpha:1];
    _timeLbl.font = [UIFont systemFontOfSize:13];
    _timeLbl.textAlignment = NSTextAlignmentRight;
    [scrollView addSubview:_timeLbl];

    
}
-(void)downloadFiles:(UIButton *)sender{
    DLog(@"下载附件");
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
