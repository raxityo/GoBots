//
//  Robot.m
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import "Robot.h"

@implementation Robot

- (BoardObject*) initWithIdentifier: (NSString*) identifier
                                 at: (Position*) position
                              color: (UIColor*) color
                          tailColor: (UIColor*) tailColor
{
    self = [super initWithIdentifier: identifier at: position color: color];
    self.score = 0;
    self.tailColor = tailColor;
    initialPosition = position;
    return self;
}

@synthesize tail = _tail;
- (BoardObject*) tail
{
    return [[BoardObject alloc]
            initWithIdentifier: self.identifier
            at: self.position
            color: self.tailColor
            ];
}

@synthesize moveSound = _moveSound;
-(SoundEffect*) moveSound
{
    if (_moveSound == nil)
    {
        _moveSound = [[SoundEffect alloc]
                      initWithSoundNamed: [NSString
                                           stringWithFormat: @"sound_%@.wav", self.identifier
                                           ]
                      ];
    }
    return _moveSound;
}

@synthesize winSound = _winSound;
-(SoundEffect*) winSound
{
    if (_winSound == nil)
    {
        _winSound = [[SoundEffect alloc]
                      initWithSoundNamed: [NSString
                                           stringWithFormat: @"sound_win_%@.wav", self.identifier
                                           ]
                      ];
    }
    return _winSound;
}

- (void) reset
{
    self.position = initialPosition;
}

- (void) celebrateVictory
{
    self.score++;
    [self.winSound play];
}
@end
