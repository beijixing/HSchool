//
//  HomeVC.m
//  HiSchool
//
//  Created by ybon on 16/3/7.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "HomeVC.h"
#import "Masonry.h"
#import "CircleButton.h"
#import "HomeNewsCell.h"
#import "CirculateView.h"

#import "SchoolNewsBaseViewController.h"    //  校园新闻
#import "OriginalVideoBaseViewController.h"     //原创视频
#import "DormitoryFriendshipBaseViewController.h"   //宿舍联谊
#import "StudentPhotosBaseViewController.h"     //学生美图
#import "ArtyYouthBaseViewController.h"         //文艺青年
#import "StudentHelpBaseViewController.h"       //同学互助
#import "TravelTogetherVC.h"
#import "BeforeSleepVC.h"
#import "MJRefresh.h"
#import "ActionsDetailVC.h"

@interface HomeVC ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_newsTableView;
    NSMutableArray *_newsDataArr;
    CirculateView *_adView;
    UIView *_headerView;
    UILabel *_loadMoreLabel;
}
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 310*self.scaleRatio)];
    
    [self configNavigationItemTitleView];
    [self configAdView];
    [self configTopics];
    [self createNewsTableview];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    [_adView startScroll];
}

- (void)viewWillDisappear:(BOOL)animated {
    [_adView stopScroll];
}

- (void)configAdView {
    _adView = [[CirculateView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150*self.scaleRatio)];
    [_headerView addSubview:_adView];
    NSArray *arr = @[];
    [_adView addScrollImages:arr];
}

- (void)configTopics{
    NSArray *titleArr = [NSArray arrayWithObjects:@"爆料校园",@"视频原创", @"宿舍联谊", @"美图学院", @"文娱天地", @"同学互助", @"一路同行", @"熄灯时刻", nil];
    CGFloat buttonSpace = 42/5;
    CGFloat buttonWidth = (SCREEN_WIDTH-42)/4;
    for (int i = 0; i<8; i++) {
        CircleButton *circleButton = [[CircleButton alloc] initWithFrame:CGRectMake(i%4*(buttonWidth+buttonSpace)+buttonSpace, (i/4)*(buttonSpace+buttonWidth) + 165*self.scaleRatio, buttonWidth, buttonWidth)];
        [circleButton addButtonImage:[UIImage imageNamed:[NSString stringWithFormat:@"im_%d", i +1]] andSelectedImage:[UIImage imageNamed:[NSString stringWithFormat:@"im_%d", i +1]]];
        [circleButton setupTitileLabelFont:[UIFont fontWithName:@"Arial" size:13] textColor:[UIColor grayColor] text:titleArr[i]];
        circleButton.tag = i;
        
        circleButton.btnClickBlock = ^(NSInteger tag, NSString *btnTitle){
            [self circleButtonEvent:tag];
        };
        
        [_headerView addSubview:circleButton];
    }
}

- (void)circleButtonEvent:(NSInteger)btnIndex {
    DLog(@"btnIndex= %ld", btnIndex);
    
    switch (btnIndex) {
        case 0:
        {
            SchoolNewsBaseViewController *schoolNews = [[SchoolNewsBaseViewController alloc]init];
            [self.navigationController pushViewController:schoolNews animated:YES];
        }
            break;
        case 1:
        {
            OriginalVideoBaseViewController *originalVideo = [[OriginalVideoBaseViewController alloc]init];
            [self.navigationController pushViewController:originalVideo animated:YES];
        }
            break;
        case 2:
        {
            DormitoryFriendshipBaseViewController *friendShip = [[DormitoryFriendshipBaseViewController alloc]init];
            [self.navigationController pushViewController:friendShip animated:YES];
        }
            break;
        case 3:
        {
            StudentPhotosBaseViewController *photos = [[StudentPhotosBaseViewController alloc]init];
            [self.navigationController pushViewController:photos animated:YES];
        }
            break;
        case 4:
        {
            ArtyYouthBaseViewController *youth = [[ArtyYouthBaseViewController alloc]init];
            [self.navigationController pushViewController:youth animated:YES];
        }
            break;
        case 5:
        {
            StudentHelpBaseViewController *help = [[StudentHelpBaseViewController alloc]init];
            [self.navigationController pushViewController:help animated:YES];
        }
            break;
        
        case 6:
        {
            TravelTogetherVC *travelTogetherVc = [[TravelTogetherVC alloc] init];
            [self.navigationController pushViewController:travelTogetherVc animated:YES];
        }
            break;
        case 7:
        {
            BeforeSleepVC *beforeSleepVc = [[BeforeSleepVC alloc] init];
            [self.navigationController pushViewController:beforeSleepVc animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)createNewsTableview {
    _newsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
    _newsTableView.dataSource = self;
    _newsTableView.delegate = self;
    _newsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_newsTableView registerNib:[UINib nibWithNibName:@"HomeNewsCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"NewsCell"];
    _newsTableView.tableHeaderView = _headerView;
    [self.view addSubview:_newsTableView];

    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [_newsTableView.footer endRefreshing];
    }];
    
    [footer setTitle:@"更过活动" forState:MJRefreshStateIdle];
    
    [footer setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"没有更多数据" forState:MJRefreshStateNoMoreData];
    footer.stateLabel.font = [UIFont systemFontOfSize:17];
    // 设置颜色
    footer.stateLabel.textColor = [UIColor orangeColor];
    _newsTableView.footer = footer;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    return _headerView;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 310*self.scaleRatio;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell"];
    if (indexPath.row == 2) {
        UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(8, cell.frame.size.height-2, SCREEN_WIDTH-16, 1)];
        line.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:line];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ActionsDetailVC *actionVc = [[ActionsDetailVC alloc] init];
    [self.navigationController pushViewController:actionVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
