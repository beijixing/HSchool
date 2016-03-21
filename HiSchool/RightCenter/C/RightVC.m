//
//  RootViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/4.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "RightVC.h"
#import "RightViewCell.h"
#import "LoginAndRegisterVC.h"
#import "UIViewController+MMDrawerController.h"
#import "SchoolTabBarController.h"
#import "MemberCenterVC.h"
#import "PublishAndCollectionVC.h"
#import "ExperienceAndFeedbackVC.h"
#import "MineDormVC.h"
#import "UserHelperVC.h"
#import "ChangeCodeVC.h"

@interface RightVC ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_topicsDdataSource;
    UITableView *_topicsTable;
    UIImageView *_headIcon;
    CGFloat _rowHeight;
    UIViewController *_lastViewController;
    UILabel *_userNameLB;
}
@end

@implementation RightVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = ColorWithRGB(73, 139, 239);
    _topicsDdataSource = [[NSMutableArray alloc] init];
    [_topicsDdataSource addObject:@"使用帮助"];
    [_topicsDdataSource addObject:@"用户体验与反馈"];
    [_topicsDdataSource addObject:@"我的宿舍"];
    [_topicsDdataSource addObject:@"我的收藏与发布"];
    [_topicsDdataSource addObject:@"个人中心设置"];
    [_topicsDdataSource addObject:@"密码修改"];
    [_topicsDdataSource addObject:@"清除缓存"];
    [_topicsDdataSource addObject:@"登录/注册"];
    [_topicsDdataSource addObject:@"退出登录"];
    
    [_topicsDdataSource addObject:@"center_help"];
    [_topicsDdataSource addObject:@"center_feedBack"];
    [_topicsDdataSource addObject:@"center_mydorm"];
    [_topicsDdataSource addObject:@"center_collection"];
    [_topicsDdataSource addObject:@"center_settings"];
    [_topicsDdataSource addObject:@"center_changeCode"];
    [_topicsDdataSource addObject:@"center_clearChache"];
    [_topicsDdataSource addObject:@"center_loginAndReg"];
    [_topicsDdataSource addObject:@"center_signout"];
    
    
    [self createUI];
    [self addResetLastViewControllerNotification];
}

- (void)viewWillAppear:(BOOL)animated {
}

- (void)addResetLastViewControllerNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveResetLastViewControllerNotification:) name:kResetRightVCLastViewControllerNotification object:nil];
}

- (void)receiveResetLastViewControllerNotification:(NSNotification *)notification {
    _lastViewController = nil;
}

-(void)createUI{
    CGFloat tableViewWidth = SCREEN_WIDTH * 2/3;
    _rowHeight = (SCREEN_HEIGHT - tableViewWidth)/(_topicsDdataSource.count/2);
    
    UIImageView *titleBg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, tableViewWidth, tableViewWidth*2/3)];
    titleBg.image = [UIImage imageNamed:@"rightHeadBg"];
    [self.view addSubview:titleBg];
    
    UIImageView *headBg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60*self.scaleRatio, 60*self.scaleRatio)];
    headBg.center = CGPointMake(tableViewWidth/5, tableViewWidth*3/5/2);
    headBg.image = [UIImage imageNamed:@"headBg"];
    [self.view addSubview:headBg];
    
    _userNameLB = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80*self.scaleRatio, 30)];
    _userNameLB.textColor = [UIColor whiteColor];
    _userNameLB.textAlignment = NSTextAlignmentCenter;
    _userNameLB.center = CGPointMake(tableViewWidth/2, tableViewWidth*3/5/2);
    _userNameLB.text = @"张富贵";
    [self.view addSubview:_userNameLB];
    
    UIImageView *sexImage = [[UIImageView alloc] initWithFrame:CGRectMake(tableViewWidth/2+50 ,  tableViewWidth*3/5/2 - 30 ,20*self.scaleRatio, 20*self.scaleRatio)];
    sexImage.image = [UIImage imageNamed:@"nv"];
    [self.view addSubview:sexImage];
    
    
    _headIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50*self.scaleRatio, 50*self.scaleRatio)];
    _headIcon.center = CGPointMake(tableViewWidth/5, tableViewWidth*3/5/2);
    _headIcon.layer.cornerRadius = 25*self.scaleRatio;
//    _headIcon.backgroundColor = [UIColor redColor];
    _headIcon.image = [UIImage imageNamed:@"defaultHeadBg"];
    
    
    _topicsTable = [[UITableView alloc] initWithFrame:CGRectMake(0, tableViewWidth*2/3, tableViewWidth, SCREEN_HEIGHT-tableViewWidth) style:UITableViewStylePlain];
    _topicsTable.dataSource = self;
    _topicsTable.delegate = self;
    _topicsTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _topicsTable.backgroundColor = [UIColor clearColor];
    _topicsTable.scrollEnabled = NO;
    [_topicsTable registerNib:[UINib nibWithNibName:@"RightViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"RightViewCell"];
    
    [self.view addSubview:_headIcon];
    [self.view addSubview:_topicsTable];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _topicsDdataSource.count/2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RightViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RightViewCell"];
    cell.titleLabel.text = _topicsDdataSource[indexPath.row];
    cell.titleImage.image = [UIImage imageNamed:_topicsDdataSource[indexPath.row+9]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _rowHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SchoolTabBarController *tabBarController = (SchoolTabBarController *)self.mm_drawerController.centerViewController;
    tabBarController.selectedIndex = 0;
    UINavigationController *homeNav = tabBarController.homeNav;
    if (indexPath.row == 5) {//登录注册

    }
    
    switch (indexPath.row) {
        case 0:{//使用帮助
            if ([_lastViewController isKindOfClass:[UserHelperVC class]]) {
                [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
                }];
                return;
            }else if (_lastViewController){
                [_lastViewController removeFromParentViewController];
                _lastViewController = nil;
            }
            UserHelperVC *userHelperVC = [[UserHelperVC alloc] init];
            _lastViewController = userHelperVC;
            [homeNav pushViewController:userHelperVC animated:NO];
            [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
            }];
        }
            break;
        case 1:{//用户体验与反馈
            if ([_lastViewController isKindOfClass:[ExperienceAndFeedbackVC class]]) {
                [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
                }];
                return;
            }else if (_lastViewController){
                [_lastViewController removeFromParentViewController];
                _lastViewController = nil;
            }
            ExperienceAndFeedbackVC *expAndFeedBackVc = [[ExperienceAndFeedbackVC alloc] init];
            _lastViewController = expAndFeedBackVc;

            [homeNav pushViewController:expAndFeedBackVc animated:NO];
            [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
            }];
        }
            
            break;
        case 2:{//我的宿舍
            if ([_lastViewController isKindOfClass:[MineDormVC class]]) {
                [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
                }];
                return;
            }else if (_lastViewController){
                [_lastViewController removeFromParentViewController];
                _lastViewController = nil;
            }
            
            MineDormVC *mineDormVc = [[MineDormVC alloc] init];
            _lastViewController = mineDormVc;

            [homeNav pushViewController:mineDormVc animated:NO];
            [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
            }];
        }
            break;
        case 3:{//我的收藏与发布
            if ([_lastViewController isKindOfClass:[PublishAndCollectionVC class]]) {
                [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
                }];
                return;
            }else if (_lastViewController){
                [_lastViewController removeFromParentViewController];
                _lastViewController = nil;
            }
            
            PublishAndCollectionVC *pubAndCollVc = [[PublishAndCollectionVC alloc] init];
             _lastViewController = pubAndCollVc;
            [homeNav pushViewController:pubAndCollVc animated:NO];
            [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
            }];
        }
            
            break;
        case 4:{//个人中心设置
            if ([_lastViewController isKindOfClass:[MemberCenterVC class]]) {
                [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
                }];
                return;
            }else if (_lastViewController){
                [_lastViewController removeFromParentViewController];
                _lastViewController = nil;
            }
            
            MemberCenterVC *memberCenterVC = [[MemberCenterVC alloc] init];
            _lastViewController = memberCenterVC;

            [homeNav pushViewController:memberCenterVC animated:NO];
            [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
            }];
        }
            break;
        case 5:{//密码修改
                if ([_lastViewController isKindOfClass:[ChangeCodeVC class]]) {
                    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
                    }];
                    return;
                }else if (_lastViewController){
                    [_lastViewController removeFromParentViewController];
                    _lastViewController = nil;
                }
                
                ChangeCodeVC *changeCodeVC = [[ChangeCodeVC alloc] init];
                _lastViewController = changeCodeVC;
                [homeNav pushViewController:changeCodeVC animated:NO];
                [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
                }];
            }
            break;
        case 6:{//清除缓存
            }
            break;
        case 7:{//登陆注册
            if ([_lastViewController isKindOfClass:[LoginAndRegisterVC class]]) {
                [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
                }];
                return;
            }else if (_lastViewController){
                [_lastViewController removeFromParentViewController];
                _lastViewController = nil;
            }
            
            LoginAndRegisterVC *loginVc = [[LoginAndRegisterVC alloc] init];
            loginVc.hidesBottomBarWhenPushed = YES;
            _lastViewController = loginVc;
            [homeNav pushViewController:loginVc animated:NO];
            [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
            }];
        }
            break;
        case 8:{//退出登录
        }
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
