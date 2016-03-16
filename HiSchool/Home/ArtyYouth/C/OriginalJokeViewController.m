//
//  OriginalJokeViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/11.
//  Copyright © 2016年 ybon. All rights reserved.
//
//原创笑话
#import "OriginalJokeViewController.h"
#import "OriginalJokeTableViewCell.h"
#import "NewsHotspotsTableViewCell.h"
@interface OriginalJokeViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UIImageView *_headScrollView;   //头部滚动视图
    UITextField *_searchField;      //搜索
    NSMutableArray *_dataSource;
    UITableView *_tableView;
    
}

@end

@implementation OriginalJokeViewController

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
    
    UIView *headView = [[UIView alloc]initWithFrame:[self createFrameWithX:0 andY:0 andWidth:320 andHeight:180]];
    [self.view addSubview:headView];
    
    _headScrollView = [[UIImageView alloc]initWithFrame:[self createFrameWithX:5 andY:5 andWidth:310 andHeight:150]];
    _headScrollView.backgroundColor = [UIColor blueColor];
    _headScrollView.layer.cornerRadius = 10;
    [headView addSubview:_headScrollView];
    
    _searchField = [[UITextField alloc]initWithFrame:[self createFrameWithX:5 andY:160 andWidth:130 andHeight:20]];
    _searchField.tag = 777;
    _searchField.delegate = self;
    _searchField.placeholder = @"学校名/作者名";
    _searchField.font = [UIFont systemFontOfSize:13];
    [headView addSubview:_searchField];
    
    UILabel *line = [[UILabel alloc]initWithFrame:[self createFrameWithX:5 andY:180 andWidth:130 andHeight:1]];
    line.backgroundColor = [UIColor blackColor];
    [headView addSubview:line];
    //搜索
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:[self createFrameWithX:140 andY:160 andWidth:50 andHeight:20]];
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
    UIButton *searchSchoolBtn = [[UIButton alloc]initWithFrame:[self createFrameWithX:195 andY:160 andWidth:80 andHeight:20]];
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
    addBtn.frame = [self createFrameWithX:295 andY:160 andWidth:20 andHeight:20];
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
}

#pragma mark - UITableView代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *string = @"string";

    OriginalJokeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"OriginalJokeTableViewCell" owner:self options:nil]lastObject];
    }
    
    if (indexPath.row%2==1) {
        cell.backImageView.backgroundColor = [UIColor colorWithRed:1.0 green:0.7031 blue:0.3758 alpha:1.0];
    }else{
        cell.backImageView.backgroundColor = [UIColor colorWithRed:0.3678 green:0.6529 blue:1.0 alpha:1.0];

    }
    cell.textLbl.text = @"一群蚂蚁爬上了大象的背，但被摇了下来，只有一只蚂蚁死死地抱着大象的脖子不放，下面的蚂蚁大叫：掐死他，掐死他，小样，还他妈反了！";
    cell.authorLbl.text = @"北宋年间一举人";
    cell.universityLbl.text = @"北宋梁山一私塾";
    cell.timeLbl.text = @"1111.11.11";
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NoticeDetailViewController *notice = [[NoticeDetailViewController alloc]init];
//    [self.navigationController pushViewController:notice animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
