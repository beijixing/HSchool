//
//  MemberCenterVC.h
//  HiSchool
//
//  Created by ybon on 16/3/11.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberCenterVC : BaseViewController
@property (strong, nonatomic) IBOutlet UIButton *headIconButton;
- (IBAction)headIconButtonClick:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UILabel *usernameLB;
@property (strong, nonatomic) IBOutlet UIImageView *sexImage;
@property (strong, nonatomic) IBOutlet UILabel *memberIDLB;
@property (strong, nonatomic) IBOutlet UITextField *userNameTF;
- (IBAction)saveUserNameBtnClick:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITextField *schoolTF;
- (IBAction)saveSchoolBtnClick:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITextField *entranceTF;
- (IBAction)saveEntranceBtnClick:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITextField *majorTF;
- (IBAction)saveMajorBtnClick:(UIButton *)sender;
- (IBAction)messageSwitchValueChanged:(UISwitch *)sender;
@property (strong, nonatomic) IBOutlet UITextField *emailTF;
- (IBAction)changeEmailBtnClick:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UILabel *versioinLB;
- (IBAction)updateBtnClick:(UIButton *)sender;



@end
