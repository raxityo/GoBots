//
//  BoardObject.m
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import "BoardObject.h"

@implementation BoardObject

- (BoardObject*) initWithIdentifier: (NSString*) identifier
                                 at: (Position*) position
                              color: (UIColor*) color
{
    self = [super init];
    self.identifier = identifier;
    self.position = position;
    self.color = color;
    return self;
}
@end
