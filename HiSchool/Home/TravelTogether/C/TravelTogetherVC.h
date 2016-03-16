//
//  TravelTogetherVC.h
//  HiSchool
//
//  Created by ybon on 16/3/12.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TravelTogetherVC : BaseViewController
@property (strong, nonatomic) IBOutlet UITableView *travelTable;
@property (strong, nonatomic) IBOutlet UIImageView *adView;
@property (strong, nonatomic) IBOutlet UITextField *startCity;
@property (strong, nonatomic) IBOutlet UITextField *endCity;
@property (strong, nonatomic) IBOutlet UITextField *actionTime;
@property (strong, nonatomic) IBOutlet UITextField *vehicle;
@property (strong, nonatomic) IBOutlet UITextField *school;
@property (strong, nonatomic) IBOutlet UIView *headerView;
- (IBAction)searchButtonClick:(UIButton *)sender;
- (IBAction)addTravelButtonClick:(UIButton *)sender;


@end
