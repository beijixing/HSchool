//
//  RootViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/4.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "RootViewController.h"
#import "SchoolNewsBaseViewController.h"
@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataSource;
    UITableView *_table;
    
    int _currentPage;
    int _count;
     NSInteger _totalElements;
    NSInteger _totalElements2;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _dataSource = [[NSMutableArray alloc]init];
    _currentPage = 1;
    _count = 10;
    
    [self createUI];
    [self loadData];
//    [self loadImage];
    
}
-(void)createUI{
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0,64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    _table.dataSource = self;
    _table.delegate = self;
    [self.view addSubview:_table];
    [MBProgressHUD showHUDAddedTo:_table animated:YES];
    
    [self addHeaderMJRefresh];
    [self addFooterMJRefresh];
}
- (void)addHeaderMJRefresh

{
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    _table.header = header;
}
//上拉加载
- (void)addFooterMJRefresh
{
    MJRefreshAutoGifFooter * footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    _table.footer = footer;
}
- (void)loadNewData
{   //下拉刷新
    _currentPage = 1;
    _count=10;
    [self loadData];
}
- (void)loadMoreData
{  //上拉加载
    if (_count <= _totalElements&&_totalElements != _totalElements2) {
        _currentPage ++;
        [self loadData];
    }else{
        [_table.footer noticeNoMoreData];
    }
}
-(void)loadData{
//    [HttpRequest getWiferyType:^(NSArray *array, NSError *err) {
//        _dataSource = [NSMutableArray arrayWithArray:array];
//        DLog(@"数据源%@",_dataSource);
//    }];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    NSString *path = [NSString stringWithFormat:@"%@&pageNumber=%d&pageSize=%d",HOUSEWIFERYINFOPATH,_currentPage,_count];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableDictionary *_dic = responseObject[@"result"];
        _totalElements = [_dic[@"numberOfElements"] integerValue];
        _totalElements2 = [_dic[@"totalElements"] integerValue];
        NSMutableArray *_array = _dic[@"content"];
        _dataSource = _array;
        [MBProgressHUD hideHUDForView:_table animated:YES];
        
        [_table.header endRefreshing];
        [_table.footer endRefreshing];
        
        [_table reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error.description);
    }];

    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *string = @"string";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    cell.textLabel.text = _dataSource[indexPath.row][@"title"];
    return cell;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SchoolNewsBaseViewController *base = [[SchoolNewsBaseViewController alloc]init];
    [self.navigationController pushViewController:base animated:YES];
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
