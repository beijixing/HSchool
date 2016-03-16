//
//  PublishAndCollectionVC.m
//  HiSchool
//
//  Created by ybon on 16/3/11.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "PublishAndCollectionVC.h"
#import "PublishAndCollectionCell.h"

@interface PublishAndCollectionVC ()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_requestDataArr;
    NSArray *_filterTitleArr;
}
@property(nonatomic, strong) UISegmentedControl *segmentControl;
@property(nonatomic, strong) UITableView *publishAndCollectionDataTable;
@end

@implementation PublishAndCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _filterTitleArr = [NSArray arrayWithObjects:@"全部", @"同学微拍", @"校园新闻", @"校内美图", @"文艺青年", @"同学互助", @"睡前时分", @"一路同行", nil];
    [self createUI];
    [self clearNavigationItemLeftBarButton];
    [self configNavigationItemTitleView];
    
    [self addRightItemsBackEventNotification];
    self.isRightViewController = YES;
}

- (void)createUI {
    self.segmentControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"我的发布",@"我的收藏" , nil]];
    self.segmentControl.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44*self.scaleRatio);
    [self.segmentControl addTarget:self action:@selector(segmentControlEvent:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentControl];
    
    CGFloat buttonSpace = 42/5;
    CGFloat buttonWidth = (SCREEN_WIDTH-42)/4;
    for (int i = 0; i<8; i++) {
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        titleButton.frame = CGRectMake(i%4*(buttonWidth+buttonSpace)+buttonSpace, (i/4)*(buttonSpace +30*self.scaleRatio) + 44*self.scaleRatio, buttonWidth, 30*self.scaleRatio);
        titleButton.tag = i;
        [titleButton setTitle:_filterTitleArr[i] forState:UIControlStateNormal];
        
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:titleButton];
    }
    
    self.publishAndCollectionDataTable = [[UITableView alloc] initWithFrame:CGRectMake(buttonSpace,  44*self.scaleRatio + 70*self.scaleRatio, SCREEN_WIDTH-2*buttonSpace, SCREEN_HEIGHT -44*self.scaleRatio - 60*self.scaleRatio - 49) style:UITableViewStylePlain];
    self.publishAndCollectionDataTable.dataSource = self;
    self.publishAndCollectionDataTable.delegate = self;
    
    [self.publishAndCollectionDataTable registerNib:[UINib nibWithNibName:@"PublishAndCollectionCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PublishAndCollectionCell"];
    [self.view addSubview:self.publishAndCollectionDataTable];
}

- (void)segmentControlEvent:(UISegmentedControl *)segmentCtl {
    
}

- (void)titleButtonClick:(UIButton *)button {
    
}


#pragma  mark --tableview代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PublishAndCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PublishAndCollectionCell"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44*self.scaleRatio;
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
