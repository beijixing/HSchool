//
//  ExperienceAndFeedbackVC.h
//  HiSchool
//
//  Created by ybon on 16/3/12.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CirculateView.h"

@interface ExperienceAndFeedbackVC : BaseViewController
@property (strong, nonatomic) IBOutlet CirculateView *adView;
@property (strong, nonatomic) IBOutlet UITableView *feedBackReportTable;
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UIButton *addFeedBackButton;
@property (strong, nonatomic) IBOutlet UIImageView *textFieldBgImage;
- (IBAction)searchButtonClick:(UIButton *)sender;
- (IBAction)addFeedBackButtonClick:(UIButton *)sender;

@end
