//
//  MessageCell.h
//  HiSchool
//
//  Created by ybon on 16/3/9.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell
@property(nonatomic, strong)UIImageView *headIcon;
@property(nonatomic, strong)UILabel *schoolName;
@property(nonatomic, strong)UILabel *timeLabel;
@property(nonatomic, strong)UILabel *messageLabel;
@property(nonatomic, strong)UILabel *messageSender;
@end
