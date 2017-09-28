//
//  TimeUtility.m
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import "TimeUtility.h"

@implementation TimeUtility
+ (void) dispatchDelayed: (void(^)(void))callback after: (double) delay
{

    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        if(callback){
            callback();
        }
    });
}
@end
