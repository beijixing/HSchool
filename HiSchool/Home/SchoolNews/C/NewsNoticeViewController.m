//
//  NewsNoticeViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/7.
//  Copyright © 2016年 ybon. All rights reserved.
//
//社团公告
#import "NewsNoticeViewController.h"
#import "NewsHotspotsTableViewCell.h"
#import "NoticeDetailViewController.h"
#import "NewsNoticeUploadVC.h"      //上传
@interface NewsNoticeViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UIImageView *_headScrollView;   //头部滚动视图
    UITextField *_searchField;      //搜索
    NSMutableArray *_dataSource;
    UITableView *_tableView;
}
@end

@implementation NewsNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _dataSource = [[NSMutableArray alloc]init];
    [self loadData];
    [self createUI];
}
-(void)loadData{
    DLog(@"请求数据");
}

-(void)createUI{
    
    UIView *headView = [[UIView alloc]initWithFrame:[self createFrameWithX:0 andY:0 andWidth:320 andHeight:240]];
    [self.view addSubview:headView];
    
    _headScrollView = [[UIImageView alloc]initWithFrame:[self createFrameWithX:0 andY:0 andWidth:320 andHeight:150]];
    _headScrollView.image = [UIImage imageNamed:@"moren"];
    [headView addSubview:_headScrollView];
    
    
    UILabel *searchLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:5 andY:160 andWidth:190 andHeight:40]];
    searchLbl.layer.borderColor = [UIColor colorWithRed:0.74f green:0.74f blue:0.74f alpha:1.00f].CGColor;
    searchLbl.layer.borderWidth = 1.0;
    searchLbl.layer.cornerRadius = 10.0;
    [headView addSubview:searchLbl];
    
    
    _searchField = [[UITextField alloc]initWithFrame:[self createFrameWithX:5 andY:160 andWidth:170 andHeight:40]];
    _searchField.delegate = self;
    _searchField.tag = 999;
    [headView addSubview:_searchField];
    
    UILabel *placeLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:0 andY:10 andWidth:170 andHeight:20]];
    placeLbl.tag = 998;
    placeLbl.text = @"学校名/作者名/标题";
    placeLbl.font = [UIFont systemFontOfSize:13];
    placeLbl.textColor = [UIColor colorWithRed:0.74f green:0.74f blue:0.74f alpha:1.00f];
    [_searchField addSubview:placeLbl];
    
    //搜索
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:[self createFrameWithX:170 andY:170 andWidth:20 andHeight:20]];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [searchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [searchBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [searchBtn addTarget:self action:@selector(searchPressed:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:searchBtn];
    
    
    //只看本校搜索
    UIButton *searchSchoolBtn = [[UIButton alloc]initWithFrame:[self createFrameWithX:200 andY:160 andWidth:70 andHeight:40]];
    [searchSchoolBtn setBackgroundImage:[UIImage imageNamed:@"schoolonly"] forState:UIControlStateNormal];
    [searchSchoolBtn addTarget:self action:@selector(searchSchoolPressed:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:searchSchoolBtn];
    
    
    //增加按钮
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.frame = [self createFrameWithX:275 andY:160 andWidth:40 andHeight:40];
    [addBtn setBackgroundImage:[UIImage imageNamed:@"publish"] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addPressed:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:addBtn];
    
    //排序
    NSArray *titleArr= @[@"学校顺序",@"时间顺序"];
    for (int i = 0; i<2; i++) {
        UIButton *submitTime = [[UIButton alloc]initWithFrame:[self createFrameWithX:5+100*i andY:205 andWidth:90 andHeight:30]];
        submitTime.layer.cornerRadius = 10.0;
        [submitTime addTarget:self action:@selector(sortPressed:) forControlEvents:UIControlEventTouchUpInside];
        submitTime.tag = 300+i;
        [headView addSubview:submitTime];
        
        UIImageView *leftImage = [[UIImageView alloc]initWithFrame:[self createFrameWithX:5 andY:5 andWidth:20 andHeight:20]];
        leftImage.image = [UIImage imageNamed:@"sort"];
        [submitTime addSubview:leftImage];
        UILabel *rightLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:30 andY:5 andWidth:60 andHeight:20]];
        rightLbl.text = titleArr[i];
        rightLbl.textColor = [UIColor colorWithRed:0.74f green:0.74f blue:0.74f alpha:1.00f];
        rightLbl.font = [UIFont systemFontOfSize:13];
        [submitTime addSubview:rightLbl];
        
        if (i==0) {
            submitTime.backgroundColor = [UIColor colorWithRed:0.95f green:0.96f blue:0.96f alpha:1.00f];
        }
    }
    
    //最底下视频列表
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView=headView;
    
    
    //点击跳到顶部
    UIButton *topBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-50, SCREEN_HEIGHT-64-49-50-30, 30, 30)];
    [topBtn setBackgroundImage:[UIImage imageNamed:@"click_top"] forState:UIControlStateNormal];
    [topBtn addTarget:self action:@selector(clickToTop:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topBtn];
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
    NewsNoticeUploadVC *load = [[NewsNoticeUploadVC alloc]init];
    [self.navigationController pushViewController:load animated:YES];
}
#pragma mark - 排序
-(void)sortPressed:(UIButton *)sender{
    UIButton *btn1 = [self.view viewWithTag:300];
    UIButton *btn2 = [self.view viewWithTag:301];
    if (sender.tag == 300) {
        btn1.backgroundColor = [UIColor colorWithRed:0.95f green:0.96f blue:0.96f alpha:1.00f];
        btn2.backgroundColor = [UIColor clearColor];
        DLog(@"根据学校顺序排序");
    }else{
        btn1.backgroundColor = [UIColor clearColor];
        btn2.backgroundColor = [UIColor colorWithRed:0.95f green:0.96f blue:0.96f alpha:1.00f];
        DLog(@"根据时间顺序排序");
    }
}

#pragma mark - UITableView代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *string = @"string";
    NewsHotspotsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"NewsHotspotsTableViewCell" owner:nil options:nil]lastObject];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.titleLbl.text = @"管理不周，迟早垮掉。";
    cell.supportLbl.text = @"街舞社团";
    cell.opposeLbl.text = @"山东音乐学院";
    cell.timeLbl.text = @"2016-11-11";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NoticeDetailViewController *notice = [[NoticeDetailViewController alloc]init];
    [self.navigationController pushViewController:notice animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    UILabel *label = [self.view viewWithTag:998];
    label.text = @"";
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    UILabel *label = [self.view viewWithTag:998];
    if (textField.text.length == 0) {
        label.text = @"学校名/作者名/标题";
    }
}
#pragma mark - 点击跳到顶部
-(void)clickToTop:(UIButton *)sender{
    [_tableView setContentOffset:CGPointMake(0,0) animated:YES];
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
