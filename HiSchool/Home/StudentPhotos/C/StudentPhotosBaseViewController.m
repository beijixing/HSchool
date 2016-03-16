//
//  StudentPhotosBaseViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/10.
//  Copyright © 2016年 ybon. All rights reserved.
//
//学生美图
#import "StudentPhotosBaseViewController.h"
#import "SchoolBabeViewController.h"    //校花选举
#import "SchoolHunkViewController.h"    //校草选举
#import "StudentPhotographyViewController.h"    //学生摄影
#import "InterestingPhotosViewController.h"     //趣味杂图
@interface StudentPhotosBaseViewController ()

@end

@implementation StudentPhotosBaseViewController
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
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
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    [segmentedControl setTitle:@"校花选举"forSegmentAtIndex:0];//设置指定索引的题目
    [segmentedControl setTitle:@"校草选举"forSegmentAtIndex:1];
    [segmentedControl setTitle:@"学生摄影"forSegmentAtIndex:2];
    [segmentedControl setTitle:@"趣味杂图"forSegmentAtIndex:3];
    segmentedControl.selectedSegmentIndex= 0;
    [segmentedControl setTintColor:[UIColor blackColor]];
    
    [segmentedControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.frame =CGRectMake(0,20,SCREEN_WIDTH,44);
    [self.view addSubview:segmentedControl];
    
    SchoolBabeViewController *babe = [[SchoolBabeViewController alloc]init];
    babe.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    babe.view.tag = 10;
    [self.view addSubview:babe.view];
    [self addChildViewController:babe];
    
    SchoolHunkViewController *hunk = [[SchoolHunkViewController alloc]init];
    hunk.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    hunk.view.tag = 11;
    [self addChildViewController:hunk];
    [self.view addSubview:hunk.view];
    
    StudentPhotographyViewController *photo = [[StudentPhotographyViewController alloc]init];
    photo.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    photo.view.tag = 12;
    [self addChildViewController:photo];
    [self.view addSubview:photo.view];
    
    InterestingPhotosViewController *interesting = [[InterestingPhotosViewController alloc]init];
    interesting.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    interesting.view.tag = 13;
    [self addChildViewController:interesting];
    [self.view addSubview:interesting.view];
    
    //将校花选举放在最上面
    [self.view bringSubviewToFront:babe.view];
    
}
-(void)valueChanged:(UISegmentedControl *)sc
{
    //获取当前选中的段
    NSInteger index = sc.selectedSegmentIndex;
    switch (index) {
        case 0:
        {   //将校花选举放在最上面
            UIView *view = [self.view viewWithTag:10];
            [self.view bringSubviewToFront:view];
        }
            break;
        case 1:
        {   //将校草选举放在最上面
            UIView *view = [self.view viewWithTag:11];
            [self.view bringSubviewToFront:view];
        }
            break;
        case 2:
        {   //将学生摄影放在最上面
            UIView *view = [self.view viewWithTag:12];
            [self.view bringSubviewToFront:view];
        }
            break;
        case 3:
        {   //将趣味杂图放在最上面
            UIView *view = [self.view viewWithTag:13];
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
