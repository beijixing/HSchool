//
//  MessageCell.m
//  HiSchool
//
//  Created by ybon on 16/3/9.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "MessageCell.h"
#import "Masonry.h"
@interface MessageCell()
{
    float _scale;
}
@property(nonatomic, strong)UIImageView *lineImageView;
@end

@implementation MessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _scale = SCREEN_WIDTH/320;
        self.headIcon = [[UIImageView alloc] init];
        self.messageSender = [[UILabel alloc] init];
        self.messageSender.font = [UIFont fontWithName:@"Arial" size:13];
        
        self.schoolName = [[UILabel alloc] init];
        self.schoolName.font = [UIFont fontWithName:@"Arial" size:12];
        self.schoolName.textColor = [UIColor lightGrayColor];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont fontWithName:@"Arial" size:12];
        self.timeLabel.textAlignment = NSTextAlignmentRight;
        self.timeLabel.textColor = [UIColor lightGrayColor];
        
        self.messageLabel = [[UILabel alloc] init];
        self.messageLabel.font = [UIFont fontWithName:@"Arial" size:13];
        self.messageLabel.textColor = [UIColor lightGrayColor];

        self.lineImageView = [[UIImageView alloc] init];
        self.lineImageView.backgroundColor = [UIColor grayColor];
        
        
        [self.contentView addSubview:self.headIcon];
        [self.contentView addSubview:self.schoolName];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.messageLabel];
        [self.contentView addSubview:self.messageSender];
        [self.contentView addSubview:self.lineImageView];
        
    }
    return self;
}

- (void)layoutSubviews {
    [self.headIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40*_scale, 40*_scale));
        make.left.mas_equalTo(5);
        make.centerY.mas_equalTo(self.contentView);
    }];
    self.headIcon.layer.cornerRadius = 20*_scale;
    
    [self.messageSender mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*_scale, 20*_scale));
        make.left.mas_equalTo(self.headIcon.mas_right).offset(5);
        make.top.mas_equalTo(self.headIcon.mas_top).offset(0);
    }];
    
    [self.schoolName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.timeLabel.mas_left).offset(-5);
        make.left.mas_equalTo(self.messageSender.mas_right).offset(5);
        make.top.mas_equalTo(self.headIcon.mas_top).offset(0);
        make.height.mas_equalTo(20*_scale);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(95*_scale, 20*_scale));
        make.right.mas_equalTo(self.contentView.mas_right).offset(-5);
        make.top.mas_equalTo(self.headIcon.mas_top).offset(0);
    }];
    
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.messageSender.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-5);
        make.bottom.mas_equalTo(self.headIcon.mas_bottom).offset(0);
        make.height.mas_equalTo(15*_scale);
    }];
    
    [self.lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right).offset(0);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
