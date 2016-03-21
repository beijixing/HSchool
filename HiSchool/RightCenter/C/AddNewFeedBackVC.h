//
//  AddNewFeedBackVC.h
//  HiSchool
//
//  Created by ybon on 16/3/12.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewFeedBackVC : BaseViewController
@property (strong, nonatomic) IBOutlet UITextField *titleTF;
@property (strong, nonatomic) IBOutlet UITextView *contentTextView;
- (IBAction)addAdditionalItemBtnClick:(UIButton *)sender;
- (IBAction)commitButtonClick:(UIButton *)sender;

@end
