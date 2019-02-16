//
//  Singleton.m
//  OCDemo
//
//  Created by yuanping on 2019/2/16.
//  Copyright © 2019年 yuanping. All rights reserved.
//

#import "Singleton.h"

@interface Singleton ()

@end

@implementation Singleton

static Singleton *singleInstance;

// 在ARC环境下的单例模式
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    // 线程安全，需要加锁
//    @synchronized (self) {
//        if (singleInstance == nil) {
//            singleInstance = [super allocWithZone:zone];
//        }
//        return singleInstance;
//    }
    // 也可以使用dispatch_once
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (singleInstance == nil) {
            singleInstance = [super allocWithZone: zone];
        }
    });
    return singleInstance;
}

+ (Singleton *)sharedInstance {
    return [[self alloc] init];
}

// 为了严谨，也要重写copyWithZone 和 mutableCopyWithZone
- (id)copyWithZone:(nullable NSZone *)zone {
    return singleInstance;
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    return singleInstance;
}

// 如果是在MRC环境下，还需要重写一下三个方法
//-(oneway void)release {
//}
//
//-(instancetype)retain {
//    return singleInstance;
//}
//
//-(NSUInteger)retainCount {
//    return MAXFLOAT;
//}

@end
