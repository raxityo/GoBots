//
//  SoundEffect.h
//  GoBots
//
//  Created by Rax on 9/3/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>

@interface SoundEffect : NSObject
{
    SystemSoundID soundID;
}

- (SoundEffect*) initWithSoundNamed: (NSString *)filename;
- (void) play;

@end
