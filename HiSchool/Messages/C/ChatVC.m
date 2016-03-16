//
//  ChatVC.m
//  HiSchool
//
//  Created by ybon on 16/3/9.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "ChatVC.h"
#import "SDChatModel.h"
#import "SDChatTableViewCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "SendMessageView.h"

@interface ChatVC ()<UITableViewDataSource, UITableViewDelegate, SendMessageViewDelegate>
{
    UITableView *_chatMessageTable;
    NSMutableArray *_messageDataArr;
    NSArray *_testDataArr;
}
@end

@implementation ChatVC

- (void)viewDidLoad {
    [super viewDidLoad];

    _messageDataArr = [[NSMutableArray alloc] init];
    [self configTestDataArr];
    [self setupDataWithCount:30];
    [self configMessageTableView];
    
    [self setupSendMessageView];
    
    [self configNavigationItemTitleView];
    [self clearNavigationItemLeftBarButton];
    [self addMessageItemEventNotification];
}



- (void)setupDataWithCount:(NSInteger)count
{
    for (int i = 0; i < count; i++) {
        SDChatModel *model = [SDChatModel new];
        model.messageType = arc4random_uniform(2);
        if (model.messageType) {
            model.iconName = @"im_2";
            if (arc4random_uniform(10) > 5) {
                int index = arc4random_uniform(5);
            }
        } else {
            if (arc4random_uniform(10) < 5) {
                int index = arc4random_uniform(5);
            }
            model.iconName = @"im_1";
        }
        int index = arc4random_uniform(10);
        model.text = _testDataArr[index];
        [_messageDataArr addObject:model];
    }
}

- (void)setupSendMessageView {
    SendMessageView *sendMessageView = [[SendMessageView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-64-49*2, SCREEN_WIDTH, 49)];
    sendMessageView.delegate = self;
    [self.view addSubview:sendMessageView];
}

- (void)getInputText:(NSString *)text {
    DLog(@"getInputText = %@", text);

}

- (void)configTestDataArr {
    _testDataArr = @[@"新华网北京3月8日电 8日上午",
                     @"湖南是农业大省。8日上午，习近平参加湖南代表团审议，听取了基层代表有关农业问题的意见建议。刘正军代表从环保科技角度谈了已经掌握治理镉超 标的核心技术。总书记详细询问这项技术的特点、成本和治理周期。习近平强调，要推进农业供给侧结构性改革，提高农业综合效益和竞争力。要以科技为支撑走内 涵式现代农业发展道路，实现藏粮于地、藏粮于技。",
                     @"“接近一半。”郭建群答。习近平要求当地党委和政府加大工作力度，带领当地群众一起艰苦奋斗，早日实现脱贫目标",
                     @"8日上午在湖南团参加审议时，习近平指出，今明两年，全国省市县乡要陆续换届，要深刻吸取湖南衡阳破坏选举案和四川南充拉票贿选案的教训，以“零容忍”的政治态度、规范严谨的法定程序、科学有效的工作机制、严肃认真的纪律要求，坚决杜绝此类现象发生。",
                     @"习近平8日上午参加湖南省代表团审议，有代表结合供给侧结构性改革，就加快湖南制造强省建设提出建议。习近平强调，推进供给侧结构性改革是一场 硬仗，要把握好“加法”和“减法”，增加要素投入，促进经济总量增加，减少无效和低端供给，扩大有效和中高端供给，提高全要素生产率。",
                     @"习近平8日上午参加湖南省代表团审议，强调要补齐民生短板。党的十八大以来，习近平的国内考察“路线图”覆盖了不少贫困村。总书记说：“抓工作 不能狗熊掰棒子，去过的每个地方都要抓反馈。有关部门都派人去看过，有的打招呼，有的不打招呼，看到是在认真抓落实，这很好。”习近平强调：“要坚持以民 为本，民有所想所求，我们就要帮助他们，为他们服务。”",
                     @"8日上午，习近平参加湖南代表团审议。正值三八国际劳动妇女节，总书记代表党中央、国务院，向女代表、女委员、女工作人员和全国各族各界妇女致 以节日的祝贺和诚挚的祝福。会议结束时，习近平同代表们握手道别。女代表纷纷围拢过来，向总书记表示感谢。习近平再次向妇女同胞表示祝贺。（新华社记者霍 小光，摄影兰红光、饶爱民，新华视点微博报道)",
                     @"　新华网北京3月8日电 8日上午，习近平参加湖南代表团审议。湘西土家族苗族自治州州长郭建群代表在发言中，回忆起2013年11月习近平总书记到十八洞村考察的情景，着重介绍 了近两年“精准扶贫”进展情况。习近平说，我正式提出“精准扶贫”就是在十八洞村，前几天中央电视台报道的十八洞村脱贫进展情况，我都看了。“现在人均收 入有多少了？”总书记问。“您当年来的时候是1680元，现在已经增加到3580元。”郭建群答。郭建群接着说，十八洞村百姓收入增加，村容村貌变化，已 成为全省文明村和旅游定点村，村民笑容多了、求发展愿望强了，连大龄男青年解决“脱单”问题也容易了。总书记问：“去年有多少人娶媳妇儿？”“7个。”郭 建群答道。代表们发出会心的笑声。当得知全州还有50万贫困人口，习近平问：“条件比十八洞村还差的有多少？”郭建群说，十八洞村的条件算中等的。总书记 追问：“不如它的有多少？”“接近一半。”郭建群答。习近平要求当地党委和政府加大工作力度，带领当地群众一起艰苦奋斗，早日实现脱贫目标。",
                     @"李克强总理8日参加十二届全国人大四次会议重庆代表团全体会议时说，现在不同地区行业经济走势出现分化，通俗讲就是“冰火两重天”。重庆属于“火”的那一端，跟重庆火锅一样，经济社会发展各项主要指标都走在全国前列。这靠的是重庆人民的闯劲和韧性。",
                     @"原标题：李克强以“重庆火锅”赞重庆经济之“火”"];
}

- (void)configMessageTableView {
    _chatMessageTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49*2) style:UITableViewStylePlain];
    _chatMessageTable.dataSource = self;
    _chatMessageTable.delegate = self;
    _chatMessageTable.separatorStyle = UITableViewCellSeparatorStyleNone;
   
    [_chatMessageTable registerClass:[SDChatTableViewCell class] forCellReuseIdentifier:@"ChatTableCell"];
    [self.view addSubview:_chatMessageTable];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SDChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChatTableCell"];
    cell.model = _messageDataArr[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _messageDataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat h = [tableView cellHeightForIndexPath:indexPath model:_messageDataArr[indexPath.row] keyPath:@"model" cellClass:[SDChatTableViewCell class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
    CGFloat height = h >44 ? h :44;
    return height;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
