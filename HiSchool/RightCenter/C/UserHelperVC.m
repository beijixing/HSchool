//
//  UerHelperVC.m
//  HiSchool
//
//  Created by ybon on 16/3/12.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "UserHelperVC.h"

@interface UserHelperVC ()
{
    UITextView *_helperTextView;
}
@end

@implementation UserHelperVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigationItemWithTitle:@"使用帮助"];
    [self clearNavigationItemLeftBarButton];
    
    [self addRightItemsBackEventNotification];
    self.isRightViewController = YES;
    
    [self configHelperTextView];
}

- (void)configHelperTextView {
    _helperTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 -49)];
    
    [self.view addSubview:_helperTextView];
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
