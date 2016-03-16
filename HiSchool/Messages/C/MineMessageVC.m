//
//  MineMessageVC.m
//  HiSchool
//
//  Created by ybon on 16/3/7.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "MineMessageVC.h"
#import "MessageCell.h"
#import "ChatVC.h"

@interface MineMessageVC ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_messagesTableview;
    NSMutableArray *_messagesArr;
}
@end

@implementation MineMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.navigationItem.title = @"我的消息";
    [self configMessageTableView];
}
- (void)configMessageTableView {
    _messagesTableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 49-64) style:UITableViewStylePlain];
    _messagesTableview.delegate = self;
    _messagesTableview.dataSource = self;
    [_messagesTableview registerClass:[MessageCell class] forCellReuseIdentifier:@"messageCell"];
    [self.view addSubview:_messagesTableview];
    _messagesTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messageCell"];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageCell *displayCell = (MessageCell *)cell;
    displayCell.headIcon.image = [UIImage imageNamed:@"im_4"];
    displayCell.messageSender.text = @"王章框子";
    displayCell.schoolName.text = @"中国航空航天大学";
    displayCell.timeLabel.text = @"2016-02-18 16:20";
    displayCell.messageLabel.text = @"给每个服务器分配一个加权值为比例，根椐这个比例，把用户的请求分配到每个服务器。";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 55*self.scaleRatio;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatVC *chatVc = [[ChatVC alloc] init];
    [self.navigationController pushViewController:chatVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
}

@end
