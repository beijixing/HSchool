//
//  StudentHelpBaseViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/11.
//  Copyright © 2016年 ybon. All rights reserved.
//
//同学互助
#import "StudentHelpBaseViewController.h"
#import "StudentHelpTableViewCell.h"
#import "StudentHelpDetailViewController.h"
@interface StudentHelpBaseViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITextField *_searchField;  //搜索
    NSMutableArray *_dataSource;
    UITableView *_tableView;
}
@end

@implementation StudentHelpBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _dataSource = [[NSMutableArray alloc]init];
    //导航栏时间标题视图
    [self configNavigationItemTitleView];
    //tabBar返回
    [self addHomeItemsBackEventNotification];
    [self clearNavigationItemLeftBarButton];
    
    [self loadData];
    [self createUI];
}
-(void)loadData{
    
}
-(void)createUI{
    
    UIView *headView = [[UIView alloc]initWithFrame:[self createFrameWithX:0 andY:0 andWidth:320 andHeight:80]];
    [self.view addSubview:headView];
    
    
    _searchField = [[UITextField alloc]initWithFrame:[self createFrameWithX:5 andY:5 andWidth:130 andHeight:20]];
    _searchField.tag = 777;
    _searchField.placeholder = @"学校名/作者名";
    _searchField.font = [UIFont systemFontOfSize:13];
    [headView addSubview:_searchField];
    
    UILabel *line = [[UILabel alloc]initWithFrame:[self createFrameWithX:5 andY:25 andWidth:130 andHeight:1]];
    line.backgroundColor = [UIColor blackColor];
    [headView addSubview:line];
    //搜索
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:[self createFrameWithX:140 andY:5 andWidth:50 andHeight:20]];
    searchBtn.backgroundColor = [UIColor whiteColor];
    searchBtn.layer.borderColor = [UIColor blackColor].CGColor;
    searchBtn.layer.borderWidth = 1.0;
    searchBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [searchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [searchBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [searchBtn addTarget:self action:@selector(searchPressed:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:searchBtn];
    //只看本校搜索
    UIButton *searchSchoolBtn = [[UIButton alloc]initWithFrame:[self createFrameWithX:195 andY:5 andWidth:80 andHeight:20]];
    searchSchoolBtn.backgroundColor = [UIColor whiteColor];
    searchSchoolBtn.layer.borderColor = [UIColor blackColor].CGColor;
    searchSchoolBtn.layer.borderWidth = 1.0;
    searchSchoolBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [searchSchoolBtn setTitle:@"只看本校" forState:UIControlStateNormal];
    [searchSchoolBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [searchSchoolBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [searchSchoolBtn addTarget:self action:@selector(searchSchoolPressed:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:searchSchoolBtn];
    //增加按钮
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    addBtn.frame = [self createFrameWithX:295 andY:5 andWidth:20 andHeight:20];
    [addBtn addTarget:self action:@selector(addPressed:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:addBtn];
    
    UILabel *label = [[UILabel alloc]initWithFrame:[self createFrameWithX:10 andY:30 andWidth:70 andHeight:20]];
    label.text = @"分类筛选:";
    label.adjustsFontSizeToFitWidth = YES;
    [headView addSubview:label];
    
    NSArray *titleArr = @[@"你问我答",@"找人跑腿",@"物品交换",@"同楼售卖",@"活动邀请",@"说说英语"];
    for (int i = 0; i<6; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:[self createFrameWithX:85+75*(i%3) andY:30+30*(i/3) andWidth:70 andHeight:20]];
        btn.layer.borderColor = [UIColor colorWithRed:1.0 green:0.6874 blue:0.2853 alpha:1.0].CGColor;
        btn.layer.borderWidth = 1.0;
        btn.layer.cornerRadius = 10.0;
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [headView addSubview:btn];
    }
    
    
    
    
    //最底下视频列表
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView=headView;
    
}
#pragma mark - 搜索按钮点击
-(void)searchPressed:(UIButton *)sender{
    [self.view endEditing:YES];
    DLog(@"搜索");
}
-(void)searchSchoolPressed:(UIButton *)sender{
    [self.view endEditing:YES];
    DLog(@"只看本校");
}
-(void)addPressed:(UIButton *)sender{
    [self.view endEditing:YES];
    DLog(@"加");
}

#pragma mark - UITableView代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *string = @"string";
    StudentHelpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"StudentHelpTableViewCell" owner:nil options:nil]lastObject];
    }
    if (indexPath.row%2==0) {
        cell.backImageView.backgroundColor = [UIColor colorWithRed:0.8307 green:0.9789 blue:1.0 alpha:1.0];
    }else{
        cell.backImageView.backgroundColor = [UIColor colorWithRed:1.0 green:0.7671 blue:0.6237 alpha:1.0];
    }

    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    StudentHelpDetailViewController *detail = [[StudentHelpDetailViewController alloc]init];
    [self.navigationController pushViewController:detail animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
