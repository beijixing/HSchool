//
//  BaseIViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/7.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "BaseViewController.h"
#import "NavigationBarTitleView.h"

@interface BaseViewController ()
{
    float _scaleY;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBarBg"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBarHidden = NO;
    self.scaleRatio = SCREEN_WIDTH / 320;           //固定屏幕基于5S适配
    _scaleY = SCREEN_HEIGHT / 480;
    self.isRightViewController = false;
    [self.navigationItem setHidesBackButton:YES];
}

-(CGRect)createFrameWithX:(CGFloat)x andY:(CGFloat)y andWidth:(CGFloat)width andHeight:(CGFloat)height
{
    return CGRectMake(x * self.scaleRatio, y * self.scaleRatio, width * self.scaleRatio, height * self.scaleRatio);
}

- (void)configNavigationItemTitleView {
    NavigationBarTitleView *titleView = [[NavigationBarTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    titleView.titleImage.image = [UIImage imageNamed:@"hiSchlool"];
    titleView.titleLB.hidden = YES;
    self.navigationItem.titleView = titleView;
}

- (void)configNavigationItemWithTitle:(NSString *)title {
    NavigationBarTitleView *titleView = [[NavigationBarTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    titleView.titleLB.text = title;
    titleView.titleImage.hidden = YES;
    self.navigationItem.titleView = titleView;
}


- (void)addHomeItemsBackEventNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedHomeItemsNotification:) name:kHomeVCItemsNotification object:nil];
}

- (void)addRightItemsBackEventNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedRightItemsNotification:) name:kRightVCItemNotification object:nil];
}

- (void)addMessageItemEventNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedMessageItemsNotification:) name:kMessageItemVCNotification object:nil];
}

- (void)receivedHomeItemsNotification:(NSNotification *)noti {
    [self.navigationController popViewControllerAnimated:YES];
    if ( [self.navigationController.visibleViewController isKindOfClass:NSClassFromString(@"HomeVC")] ) {
        NSLog(@"**********************HomeVC_____________");
        [[NSNotificationCenter defaultCenter] postNotificationName:kResetRightVCLastViewControllerNotification object:nil];
    }
}

- (void)receivedRightItemsNotification:(NSNotification *)noti {
    [self.navigationController popViewControllerAnimated:YES];
    if ( [self.navigationController.visibleViewController isKindOfClass:NSClassFromString(@"HomeVC")] ) {
        NSLog(@"**********************HomeVC_____________");
        [[NSNotificationCenter defaultCenter] postNotificationName:kResetRightVCLastViewControllerNotification object:nil];
    }
}

- (void)receivedMessageItemsNotification:(NSNotification *)notification {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)clearNavigationItemLeftBarButton {
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)]];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.navigationItem setHidesBackButton:YES];
}
@end
