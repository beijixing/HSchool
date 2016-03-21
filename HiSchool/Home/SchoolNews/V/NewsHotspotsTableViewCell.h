//
//  NewsHotspotsTableViewCell.h
//  HiSchool
//
//  Created by ybon on 16/3/9.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsHotspotsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *supportLbl;
@property (weak, nonatomic) IBOutlet UILabel *opposeLbl;
@property (weak, nonatomic) IBOutlet UILabel *timeLbl;


@end
