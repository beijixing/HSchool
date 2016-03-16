//
//  OriginalVideoBaseViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/9.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "OriginalVideoBaseViewController.h"
#import "VideoMicroViewController.h"    //同学微剧
#import "VideoMVViewController.h"       //校园MV
#import "VideoVarietyViewController.h"  //校内综艺
#import "VideoTakePhotosViewController.h"   //同学闲拍

@interface OriginalVideoBaseViewController ()

@end

@implementation OriginalVideoBaseViewController
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    


    
    
    [self createUI];
}
-(void)createUI{
    //初始化UISegmentedControl
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    [segmentedControl setTitle:@"学生微剧"forSegmentAtIndex:0];//设置指定索引的题目
    [segmentedControl setTitle:@"校园MV"forSegmentAtIndex:1];
    [segmentedControl setTitle:@"校内综艺"forSegmentAtIndex:2];
    [segmentedControl setTitle:@"同学闲拍"forSegmentAtIndex:3];
    segmentedControl.selectedSegmentIndex= 0;
    [segmentedControl setTintColor:[UIColor blackColor]];
    
    [segmentedControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.frame =CGRectMake(0,20,SCREEN_WIDTH,44);
    [self.view addSubview:segmentedControl];
    
    VideoMicroViewController *micro = [[VideoMicroViewController alloc]init];
    micro.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    micro.view.tag = 10;
    [self.view addSubview:micro.view];
    [self addChildViewController:micro];
    
    VideoMVViewController *MV = [[VideoMVViewController alloc]init];
    MV.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    MV.view.tag = 11;
    [self addChildViewController:MV];
    [self.view addSubview:MV.view];
    
    VideoVarietyViewController *variety = [[VideoVarietyViewController alloc]init];
    variety.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    variety.view.tag = 12;
    [self addChildViewController:variety];
    [self.view addSubview:variety.view];
    
    VideoTakePhotosViewController *takePhotos = [[VideoTakePhotosViewController alloc]init];
    takePhotos.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    takePhotos.view.tag = 13;
    [self addChildViewController:takePhotos];
    [self.view addSubview:takePhotos.view];
    
    //将学生微剧放在最上面
    [self.view bringSubviewToFront:micro.view];
}

-(void)valueChanged:(UISegmentedControl *)sc
{
    //获取当前选中的段
    NSInteger index = sc.selectedSegmentIndex;
    switch (index) {
        case 0:
        {   //将学生微剧放在最上面
            UIView *view = [self.view viewWithTag:10];
            [self.view bringSubviewToFront:view];
        }
            break;
        case 1:
        {   //将校园MV放在最上面
            UIView *view = [self.view viewWithTag:11];
            [self.view bringSubviewToFront:view];
        }
            break;
        case 2:
        {   //将校内综艺放在最上面
            UIView *view = [self.view viewWithTag:12];
            [self.view bringSubviewToFront:view];
        }
            break;
        case 3:
        {   //将同学闲拍放在最上面
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
