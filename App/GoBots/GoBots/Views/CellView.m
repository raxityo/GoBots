//
//  CellView.m
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import "CellView.h"

@implementation CellView
@synthesize object = _object;

- (CellView* ) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame: frame];
    [self reset];
    [self addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self action: @selector(handleTap:)]];
    return self;
}

- (void) reset
{
    self.object = nil;
    self.neighbours = [NSMutableArray array];
    self.distance = -1;
    self.fromCell = nil;
}

- (void) setObject:(BoardObject *) object
{
    // Clear cell
    if (object == nil)
    {
        _object = nil;
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderColor = [[UIColor cellBorderColor] CGColor];
        self.layer.borderWidth = 0.5;
        self.layer.cornerRadius = self.frame.size.height / 2;
    }
    // Set main object if
    // - Current object is not assigned yet.
    // - New object has same identifier as current object.
    else if (_object == nil || object.identifier == _object.identifier)
    {
        _object = object;
        self.backgroundColor = self.object.color;
        self.layer.borderColor = [[UIColor clearColor] CGColor];
    }
    // Set overlay object
    else {
        self.layer.borderColor = [object.color CGColor];
        self.layer.borderWidth = self.frame.size.height * 0.2;
    }
}

- (void) handleTap:(UITapGestureRecognizer *)recognizer
{
    [self.delegate didTapCell: self];
}

# pragma -mark NSObject

- (BOOL) isEqual: (id)object
{
    if( ![object isKindOfClass: [CellView class]])
    {
        return false;
    }
    return [self isEqualToCell: object];
}

- (BOOL) isEqualToCell: (CellView*) cell
{
    return cell == self ||
    (cell != nil && [cell.position isEqual:self.position]);
}
@end
