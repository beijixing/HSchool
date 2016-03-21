//
//  ReportViewController.m
//  HiSchool
//
//  Created by ybon on 16/3/16.
//  Copyright © 2016年 ybon. All rights reserved.
//
//举报
#import "ReportViewController.h"

@interface ReportViewController ()
{
    NSMutableArray *_numArr;
}
@end

@implementation ReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //导航栏时间标题视图
    [self configNavigationItemWithTitle:@"举报"];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.95f green:0.96f blue:0.96f alpha:1.00f];
    
    _numArr = [[NSMutableArray alloc]init];
    NSArray *titleArr = @[@"广告",@"过时",@"重复",@"侵权",@"错别字",@"色情低俗",@"标题夸张",@"观点错误",@"与事实不符",@"内容格式有误",@"文章质量差，我要吐槽"];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49)];
    [self.view addSubview:scrollView];
    if (IS_IPHONE_4_OR_LESS) {
        scrollView.contentSize = CGSizeMake(320, 480);
    }
    
    
    for (int i = 0; i<11; i++) {
        UIButton *btu = [[UIButton alloc]initWithFrame:[self createFrameWithX:60 andY:40+30*i andWidth:20 andHeight:20]];
        [btu setBackgroundImage:[UIImage imageNamed:@"roundback"] forState:UIControlStateNormal];
        [btu addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        btu.selected = NO;
        btu.tag = i;
        [scrollView addSubview:btu];
        
        UILabel *titleLbl = [[UILabel alloc]initWithFrame:[self createFrameWithX:90 andY:40+30*i andWidth:170 andHeight:20]];
        titleLbl.text = titleArr[i];
        titleLbl.textColor = [UIColor colorWithRed:0.64f green:0.64f blue:0.65f alpha:1.00f];
        titleLbl.tag = 100+i;
        [scrollView addSubview:titleLbl];
    }
    
    UIButton *submitBtn = [[UIButton alloc]initWithFrame:[self createFrameWithX:60 andY:380 andWidth:200 andHeight:40]];
    submitBtn.layer.borderColor = [UIColor colorWithRed:0.64f green:0.64f blue:0.65f alpha:1.00f].CGColor;
    submitBtn.layer.borderWidth = 1.0;
    submitBtn.layer.cornerRadius = 5.0;
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor colorWithRed:0.64f green:0.64f blue:0.65f alpha:1.00f] forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [submitBtn addTarget:self action:@selector(submitPressed:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:submitBtn];
    
}
-(void)btnPressed:(UIButton *)sender{
    
    
    UILabel *label = [self.view viewWithTag:sender.tag+100];
    if (sender.selected == NO) {
        sender.selected = YES;
        [sender setBackgroundImage:[UIImage imageNamed:@"roundselected"] forState:UIControlStateNormal];
        label.textColor = [UIColor colorWithRed:1.00f green:0.37f blue:0.31f alpha:1.00f];
        NSString *str = [NSString stringWithFormat:@"%ld",sender.tag];
        [_numArr addObject:str];
        
    }else{
        sender.selected = NO;
        [sender setBackgroundImage:[UIImage imageNamed:@"roundback"] forState:UIControlStateNormal];
        label.textColor = [UIColor colorWithRed:0.64f green:0.64f blue:0.65f alpha:1.00f];
        NSString *str = [NSString stringWithFormat:@"%ld",sender.tag];
        [_numArr removeObject:str];
    }
}
-(void)submitPressed:(UIButton *)sender{

    DLog(@"选中的项目为%@",_numArr);
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
