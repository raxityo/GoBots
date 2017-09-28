//
//  GameEngine.m
//  GoBots
//
//  Created by Rax on 9/3/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import "GameEngine.h"

@implementation GameEngine

+ (Position*) getNextPositionFromCell:(CellView*) fromCell
                               toCell:(CellView*) toCell
{
    NSMutableArray* resultPath;
    // Pick right algorithm.
    if (ALGORITHM_HAMILTON) {
        resultPath = [[self getHamiltonPathForCell: fromCell
                                           toCell: toCell
                                         withPath: [NSMutableArray arrayWithObject:fromCell]
                      ] mutableCopy];
        // Remove source from the result path
        [resultPath removeObject: fromCell];
        if (resultPath.count > 0)
            return ((CellView*) resultPath[0]).position;
        else
            return nil;
    } else {
        fromCell.distance = 0;
        [self computeDistanceFromCell: (CellView*) fromCell
                               toCell: (CellView*) toCell];

        if (toCell.distance != -1) {
            CellView* tmpCell = toCell;
            while (true)
                if(tmpCell.fromCell == fromCell)
                    return tmpCell.position;
                else
                    tmpCell = tmpCell.fromCell;
        }
        else
            return nil;
    }
}

+ (NSArray*) getHamiltonPathForCell:(CellView*) cell
                             toCell:(CellView*) tokenCell
                           withPath:(NSMutableArray*) path {
    // If we are at the destination, add current path to shortest paths array
    if ([cell isEqual: tokenCell])
        return path;
    else
        // Go through each visitable neighbours
        for(CellView* neighbour in cell.neighbours)
        {
            // If the neighbour has not been visited:
            if (![path containsObject: neighbour]) {
                // Add neighbour to the path
                NSMutableArray *newPath = [[path arrayByAddingObject:neighbour] mutableCopy];

                // Find shortest path from this neighbour to the destination cell.
                NSArray *shortestPath = [self getHamiltonPathForCell: neighbour
                                                              toCell: tokenCell
                                                            withPath: newPath];

                // If we found a path, then add path in result set.
                if (shortestPath.count > 0) {
                    return shortestPath;
                }
            }
        }
    return nil;
}

+(void) computeDistanceFromCell: (CellView*) fromCell
                         toCell: (CellView*) toCell
{
    NSMutableArray* neighboursArray = [NSMutableArray arrayWithObject: fromCell];

    while (neighboursArray.count > 0) {
        CellView* cell = neighboursArray[0];
        if (cell == toCell)
            return;

        [neighboursArray removeObject: cell];

        for (CellView* neighbour in cell.neighbours)
            if(neighbour.distance == -1) {
                neighbour.distance = cell.distance + 1;
                neighbour.fromCell = cell;
                [neighboursArray addObject: neighbour];
            }
    }
}
@end
