//
//  ChangeCodeVC.m
//  HiSchool
//
//  Created by ybon on 16/3/16.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "ChangeCodeVC.h"

@interface ChangeCodeVC ()

@end

@implementation ChangeCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configNavigationItemWithTitle:@"密码修改"];
    [self clearNavigationItemLeftBarButton];
    [self addHomeItemsBackEventNotification];
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
