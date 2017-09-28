//
//  GameBoardView.m
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import "GameBoardView.h"

@implementation GameBoardView

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Figure out size of each cell
    // Have 5pt space between the cells
    double cellSize = (self.bounds.size.width / BOARD_SIZE);

    // N^2 loop to put the N^2 cells.
    for (int row = 0; row < BOARD_SIZE; row++) {
        for (int col = 0; col < BOARD_SIZE; col++) {
            CellView* cell = [[CellView alloc]
                               initWithFrame: CGRectMake(
                                                         (col * cellSize) + 2.5,
                                                         (row * cellSize) + 2.5,
                                                         cellSize - 2.5,
                                                         cellSize - 2.5
                                                        )
                            ];
            cell.position = PositionMake(row, col);
            cell.delegate = self;
            [self addSubview: cell];
        }
    }
}

- (void) reset
{
    for(CellView* cell in self.subviews)
        [cell reset];
}

- (void) putObject: (BoardObject*) object
{
    [self cellAtPosition: object.position].object = object;
    [self updateCellNeighbours];
}

- (void) removeObject: (BoardObject*) object
{
    [self cellAtPosition: object.position].object = nil;
    [self updateCellNeighbours];
}

- (CellView *) cellAtPosition: (Position*) position
{
    // Using index instead of View Tags to avoid confusion with index 0 vs default tag 0.
    if (position.row >= BOARD_SIZE || position.column >= BOARD_SIZE)
        return nil;
    if (position.row < 0 || position.column < 0)
        return nil;

    int index = [self indexForPosition: position];
    if (index < self.subviews.count) {
        return ((CellView* ) self.subviews[index]);
    } else {
        return nil;
    }
}

- (int) indexForPosition:(Position*) position {
    return position.row * BOARD_SIZE + position.column;
}

-(void) updateCellNeighbours {
    // Traverse through all cells
    for (CellView* cell in self.subviews) {
        [cell.neighbours removeAllObjects];
        cell.distance = -1;

        // Look around in all directions
        for (Position* direction in @[
                                      cell.position.top,
                                      cell.position.bottom,
                                      cell.position.left,
                                      cell.position.right,
                                    ])
        {
            // If there is a neighbour and the neighbour is free,
            // Build the relationship with the neighbour.
            CellView* neighbour = [self cellAtPosition: direction];
            if (neighbour != nil &&
                (neighbour.object == nil || [neighbour.object.identifier isEqualToString: IDENTIFIER_PRIZE]) &&
                ![cell.neighbours containsObject:neighbour])
            {
                [cell.neighbours addObject: neighbour];
            }
        }


    }

}

# pragma - mark CellViewDelegate

- (void)didTapCell: (CellView*) cell
{
    if (cell.object == nil) {
        [self.delegate gameBoardViewDidSelectEmptyPosition: cell.position];
    }
}

@end
