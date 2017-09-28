//
//  Position.m
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Position.h"

@implementation Position

- (Position*) initWithRow:(int)row
                   column:(int)column
{
    self = [super init];
    _row = row;
    _column = column;
    return self;
}

@synthesize left = _left;
-(Position *)left
{
    return PositionMake(self.row, self.column - 1);
}

@synthesize right = _right;
-(Position *)right
{
    return PositionMake(self.row, self.column + 1);
}

@synthesize top = _top;
-(Position *)top
{
    return PositionMake(self.row - 1, self.column);
}


@synthesize bottom = _bottom;
-(Position *)bottom
{
    return PositionMake(self.row + 1, self.column);
}

#pragma mark - Custom Equality

-(BOOL) isEqualToPosition: (Position*) position
{
    return self.row == position.row &&
    self.column == position.column;
}


#pragma mark - NSObject

-(BOOL)isEqual:(id)object {
    if (self == object)
    {
        return YES;
    }

    if (![object isKindOfClass: [Position class]])
    {
        return NO;
    }
    return [self isEqualToPosition: object];
}

-(NSUInteger) hash
{
    return self.row * BOARD_SIZE + self.column;
}

@end

Position* PositionMake(int row, int col)
{
    return [[Position alloc] initWithRow:row column:col];
}
