//
//  DormitoryFriendshipUploadVC.m
//  HiSchool
//
//  Created by ybon on 16/3/15.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "DormitoryFriendshipUploadVC.h"

@interface DormitoryFriendshipUploadVC ()

@end

@implementation DormitoryFriendshipUploadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航栏时间标题视图
    [self configNavigationItemTitleView];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 200, 60)];
    label.backgroundColor = [UIColor blueColor];
    label.text = @"宿舍联谊上传";
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
