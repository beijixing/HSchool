//
//  NoticeDetailViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/9.
//  Copyright © 2016年 ybon. All rights reserved.
//
//社团公告详情
#import "NoticeDetailViewController.h"
#import "UMSocial.h"
#import "ReportViewController.h"
@interface NoticeDetailViewController ()
{
    NSMutableArray *_dataSource;
    
    UILabel *_titleLbl;
    UILabel *_personLbl;
    UILabel *_timeLbl;
    UILabel *_detailLbl;    //自适应的内容
    UILabel *_shetuanLbl;
}
@end

@implementation NoticeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航栏时间标题视图
    [self configNavigationItemWithTitle:@"校园爆料"];
    _dataSource = [[NSMutableArray alloc]init];
    [self loadData];
    [self createUI];
}
-(void)loadData{
    DLog(@"请求数据");
}

-(void)createUI{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH, SCREEN_HEIGHT-64-49)];
    [self.view addSubview:scrollView];
    if (IS_IPHONE_4_OR_LESS){
        scrollView.contentSize = CGSizeMake(320, 568);
    }
    
    _titleLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:10 andWidth:300 andHeight:40]];
    _titleLbl.text = @"人才培养的模式改革";
    _titleLbl.font = [UIFont systemFontOfSize:15];
    _titleLbl.textAlignment = NSTextAlignmentCenter;
    _titleLbl.numberOfLines=0;
    _titleLbl.textColor = [UIColor colorWithRed:100.0/255 green:100.0/255 blue:100.0/255 alpha:1];
    [scrollView addSubview:_titleLbl];
    
    _personLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:50 andWidth:150 andHeight:20]];
    _personLbl.text = @"发件人：王二小";
    _personLbl.textAlignment = NSTextAlignmentRight;
    _personLbl.textColor = [UIColor colorWithRed:164.0/255 green:164.0/255 blue:164.0/255 alpha:1];
    _personLbl.font = [UIFont systemFontOfSize:13];
    [scrollView addSubview:_personLbl];
    
    _timeLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:170 andY:50 andWidth:140 andHeight:20]];
    _timeLbl.text = @"2016-11-11";
    _timeLbl.textAlignment = NSTextAlignmentLeft;
    _timeLbl.textColor = [UIColor colorWithRed:164.0/255 green:164.0/255 blue:164.0/255 alpha:1];
    _timeLbl.font = [UIFont systemFontOfSize:13];
    [scrollView addSubview:_timeLbl];
    
    //新闻内容
    _detailLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:80 andWidth:300 andHeight:100]];
    _detailLbl.numberOfLines = 0;
    _detailLbl.font = [UIFont systemFontOfSize:13];
    _detailLbl.text = @"将进酒-李白    君不见黄河之水天上来，奔流到海不复回。君不见高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，杯莫停。与君歌一曲，请君为我倾耳听。钟鼓馔玉不足贵，但愿长醉不复醒。古来圣贤皆寂寞，惟有饮者留其名。陈王昔时宴平乐，斗酒十千恣欢谑。主人何为言少钱，径须沽取对君酌。五花马，千金裘，呼儿将出换美酒，与尔同销万古愁";
    //自适应label
    CGSize size = [_detailLbl.text sizeWithFont:_detailLbl.font constrainedToSize:CGSizeMake(_detailLbl.frame.size.width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    //根据计算结果重新设置UILabel的尺寸
    //    [_newsLabel setFrame:CGRectMake(20, 100, self.view.frame.size.width-40, size.height)];
    [_detailLbl setFrame:[self createFrameWithX:10 andY:80 andWidth:300 andHeight:size.height]];
    [scrollView addSubview:_detailLbl];

    _shetuanLbl = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, _detailLbl.frame.size.height+_detailLbl.frame.origin.y+10, SCREEN_WIDTH/2-10, 20)];
    _shetuanLbl.text = @"街舞社团";
    _shetuanLbl.textAlignment = NSTextAlignmentRight;
    _shetuanLbl.textColor = [UIColor colorWithRed:164.0/255 green:164.0/255 blue:164.0/255 alpha:1];
    _shetuanLbl.font = [UIFont systemFontOfSize:13];
    [scrollView addSubview:_shetuanLbl];
    
    UIButton *downFileBtn = [[UIButton alloc]initWithFrame:[self createFrameWithX:100 andY:_detailLbl.frame.origin.y+_detailLbl.frame.size.height+40 andWidth:120 andHeight:40]];
    [downFileBtn setBackgroundImage:[UIImage imageNamed:@"downloadfile"] forState:UIControlStateNormal];
    [downFileBtn addTarget:self action:@selector(downloadFiles:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:downFileBtn];
    //根据最后的空间来设置滑动的大小
    scrollView.contentSize = CGSizeMake(0, downFileBtn.frame.origin.y+downFileBtn.frame.size.height+100);
    
    
    
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT-49-45-64, SCREEN_WIDTH-40, 40)];
    backImage.image = [UIImage imageNamed:@"grayback"];
    [self.view addSubview:backImage];
    
    NSArray *imageName = @[@"collection",@"share",@"report"];
    for (int i = 0; i<3; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20+backImage.frame.size.width/11*(2+i*3),backImage.frame.origin.y+10, backImage.frame.size.width/12, 20)];
        [btn setBackgroundImage:[UIImage imageNamed:imageName[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(sharePress:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 100+i;
        [self.view addSubview:btn];
    }
    
    
}
-(void)downloadFiles:(UIButton *)sender{
    DLog(@"下载附件");
}
#pragma mark - 分享收藏按钮点击方法
-(void)sharePress:(UIButton *)sender{
    if (sender.tag == 100) {
         DLog(@"收藏");
    }else if (sender.tag == 101){
        DLog(@"分享");
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
