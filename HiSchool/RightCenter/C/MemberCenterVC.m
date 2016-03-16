//
//  MemberCenterVC.m
//  HiSchool
//
//  Created by ybon on 16/3/11.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "MemberCenterVC.h"

@interface MemberCenterVC ()

@end

@implementation MemberCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self clearNavigationItemLeftBarButton];
    [self configNavigationItemTitleView];
    
    [self addRightItemsBackEventNotification];
    self.isRightViewController = YES;

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
