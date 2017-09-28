//
//  MessageUtil.m
//  GoBots
//
//  Created by Rax on 9/3/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import "MessageUtil.h"

@implementation MessageUtil

NSArray* messages;
+(NSString*) getRandomVictoryMessage
{
    if (messages == nil) {
        messages = @[
                     @"Winner Winner Chicken Dinner!",
                     @"Umm... The smell of victory!",
                     @"The winner is... ME!",
                     @"Take that, !winner."];
    }
    return messages[arc4random_uniform((int) messages.count - 1)];
}
@end
