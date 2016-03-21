//
//  SchoolNewsBaseViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/7.
//  Copyright © 2016年 ybon. All rights reserved.
//
//校园新闻
#import "SchoolNewsBaseViewController.h"
#import "NewsRevelationViewController.h"    //新鲜事儿
#import "NewsHotspotsViewController.h"      //热点论战
#import "NewsNoticeViewController.h"        //社团公告
@interface SchoolNewsBaseViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
}
@end

@implementation SchoolNewsBaseViewController
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航栏时间标题视图
    [self configNavigationItemWithTitle:@"校园爆料"];
    //tabBar返回
    [self addHomeItemsBackEventNotification];
    [self clearNavigationItemLeftBarButton];
    
    [self createUI];
}
-(void)createUI{
    //初始化UISegmentedControl
//    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",nil];
//    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
//    [segmentedControl setTitle:@"新鲜事儿"forSegmentAtIndex:0];//设置指定索引的题目
//    [segmentedControl setTitle:@"热点论战"forSegmentAtIndex:1];
//    [segmentedControl setTitle:@"社团公告"forSegmentAtIndex:2];
//    segmentedControl.selectedSegmentIndex= 0;
//    [segmentedControl setTintColor:[UIColor blackColor]];
//    
//    [segmentedControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
//    segmentedControl.frame =CGRectMake(0,0,SCREEN_WIDTH,44);
//    [self.view addSubview:segmentedControl];
    
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 42, SCREEN_WIDTH/3, 2)];
    _scrollView.backgroundColor = [UIColor colorWithRed:0.27f green:0.53f blue:0.95f alpha:1.00f];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 0);
    [self.view addSubview:_scrollView];
    
    NSArray *titleArr = @[@"新鲜事儿",@"热点论战",@"社团公告"];
    for (int i =0; i<3; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20+((SCREEN_WIDTH-80)/3+20)*i, 5, (SCREEN_WIDTH-80)/3, 33)];
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:[UIColor colorWithRed:0.3922 green:0.3922 blue:0.3922 alpha:1.0] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        btn.layer.cornerRadius = 10.0;
        btn.tag = 100+i;
        if (i == 0) {
            btn.selected = YES;
            btn.backgroundColor = [UIColor colorWithRed:0.27f green:0.53f blue:0.95f alpha:1.00f];
                        
        }
        
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.view addSubview:btn];
    }
    
    
    
    
    
    
    
    NewsRevelationViewController *revelation = [[NewsRevelationViewController alloc]init];
    revelation.view.frame = CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-44-49);
    revelation.view.tag = 10;
    [self.view addSubview:revelation.view];
    [self addChildViewController:revelation];
    
    NewsHotspotsViewController *hotspots = [[NewsHotspotsViewController alloc]init];
    hotspots.view.frame = CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-44-49);
    hotspots.view.tag = 11;
    [self addChildViewController:hotspots];
    [self.view addSubview:hotspots.view];
        
    NewsNoticeViewController *notice = [[NewsNoticeViewController alloc]init];
    notice.view.frame = CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-44-49);
    notice.view.tag = 12;
    [self addChildViewController:notice];
    [self.view addSubview:notice.view];
    //将新鲜事儿放在最上面
    [self.view bringSubviewToFront:revelation.view];
    
}

-(void)btnClicked:(UIButton *)sender{
    
    for (int i = 0; i<3; i++) {
        UIButton *btn = [self.view viewWithTag:100+i];
        btn.selected = NO;
        btn.backgroundColor = [UIColor whiteColor];
    }
    
    if (sender.tag == 100) {
        sender.selected = YES;
        sender.backgroundColor = [UIColor colorWithRed:0.27f green:0.53f blue:0.95f alpha:1.00f];
        _scrollView.contentOffset = CGPointMake(0, 0);
        DLog(@"--------第一个%f",_scrollView.contentOffset.x);
        //将新鲜事儿放在最上面
        UIView *view = [self.view viewWithTag:10];
        [self.view bringSubviewToFront:view];
        
    }else if (sender.tag == 101){
        sender.selected = YES;
        sender.backgroundColor = [UIColor colorWithRed:0.27f green:0.53f blue:0.95f alpha:1.00f];
        _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH/3, 0);
        DLog(@"--------第二个%f",_scrollView.contentOffset.x);
        
        
        //将热点论战放在最上面
        UIView *view = [self.view viewWithTag:11];
        [self.view bringSubviewToFront:view];
    }else{
        sender.selected = YES;
        sender.backgroundColor = [UIColor colorWithRed:0.27f green:0.53f blue:0.95f alpha:1.00f];
        _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH/3*2, 0);
        DLog(@"--------第三个%f",_scrollView.contentOffset.x);
        //将社团公告放在最上面
        UIView *view = [self.view viewWithTag:12];
        [self.view bringSubviewToFront:view];
    }
}




-(void)valueChanged:(UISegmentedControl *)sc
{
    //获取当前选中的段
    NSInteger index = sc.selectedSegmentIndex;
    switch (index) {
        case 0:
        {   //将新鲜事儿放在最上面
            UIView *view = [self.view viewWithTag:10];
            [self.view bringSubviewToFront:view];
        }
            break;
        case 1:
        {   //将热点论战放在最上面
            UIView *view = [self.view viewWithTag:11];
            [self.view bringSubviewToFront:view];
        }
            break;
        case 2:
        {   //将社团公告放在最上面
            UIView *view = [self.view viewWithTag:12];
            [self.view bringSubviewToFront:view];
        }
            break;
        default:
            break;
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
