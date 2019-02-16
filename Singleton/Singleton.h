//
//  Singleton.h
//  OCDemo
//
//  Created by yuanping on 2019/2/16.
//  Copyright © 2019年 yuanping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject<NSCopying, NSMutableCopying>

+ (Singleton *)sharedInstance;

@end

