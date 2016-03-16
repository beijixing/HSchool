//
//  SendMessageView.h
//  HiSchool
//
//  Created by ybon on 16/3/9.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SendMessageViewDelegate <NSObject>

- (void)getInputText:(NSString *)text;

@end

@interface SendMessageView : UIView
@property(nonatomic, assign)id<SendMessageViewDelegate>delegate;
- (void)addButtonImage:(UIImage *)image andSelectedImage:(UIImage *)selectedImage;
@end
