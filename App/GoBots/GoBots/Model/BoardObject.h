//
//  BoardObject.h
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

@interface BoardObject : NSObject

@property (nonatomic, readwrite) NSString* identifier;
@property (nonatomic, readwrite) Position* position;
@property (nonatomic, readwrite) UIColor* color;

# pragma Public Constructor

- (BoardObject*) initWithIdentifier: (NSString*) identifier
                                 at: (Position*) position
                              color: (UIColor*) color;

@end
