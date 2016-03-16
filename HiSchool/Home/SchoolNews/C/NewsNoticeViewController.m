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
    
    UIView *headView = [[UIView alloc]initWithFrame:[self createFrameWithX:0 andY:0 andWidth:320 andHeight:200]];
    [self.view addSubview:headView];
    
    _headScrollView = [[UIImageView alloc]initWithFrame:[self createFrameWithX:5 andY:5 andWidth:310 andHeight:150]];
    _headScrollView.backgroundColor = [UIColor blueColor];
    _headScrollView.layer.cornerRadius = 10;
    [headView addSubview:_headScrollView];
    
    UILabel *searchLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:5 andY:160 andWidth:190 andHeight:40]];
    searchLbl.layer.borderColor = [UIColor colorWithRed:0.3922 green:0.3922 blue:0.3922 alpha:1.0].CGColor;
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
    placeLbl.textColor = [UIColor colorWithRed:0.3922 green:0.3922 blue:0.3922 alpha:1.0];
    [_searchField addSubview:placeLbl];
    
    //搜索
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:[self createFrameWithX:170 andY:170 andWidth:20 andHeight:20]];
    searchBtn.backgroundColor = [UIColor grayColor];
    
    [searchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [searchBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [searchBtn addTarget:self action:@selector(searchPressed:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:searchBtn];
    
    
    //只看本校搜索
    UIButton *searchSchoolBtn = [[UIButton alloc]initWithFrame:[self createFrameWithX:200 andY:160 andWidth:70 andHeight:40]];
    searchSchoolBtn.backgroundColor = [UIColor whiteColor];
    searchSchoolBtn.layer.borderColor = [UIColor colorWithRed:0.3922 green:0.3922 blue:0.3922 alpha:1.0].CGColor;
    searchSchoolBtn.layer.borderWidth = 1.0;
    searchSchoolBtn.layer.cornerRadius = 10.0;
    searchSchoolBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [searchSchoolBtn setTitle:@"只看本校" forState:UIControlStateNormal];
    [searchSchoolBtn setTitleColor:[UIColor colorWithRed:0.3922 green:0.3922 blue:0.3922 alpha:1.0] forState:UIControlStateNormal];
    [searchSchoolBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [searchSchoolBtn addTarget:self action:@selector(searchSchoolPressed:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:searchSchoolBtn];
    
    
    //增加按钮
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    addBtn.frame = [self createFrameWithX:275 andY:160 andWidth:40 andHeight:40];
    [addBtn addTarget:self action:@selector(addPressed:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:addBtn];
    
    
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
    NewsNoticeUploadVC *upload = [[NewsNoticeUploadVC alloc]init];
    [self.navigationController pushViewController:upload animated:YES];
}

#pragma mark - UITableView代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *string = @"string";
    NewsHotspotsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"NewsHotspotsTableViewCell" owner:self options:nil]lastObject];
        }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NoticeDetailViewController *notice = [[NoticeDetailViewController alloc]init];
    [self.navigationController pushViewController:notice animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
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
