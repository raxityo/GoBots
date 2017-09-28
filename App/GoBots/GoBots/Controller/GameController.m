//
//  GameController.m
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import "GameController.h"

@implementation GameController
@synthesize robotA = _robotA;
@synthesize robotB = _robotB;
@synthesize prizeToken = _prizeToken;

// Pointer to robot who has next turn.
Robot *nextMover;

// No of times we had a tie.
int drawCount;

- (Robot*) robotA
{
    if (_robotA == nil) {
        _robotA = [[Robot alloc]
                   initWithIdentifier: IDENTIFIER_A
                   at: PositionMake(BOARD_SIZE - 1, 0)
                   color: [UIColor robotColorBlue]
                   tailColor: [UIColor robotColorBlueSecondary]
                   ];
    }
    return _robotA;
}

- (Robot*) robotB
{
    if (_robotB == nil) {
        _robotB = [[Robot alloc]
                   initWithIdentifier: IDENTIFIER_B
                   at: PositionMake(0, BOARD_SIZE - 1)
                   color:[UIColor robotColorRed]
                   tailColor: [UIColor robotColorRedSecondary]
                   ];
    }
    return _robotB;
}
- (BoardObject*) prizeToken
{
    if (_prizeToken == nil) {
        _prizeToken = [[BoardObject alloc]
                       initWithIdentifier: IDENTIFIER_PRIZE
                       at: [self getRandomPosition]
                       color: [UIColor prizeTokenColor]
                       ];
    }
    return _prizeToken;
}

-(GameController* ) initWithGameBoard: (GameBoardView *) board
{
    self = [super init];
    gameBoard = board;
    gameBoard.delegate = self;
    nextMover = self.robotA;
    return self;
}

-(void) start
{
    [gameBoard putObject: self.robotA];
    [gameBoard putObject: self.robotB];
    [gameBoard putObject: self.prizeToken];
    [TimeUtility dispatchDelayed:^{
        [self moveNext];
    } after: MOVE_DELAY];
}

-(void) restart
{
    [self reset];
    [self start];
}

-(void) reset
{
    [self.robotA reset];
    [self.robotB reset];
    self.prizeToken = nil;
    [gameBoard reset];
}

-(BOOL) isGameOver
{
    return [nextMover.position isEqual: self.prizeToken.position];
}

- (void) moveNext
{
    CellView* nextCell = [gameBoard cellAtPosition:nextMover.position];
    CellView* tokenCell = [gameBoard cellAtPosition: self.prizeToken.position];
    Position* nextPosition = [GameEngine getNextPositionFromCell: nextCell toCell: tokenCell];

    if (nextPosition != nil) {
        nextMover.isBlocked = false;
        [gameBoard putObject: nextMover.tail];
        nextMover.position = nextPosition;
        [gameBoard putObject: nextMover];
        [nextMover.moveSound play];

        if ([self isGameOver]) {
            [nextMover celebrateVictory];
            [self.delegate gameControllerDidFinishRoundWithWinner: nextMover];
            [self switchTurns];
        } else {
            // Schedule next move after MOVE_DELAY.
            [self switchTurns];
            [TimeUtility dispatchDelayed:^{
                [self moveNext];
            } after: MOVE_DELAY];
        }
        return;
    }

    nextMover.isBlocked = true;
    [self switchTurns];

    if(nextMover.isBlocked)
    {
        drawCount++;
        [self.delegate gameControllerDidDraw: drawCount];
    }
    else
    {
        [self moveNext];
    }
}

- (void) switchTurns
{
    nextMover = [self opponent];
}

- (Robot*) opponent
{
    return nextMover.identifier == self.robotA.identifier ? self.robotB : self.robotA;
}

- (Position*) getRandomPosition
{
    Position* position = PositionMake(arc4random_uniform(BOARD_SIZE - 1), arc4random_uniform(BOARD_SIZE - 1));
    if ([gameBoard cellAtPosition: position].object == nil)
        return position;
    else
        return [self getRandomPosition];
}

# pragma - mark GameBoardViewDelegate
-(void)gameBoardViewDidSelectEmptyPosition: (Position *)position
{
    [gameBoard removeObject: self.prizeToken];
    self.prizeToken.position = position;
    [gameBoard putObject: self.prizeToken];
}
@end
