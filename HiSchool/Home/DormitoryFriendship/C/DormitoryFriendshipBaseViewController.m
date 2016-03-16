//
//  DormitoryFriendshipBaseViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/10.
//  Copyright © 2016年 ybon. All rights reserved.
//
//宿舍联谊
#import "DormitoryFriendshipBaseViewController.h"
#import "FriendShipCell.h"
#import "DormitoryFriendshipDetilViewController.h"
#import "DormitoryFriendshipUploadVC.h"
@interface DormitoryFriendshipBaseViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UIView *_headView;
    float a;    //记录头视图的宽
    float b;    //记录头视图的高
    UIImageView *_headScrollView;   //头部滚动视图
    
    NSMutableArray *_dataSource;
    UICollectionView *_collectionView;
}
@end

@implementation DormitoryFriendshipBaseViewController
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航栏时间标题视图
    [self configNavigationItemTitleView];
    //tabBar返回
    [self addHomeItemsBackEventNotification];
    [self clearNavigationItemLeftBarButton];
    
    _dataSource = [[NSMutableArray alloc]init];
    [self loadData];
    [self createUI];
}
-(void)loadData{
    DLog(@"请求数据");
}
-(void)createUI{
    _headView = [[UIView alloc]initWithFrame:[self createFrameWithX:0 andY:0 andWidth:320 andHeight:270]];
    
    a = _headView.frame.size.width;
    b = _headView.frame.size.height;
    
    _headScrollView = [[UIImageView alloc]initWithFrame:[self createFrameWithX:5 andY:5 andWidth:310 andHeight:150]];
    _headScrollView.backgroundColor = [UIColor blueColor];
    _headScrollView.layer.cornerRadius = 10;
    [_headView addSubview:_headScrollView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:[self createFrameWithX:5 andY:160 andWidth:310 andHeight:80]];
    label.layer.borderColor = [UIColor blueColor].CGColor;
    label.layer.borderWidth = 1.0;
    [_headView addSubview:label];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    addBtn.frame = [self createFrameWithX:290 andY:240 andWidth:20 andHeight:20];
    [addBtn addTarget:self action:@selector(addBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:addBtn];
    
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
    [_collectionView registerClass:[FriendShipCell class] forCellWithReuseIdentifier:@"FriendShipCell"];
    //注册_collectionView的组头视图，提前告诉_collectionView用什么视图作为头视图的复用视图
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
}

-(void)addBtnPressed:(UIButton *)sender{
    DLog(@"加");
    DormitoryFriendshipUploadVC *upload = [[DormitoryFriendshipUploadVC alloc]init];
    [self.navigationController pushViewController:upload animated:YES];
}

#pragma mark -  UICollectionView 相关的方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"FriendShipCell";
    FriendShipCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    //设置显示文字
        cell.title = @"故人西辞黄鹤楼，烟花三月下扬州。";
        cell.imageName = @"moren.png";
    return cell;
}
//设置某一个网格的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FriendShipCell *video = [[FriendShipCell alloc]initWithFrame:[self createFrameWithX:0 andY:0 andWidth:80 andHeight:100]];
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
    NSLog(@"选中第%ld个",indexPath.item);
    DormitoryFriendshipDetilViewController *detail = [[DormitoryFriendshipDetilViewController alloc]init];
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
