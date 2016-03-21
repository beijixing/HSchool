//
//  TravelTogetherVC.m
//  HiSchool
//
//  Created by ybon on 16/3/12.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "TravelTogetherVC.h"
#import "TravelCell.h"
#import "TravelDetailVC.h"
#import "AddTravelVC.h"
#import "CirculateView.h"
@interface TravelTogetherVC ()<UITableViewDataSource, UITableViewDelegate>
{
    CirculateView *_circulateView;
}
@end

@implementation TravelTogetherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigationItemWithTitle:@"一路同行"];
    [self addHomeItemsBackEventNotification];
    [self clearNavigationItemLeftBarButton];
    
    [self.travelTable registerNib:[UINib nibWithNibName:@"TravelCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TravelCell"];
    self.headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH - 16, 200*self.scaleRatio);
    self.travelTable.tableHeaderView = self.headerView;
    
    _circulateView = [[CirculateView alloc] initWithFrame:self.adView.bounds];
    _circulateView.layer.cornerRadius = 10;
    [self.adView addSubview:_circulateView];
    NSArray *arr = @[@"a",@"b", @"c", @"d"];
    [_circulateView addScrollImages:arr];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TravelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TravelCell"];
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60*self.scaleRatio;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TravelDetailVC *travelDetailVc = [[TravelDetailVC alloc] init];
    [self.navigationController pushViewController:travelDetailVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)searchButtonClick:(UIButton *)sender {
}

- (IBAction)addTravelButtonClick:(UIButton *)sender {
    AddTravelVC *addTravelVc = [[AddTravelVC alloc] init];
    [self.navigationController pushViewController:addTravelVc animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [_circulateView stopScroll];
}

- (void)viewWillAppear:(BOOL)animated {
    [_circulateView startScroll];
}
@end
