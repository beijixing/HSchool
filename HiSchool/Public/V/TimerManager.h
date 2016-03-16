//
//  TimerManager.h
//  HiSchool
//
//  Created by ybon on 16/3/14.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TimerManager;
@protocol TimerManagerDelegate <NSObject>
- (void)timerManagerSecondsEvent;
@end

@interface TimerManager : NSObject
@property (nonatomic, weak) id <TimerManagerDelegate> delegate;

+ (instancetype)sharedManager;
- (void)removeDelegate:(NSObject *)delegate;

@end
