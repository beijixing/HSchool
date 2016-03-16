//
//  StudentHelpDetailViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/11.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "StudentHelpDetailViewController.h"

@interface StudentHelpDetailViewController ()

@end

@implementation StudentHelpDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航栏时间标题视图
    [self configNavigationItemTitleView];
    
    [self createUI];
    
}
-(void)createUI{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49)];
//    scrollView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:scrollView];
    if (IS_IPHONE_4_OR_LESS){
        scrollView.contentSize = CGSizeMake(320, 568);
    }
    
    NSArray *titleArr = @[@"标  题",@"报  酬",@"详  述"];
    for (int i = 0; i<3; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:10+50*(i%3) andWidth:50 andHeight:20]];
        label.text = titleArr[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.borderColor = [UIColor colorWithRed:1.0 green:0.6874 blue:0.2853 alpha:1.0].CGColor;
        label.layer.borderWidth = 1.0;
        label.layer.cornerRadius = 10.0;
        label.font = [UIFont systemFontOfSize:13];
        [scrollView addSubview:label];
    }
    
    UILabel *titleLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:70 andY:10 andWidth:240 andHeight:30]];
//    titleLbl.backgroundColor = [UIColor redColor];
    titleLbl.text = @"学校南门有卖篮球的吗？d东海岛会IDhi哦好滴哦好滴好滴哇和对外oh的我ID";
    titleLbl.numberOfLines = 0;
    titleLbl.font = [UIFont systemFontOfSize:15];
    [scrollView addSubview:titleLbl];
    
    UILabel *authorLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:70 andY:40 andWidth:60 andHeight:20]];
 //   authorLbl.backgroundColor = [UIColor greenColor];
    authorLbl.text= @"张三";
    authorLbl.textAlignment = NSTextAlignmentLeft;
    authorLbl.font = [UIFont systemFontOfSize:13];
    [scrollView addSubview:authorLbl];
    
    UILabel *universityLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:130 andY:40 andWidth:90 andHeight:20]];
//    universityLbl.backgroundColor = [UIColor yellowColor];
    universityLbl.text = @"齐鲁工业大学";
    universityLbl.textAlignment = NSTextAlignmentCenter;
    universityLbl.font = [UIFont systemFontOfSize:13];
    [scrollView addSubview:universityLbl];
    
    UILabel *timeLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:220 andY:40 andWidth:90 andHeight:20]];
//    timeLbl.backgroundColor = [UIColor purpleColor];
    timeLbl.text = @"2016.11.11 18:18";
    timeLbl.textAlignment = NSTextAlignmentRight;
    timeLbl.font = [UIFont systemFontOfSize:13];
    [scrollView addSubview:timeLbl];
    
    UILabel *rewardLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:70 andY:60 andWidth:240 andHeight:50]];
    rewardLbl.text = @"覅后ifhi饿哦发货静静地崛起的基督教结婚覅哦额威锋网if和违法和违法";
    rewardLbl.font = [UIFont systemFontOfSize:15];
    rewardLbl.numberOfLines = 0;
    [scrollView addSubview:rewardLbl];
    
    //这里要根据字数多少自动调整frame大小
    UILabel *detailLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:70 andY:110 andWidth:240 andHeight:50]];
    detailLbl.text = @"啥扶额昂贵封盖覅后发货  风家具费覅饿哦积分 急哦放假覅哦哈符合 及交付及覅及覅哦无防腐剂";
    detailLbl.numberOfLines = 0;
    detailLbl.font = [UIFont systemFontOfSize:15];
    [scrollView addSubview:detailLbl];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:[self createFrameWithX:40 andY:170 andWidth:240 andHeight:300]];
    imageView.image = [UIImage imageNamed:@"moren"];
    [scrollView addSubview:imageView];
    
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
