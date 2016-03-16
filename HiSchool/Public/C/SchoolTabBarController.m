//
//  SchloolTabBarController.m
//  HiSchool
//
//  Created by ybon on 16/3/7.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "SchoolTabBarController.h"
#import "HomeVC.h"
#import "MineMessageVC.h"
#import "RightVC.h"
#import "UIViewController+MMDrawerController.h"
#import "CustomTabBar.h"
#import "NavigationBarTitleView.h"

@interface SchoolTabBarController ()<CustomTabBarDelegate>

@end

@implementation SchoolTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewControllers];

    [self setupCustomTabBar];
}

- (void)setupViewControllers {
        HomeVC *homeVc = [[HomeVC alloc] init];
        self.homeNav = [[UINavigationController alloc] initWithRootViewController:homeVc];

        MineMessageVC *mineMessageVc = [[MineMessageVC alloc] init];
        self.mineMessageNav = [[UINavigationController alloc] initWithRootViewController:mineMessageVc];
    
        self.viewControllers = @[self.homeNav, self.mineMessageNav];
}

- (void)setupCustomTabBar {
    CGRect tabBarFrame = self.tabBar.bounds;
    CustomTabBar *tabBarView = [[CustomTabBar alloc] initWithFrame:tabBarFrame];
    tabBarView.delegate = self;
    [self.tabBar addSubview:tabBarView];
    
    
    [tabBarView addButtonWithImage:[UIImage imageNamed:@"back"] selectedImage:[UIImage imageNamed:@"back"]];
    
    //为控制器添加按钮
    for (int i=0; i<self.viewControllers.count; i++) { //根据有多少个子视图控制器来进行添加按钮
        
        NSString *imageName = [NSString stringWithFormat:@"tabBar%d", i+1];
        NSString *imageNameSel = [NSString stringWithFormat:@"tabBar%d_active", i + 1];
        
        UIImage *image = [UIImage imageNamed:imageName];
        UIImage *imageSel = [UIImage imageNamed:imageNameSel];
        
        [tabBarView addButtonWithImage:image selectedImage:imageSel];
    }
    
     [tabBarView addButtonWithImage:[UIImage imageNamed:@"tabBar3"] selectedImage:[UIImage imageNamed:@"tabBar3_active"]];
    self.selectedIndex = 0;
    [tabBarView setSelectedBarButtonWithIdx:1];
}

- (void)tabBar:(CustomTabBar *)tabBar selectedFrom:(NSInteger)from to:(NSInteger)to {
    NSLog(@"self.selectedIndex = %ld",  to);
    switch (to) {
        case 0:
            if (self.selectedIndex == 0) {
                BaseViewController *baseVc = (BaseViewController *) self.homeNav.topViewController;
                if (baseVc.isRightViewController){
                    [[NSNotificationCenter defaultCenter] postNotificationName:kRightVCItemNotification object:nil];
                }else {
                    [[NSNotificationCenter defaultCenter] postNotificationName:kHomeVCItemsNotification object:nil];
                }
            }else if(self.selectedIndex == 1) {
                [[NSNotificationCenter defaultCenter] postNotificationName:kMessageItemVCNotification object:nil];
            }
            break;
        case 1:
            self.selectedIndex = to-1;
            break;
        case 2:
            self.selectedIndex = to-1;
            break;
        case 3:
            {
                [self.mm_drawerController openDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
                }];
            }
            break;
        case 4:
            break;
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
