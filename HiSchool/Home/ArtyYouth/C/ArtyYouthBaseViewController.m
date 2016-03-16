//
//  ArtyYouthBaseViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/11.
//  Copyright © 2016年 ybon. All rights reserved.
//
//文艺青年
#import "ArtyYouthBaseViewController.h"
#import "OriginalJokeViewController.h"      //原创笑话
#import "CampusLiteratureViewController.h"  //校园文学
@interface ArtyYouthBaseViewController ()

@end

@implementation ArtyYouthBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //tabBar返回
    [self addHomeItemsBackEventNotification];
    [self clearNavigationItemLeftBarButton];
    
    [self createUI];
    
    
}
-(void)createUI{
    //初始化UISegmentedControl
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"1",@"2",nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    [segmentedControl setTitle:@"原创笑话"forSegmentAtIndex:0];//设置指定索引的题目
    [segmentedControl setTitle:@"校园文学"forSegmentAtIndex:1];

    segmentedControl.selectedSegmentIndex= 0;
    [segmentedControl setTintColor:[UIColor blackColor]];
    
    [segmentedControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.frame =CGRectMake(0,20,SCREEN_WIDTH,44);
    [self.view addSubview:segmentedControl];
    
    OriginalJokeViewController *joke = [[OriginalJokeViewController alloc]init];
    joke.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    joke.view.tag = 10;
    [self.view addSubview:joke.view];
    [self addChildViewController:joke];
        
    CampusLiteratureViewController *campus = [[CampusLiteratureViewController alloc]init];
    campus.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    campus.view.tag = 11;
    [self addChildViewController:campus];
    [self.view addSubview:campus.view];
    
    //将原创笑话放在最上面
    [self.view bringSubviewToFront:joke.view];
    
}
-(void)valueChanged:(UISegmentedControl *)sc
{
    //获取当前选中的段
    NSInteger index = sc.selectedSegmentIndex;
    switch (index) {
        case 0:
        {   //将原创笑话放在最上面
            UIView *view = [self.view viewWithTag:10];
            [self.view bringSubviewToFront:view];
        }
            break;
        case 1:
        {   //将校园文学放在最上面
            UIView *view = [self.view viewWithTag:11];
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
