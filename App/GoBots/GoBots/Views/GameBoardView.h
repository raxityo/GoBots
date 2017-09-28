//
//  GameBoardView.h
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import "CellView.h"
@class GameBoardView;
@protocol GameBoardViewDelegate <NSObject>
- (void) gameBoardViewDidSelectEmptyPosition: (Position*) position;
@end

@interface GameBoardView : UIView <CellViewDelegate>

@property (nonatomic, readwrite) id <GameBoardViewDelegate> delegate;
- (void) reset;
- (void) putObject: (BoardObject*) object;
- (void) removeObject: (BoardObject*) object;
- (CellView *) cellAtPosition: (Position*) position;
@end
