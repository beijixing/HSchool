//
//  SupportTableViewCell.h
//  HiSchool
//
//  Created by ybon on 16/3/17.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SupportTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *universityLbl;
@property (weak, nonatomic) IBOutlet UILabel *timeLbl;
@property (weak, nonatomic) IBOutlet UILabel *textLbl;
@end
