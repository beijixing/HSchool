//
//  RevelationDetailTableViewCell.h
//  HiSchool
//
//  Created by ybon on 16/3/16.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RevelationDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *universityLbl;
@property (weak, nonatomic) IBOutlet UILabel *timeLbl;
@property (weak, nonatomic) IBOutlet UILabel *textLbl;

@end
