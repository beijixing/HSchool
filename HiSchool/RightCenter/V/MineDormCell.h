//
//  MineDormCell.h
//  HiSchool
//
//  Created by ybon on 16/3/18.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MineDormCellDelegate <NSObject>

@end

@interface MineDormCell : UIView
@property(nonatomic, assign) id <MineDormCellDelegate>delegate;
@property(nonatomic, strong) UIImageView *dormIcon;
@property(nonatomic, strong) UIImageView *dormBackgroundImage;
@property(nonatomic, strong) NSString *dormTitle;
@end
