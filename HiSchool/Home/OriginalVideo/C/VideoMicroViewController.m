//
//  VideoMicroViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/10.
//  Copyright © 2016年 ybon. All rights reserved.
//
//学生微剧
#import "VideoMicroViewController.h"
#import "MyCell.h"
#import "MicroDetailViewController.h"
#import "SchoolBabeTableViewCell.h"
#import "MicroUploadVC.h"   //上传
@interface VideoMicroViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UIView *_headView;  //UICollectionView的头视图
    float a;    //记录头视图的宽
    float b;    //记录头视图的高
    UIImageView *_headScrollView;   //头部滚动视图
    UITextField *_searchField;      //搜索
    
    NSMutableArray *_dataSource;
    UICollectionView *_collectionView;
    
    UITableView *_tableView;
    NSInteger k;
}
@end

@implementation VideoMicroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _dataSource = [[NSMutableArray alloc]init];
    
    //tabBar返回
    [self addHomeItemsBackEventNotification];
    [self clearNavigationItemLeftBarButton];
    
    k=1;
    
    [self loadData];
    [self createUI];
}
-(void)loadData{
    DLog(@"请求数据");
}
-(void)createUI{
    _headView = [[UIView alloc]initWithFrame:[self createFrameWithX:0 andY:0 andWidth:320 andHeight:190]];
    a = _headView.frame.size.width;
    b = _headView.frame.size.height;
//    [self.view addSubview:headView];          //头视图要添加到UICollectionView的头视图上
    
    _headScrollView = [[UIImageView alloc]initWithFrame:[self createFrameWithX:5 andY:5 andWidth:310 andHeight:150]];
    _headScrollView.backgroundColor = [UIColor blueColor];
    _headScrollView.layer.cornerRadius = 10;
    [_headView addSubview:_headScrollView];
    
    _searchField = [[UITextField alloc]initWithFrame:[self createFrameWithX:5 andY:160 andWidth:130 andHeight:20]];
    _searchField.tag = 777;
    _searchField.delegate = self;
    _searchField.placeholder = @"学校名/作者名";
    _searchField.font = [UIFont systemFontOfSize:13];
    [_headView addSubview:_searchField];
    
    UILabel *line = [[UILabel alloc]initWithFrame:[self createFrameWithX:5 andY:180 andWidth:130 andHeight:1]];
    line.backgroundColor = [UIColor blackColor];
    [_headView addSubview:line];
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
    [_headView addSubview:searchBtn];
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
    [_headView addSubview:searchSchoolBtn];
    //增加按钮
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    addBtn.frame = [self createFrameWithX:295 andY:160 andWidth:20 andHeight:20];
    [addBtn addTarget:self action:@selector(addPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:addBtn];

    
    if (k==1) {         //进入界面是collectionView
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
    
        //提前告诉_collectionView用什么视图作为显示的复用视图，并且设置复用标识，@"MyCell"
        [_collectionView registerClass:[MyCell class] forCellWithReuseIdentifier:@"MyCell"];
        //注册_collectionView的组头视图，提前告诉_collectionView用什么视图作为头视图的复用视图
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    }else{          //点击搜索之后是tableView
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableHeaderView = _headView;
    }
}

#pragma mark - 搜索按钮点击
-(void)searchPressed:(UIButton *)sender{
    [self.view endEditing:YES];
    DLog(@"搜索");
    //移除子视图，重新创建UI
    for (UIView *view in self.view.subviews) {
        [view removeFromSuperview];
    }
    k=2;
    [self createUI];
}
-(void)searchSchoolPressed:(UIButton *)sender{
    [self.view endEditing:YES];
    DLog(@"只看本校");
    //移除子视图，重新创建UI
    for (UIView *view in self.view.subviews) {
        [view removeFromSuperview];
    }
    k=2;
    [self createUI];
}
-(void)addPressed:(UIButton *)sender{
    [self.view endEditing:YES];
    DLog(@"加");
    MicroUploadVC *upload = [[MicroUploadVC alloc]init];
    [self.navigationController pushViewController:upload animated:YES];
}
#pragma mark -  UICollectionView 相关的方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"MyCell";
    MyCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    [cell setImageStr:@"moren" title:@"标题标题" university:@"大学大学"];
    return cell;
}
//设置某一个网格的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *video = [[MyCell alloc]initWithFrame:[self createFrameWithX:0 andY:0 andWidth:140 andHeight:100]];
    float width = video.frame.size.width;
    float height = video.frame.size.height;
    return CGSizeMake(width, height);
}
//设置collectionView当前页距离四周的边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}
//设置最小行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
//设置最小列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}
//选中某一个Item时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"collectionView跳到详情");
    MicroDetailViewController *detail = [[MicroDetailViewController alloc]init];
    [self.navigationController pushViewController:detail animated:YES];
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}
//设置组头视图或组脚视图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *header = @"header";
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:header forIndexPath:indexPath];
//    headerView.backgroundColor = [UIColor blueColor];
    //设置UICollectionView的头视图
    [headerView addSubview:_headView];
    return headerView;
}

//返回组头视图的尺寸
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(a, b);
}

#pragma mark - UITableView代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *string = @"string";
    SchoolBabeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SchoolBabeTableViewCell" owner:self options:nil]lastObject];
    }
    cell.titleLbl.text = @"六个人的梦想你该好好的奋斗下去！";
    cell.universityLbl.text = @"山东建筑大学";
    cell.timeLbl.text = @"2016.01.01";
    cell.numLbl.text = @"5555";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"tableView跳到详情");
    MicroDetailViewController *detail = [[MicroDetailViewController alloc]init];
    [self.navigationController pushViewController:detail animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
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
