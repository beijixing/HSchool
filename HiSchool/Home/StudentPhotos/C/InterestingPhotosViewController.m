//
//  InterestingPhotosViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/10.
//  Copyright © 2016年 ybon. All rights reserved.
//
//趣味杂图
#import "InterestingPhotosViewController.h"

@interface InterestingPhotosViewController ()

@end

@implementation InterestingPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.96f alpha:1.00f];
    
    
    [self createUI];
}
-(void)createUI{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:scrollView];
    if (IS_IPHONE_4_OR_LESS){
        scrollView.contentSize = CGSizeMake(320, 568);
    }
    
    
    UILabel *titleLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:0 andWidth:300 andHeight:40]];
    titleLbl.text = @"标题：XXXXXXXXXX";
    titleLbl.font = [UIFont systemFontOfSize:15];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.numberOfLines=0;
    titleLbl.textColor = [UIColor colorWithRed:100.0/255 green:100.0/255 blue:100.0/255 alpha:1];
    [scrollView addSubview:titleLbl];
    
    UILabel *personLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:40 andWidth:90 andHeight:20]];
    personLbl.text = @"用户名";
    personLbl.textColor = [UIColor colorWithRed:164.0/255 green:164.0/255 blue:164.0/255 alpha:1];
    personLbl.font = [UIFont systemFontOfSize:13];
    personLbl.textAlignment = NSTextAlignmentRight;
    [scrollView addSubview:personLbl];
    
    UILabel *universityLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:110 andY:40 andWidth:100 andHeight:20]];
    universityLbl.text = @"东西南北中发白大学";
    universityLbl.textColor = [UIColor colorWithRed:164.0/255 green:164.0/255 blue:164.0/255 alpha:1];
    universityLbl.font = [UIFont systemFontOfSize:13];
    universityLbl.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:universityLbl];
    
    UILabel *timeLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:220 andY:40 andWidth:100 andHeight:20]];
    timeLbl.text = @"2016.11.11";
    timeLbl.textColor = [UIColor colorWithRed:164.0/255 green:164.0/255 blue:164.0/255 alpha:1];
    timeLbl.font = [UIFont systemFontOfSize:13];
    timeLbl.textAlignment = NSTextAlignmentLeft;
    [scrollView addSubview:timeLbl];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:[self createFrameWithX:30 andY:70 andWidth:260 andHeight:300]];
    imageView.image = [UIImage imageNamed:@"moren"];
    [scrollView addSubview:imageView];
    
    UITextView *textView = [[UITextView alloc]initWithFrame:[self createFrameWithX:10 andY:380 andWidth:300 andHeight:60]];
    textView.layer.borderColor = [UIColor blueColor].CGColor;
    textView.layer.borderWidth = 1.0;
    [scrollView addSubview:textView];
    
    
    
    
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
