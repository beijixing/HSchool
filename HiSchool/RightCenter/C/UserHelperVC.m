//
//  UerHelperVC.m
//  HiSchool
//
//  Created by ybon on 16/3/12.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "UserHelperVC.h"

@interface UserHelperVC ()

@end

@implementation UserHelperVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigationItemTitleView];
    [self clearNavigationItemLeftBarButton];
    
    [self addRightItemsBackEventNotification];
    self.isRightViewController = YES;
    self.view.backgroundColor = [UIColor redColor];
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
