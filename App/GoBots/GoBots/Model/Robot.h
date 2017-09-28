//
//  Robot.h
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import "BoardObject.h"
#import "SoundEffect.h"

@interface Robot : BoardObject
{
    Position* initialPosition;
}

@property (nonatomic, readwrite) int score;
@property (nonatomic, readwrite) UIColor* tailColor;
@property (nonatomic, readonly) BoardObject* tail;
@property (nonatomic, readwrite) BOOL isBlocked;
@property (nonatomic, readonly) SoundEffect* moveSound;
@property (nonatomic, readonly) SoundEffect* winSound;

# pragma Public Constructor

- (BoardObject*) initWithIdentifier: (NSString*) identifier
                                 at: (Position*) position
                              color: (UIColor*) color
                          tailColor: (UIColor*) tailColor;

- (void) reset;
- (void) celebrateVictory;
@end
