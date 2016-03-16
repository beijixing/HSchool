//
//  BaseIViewController.h
//  HiSchool
//
//  Created by ybon on 16/3/7.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kHomeVCItemsNotification @"kHomeVCItemsNotification"
#define kRightVCItemNotification @"kRightVCItemNotification"
#define kResetRightVCLastViewControllerNotification @"kResetRightVCLastViewControllerNotification"
#define kMessageItemVCNotification @"kMessageItemVCNotification"

@interface BaseViewController : UIViewController
@property (nonatomic, assign) float scaleRatio;
@property (nonatomic, assign) BOOL isRightViewController;
//按宽的比例适配
-(CGRect)createFrameWithX:(CGFloat)x andY:(CGFloat)y andWidth:(CGFloat)width andHeight:(CGFloat)height;

//导航条上显示的信息
- (void)configNavigationItemTitleView;
- (void)configNavigationItemWithTitle:(NSString *)title;

//添加主页跳转到子视图的返回通知，只在子视图的一级视图调用该方法，二级视图及更深层的视图不要添加该方法。
- (void)addHomeItemsBackEventNotification;

//添加右侧视图跳转到子视图的返回通知，只在子视图的一级视图调用该方法，二级视图及更深层的视图不要添加该方法。
- (void)addRightItemsBackEventNotification;

//添加消息视图跳转到子视图的返回通知，只在子视图的一级视图调用该方法，二级视图及更深层的视图不要添加该方法。
- (void)addMessageItemEventNotification;

//隐藏导航栏左侧的返回按钮
- (void)clearNavigationItemLeftBarButton;
@end
