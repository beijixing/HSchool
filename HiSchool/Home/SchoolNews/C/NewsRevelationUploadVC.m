//
//  NewsRevelationUploadVC.m
//  HiSchool
//
//  Created by ybon on 16/3/14.
//  Copyright © 2016年 ybon. All rights reserved.
//
//校园爆料上传
#import "NewsRevelationUploadVC.h"

@interface NewsRevelationUploadVC ()

@end

@implementation NewsRevelationUploadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 200, 60)];
    label.backgroundColor = [UIColor blueColor];
    label.text = @"校园爆料上传";
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
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
