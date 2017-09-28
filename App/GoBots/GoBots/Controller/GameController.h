//
//  GameController.h
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameBoardView.h"
#import "GameEngine.h"

@protocol GameControllerDelegate<NSObject>
- (void) gameControllerDidFinishRoundWithWinner: (Robot*) winner;
- (void) gameControllerDidDraw: (int) drawCount;
@end

@interface GameController : NSObject <GameBoardViewDelegate>
{
    GameBoardView* gameBoard;
}

#pragma Properties
@property(nonatomic, readwrite) Robot* nextMover;
@property(nonatomic, readwrite) Robot* robotA;
@property(nonatomic, readwrite) Robot* robotB;
@property(nonatomic, readwrite) BoardObject* prizeToken;
@property(weak,nonatomic)id <GameControllerDelegate> delegate;

#pragma Public methods

- (GameController* ) initWithGameBoard: (GameBoardView *) board;
- (void) start;
- (void) restart;

@end
