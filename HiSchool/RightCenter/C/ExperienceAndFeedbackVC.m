//
//  ExperienceAndFeedbackVC.m
//  HiSchool
//
//  Created by ybon on 16/3/12.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "ExperienceAndFeedbackVC.h"
#import "FeedBackCell.h"
#import "AddNewFeedBackVC.h"
@interface ExperienceAndFeedbackVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ExperienceAndFeedbackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    self.feedBackReportTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.feedBackReportTable registerNib:[UINib nibWithNibName:@"FeedBackCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"FeedBackCell"];
    [self addRightItemsBackEventNotification];
    self.isRightViewController = YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeedBackCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedBackCell"];
    return cell;
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44*self.scaleRatio;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)searchButtonClick:(UIButton *)sender {
}

- (IBAction)addFeedBackButtonClick:(UIButton *)sender {
    AddNewFeedBackVC *addNewFeedBackVc = [[AddNewFeedBackVC alloc] init];
    [self.navigationController pushViewController:addNewFeedBackVc animated:YES];
}
@end
