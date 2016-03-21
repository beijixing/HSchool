//
//  AppDelegate.m
//  HiSchool
//
//  Created by ybon on 16/3/4.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "AppDelegate.h"
#import "MMDrawerController.h"
#import "SchoolTabBarController.h"
#import "RightVC.h"
#import "IQKeyboardManager.h"

//友盟
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
#import "UMSocialSinaSSOHandler.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //初始化IQKeyboardManager
    [IQKeyboardManager sharedManager].enable = true;
    
    MMDrawerController *drawController = [[MMDrawerController alloc] init];
    SchoolTabBarController *tabBarController = [[SchoolTabBarController alloc] init];
    RightVC *rightVc = [[RightVC alloc] init];
    drawController.centerViewController = tabBarController;
    drawController.rightDrawerViewController = rightVc;
    
    drawController.maximumRightDrawerWidth = SCREEN_WIDTH *2/3;
    drawController.shouldStretchDrawer = YES;
    
//    [drawController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    self.window.rootViewController = drawController;
    
    
    
    //友盟
    [UMSocialData setAppKey:@"5690674767e58ee2e6000f7e"];
    
    [UMSocialWechatHandler setWXAppId:@"wx88fd1974afdec982" appSecret:@"01e2de30d3e6b230449bdb97abcaba7a" url:@"http://www.umeng.com/social"];
    
    [UMSocialQQHandler setQQWithAppId:@"1105103124" appKey:@"NQqtUUOkJRKdTgPl" url:@"http://www.umeng.com/social"];
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3921700954"
                                              secret:@"04b48b094faeb16683c32669824ebdad"
                                         RedirectURL:@"http://www.baidu.com"];
    
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
