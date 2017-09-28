//
//  TimeUtility.h
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtility : NSObject
+ (void) dispatchDelayed: (void(^)(void))callback after: (double)delayInSeconds;
@end
