//
//  TimerManager.m
//  HiSchool
//
//  Created by ybon on 16/3/14.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "TimerManager.h"

static NSTimer *timer;
static NSMutableSet *delegateSet;
@implementation TimerManager
+ (instancetype)sharedManager {
    static TimerManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TimerManager alloc] init];
    });
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerEvent:) userInfo:nil repeats:YES];
        delegateSet = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void)setDelegate:(id<TimerManagerDelegate>)delegate {
    if (delegate) {
        [delegateSet addObject:delegate];
    }
}

- (void)timerEvent:(NSTimer *)timer {
    for ( id<TimerManagerDelegate> obj in delegateSet) {
        if (obj&& [obj respondsToSelector:@selector(timerManagerSecondsEvent)]) {
            [obj timerManagerSecondsEvent];
        }
    }
}

- (void)removeDelegate:(NSObject *)delegate {
    if (delegate) {
        [delegateSet removeObject:delegate];
    }
}
@end
