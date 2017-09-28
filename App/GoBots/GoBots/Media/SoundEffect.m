//
//  SoundEffect.m
//  GoBots
//
//  Created by Rax on 9/3/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import "SoundEffect.h"

@implementation SoundEffect

- (SoundEffect*) initWithSoundNamed: (NSString *)filename
{
    if ((self = [super init]))
    {
        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        if (fileURL != nil)
        {
            SystemSoundID theSoundID;
            OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileURL, &theSoundID);
            if (error == kAudioServicesNoError)
                soundID = theSoundID;
        }
    }
    return self;
}

- (void) dealloc
{
    AudioServicesDisposeSystemSoundID(soundID);
}

- (void) play
{
    AudioServicesPlaySystemSound(soundID);
}
@end
