//
//  GameEngine.h
//  GoBots
//
//  Created by Rax on 9/3/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CellView.h"

@interface GameEngine : NSObject
+ (Position*) getNextPositionFromCell:(CellView*) fromCell
                               toCell:(CellView*) toCell;
@end
