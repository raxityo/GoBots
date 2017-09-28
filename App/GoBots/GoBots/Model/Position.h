//
//  Position.h
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

@class Position;

@interface Position : NSObject
@property (nonatomic, readonly) int column;
@property (nonatomic, readonly) int row;

@property (nonatomic, readonly) Position* left;
@property (nonatomic, readonly) Position* top;
@property (nonatomic, readonly) Position* right;
@property (nonatomic, readonly) Position* bottom;

- (Position*) initWithRow: (int) row
                   column: (int) column;

@end

Position* PositionMake(int row, int col);
