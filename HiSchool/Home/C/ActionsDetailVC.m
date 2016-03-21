//
//  ActionsDetailVC.m
//  HiSchool
//
//  Created by ybon on 16/3/15.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "ActionsDetailVC.h"
#import "CirculateView.h"

@interface ActionsDetailVC ()
{
    CirculateView *_adView;
}
@end

@implementation ActionsDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configNavigationItemWithTitle:@"活动"];
    [self clearNavigationItemLeftBarButton];
    [self addHomeItemsBackEventNotification];
    [self setupAdView];
}

- (void)setupAdView {
    _adView = [[CirculateView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150*self.scaleRatio)];
    NSArray *arr = @[];
    [_adView addScrollImages:arr];
    [self.view addSubview:_adView];
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
