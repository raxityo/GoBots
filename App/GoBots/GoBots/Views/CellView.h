//
//  CellView.h
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//
@class CellView;

@protocol CellViewDelegate<NSObject>
- (void) didTapCell: (CellView*) cell;
@end

@interface CellView : UIView
@property(nonatomic, readwrite) BoardObject* object;
@property(nonatomic, readwrite) Position* position;
@property(nonatomic, readwrite)id <CellViewDelegate> delegate;
@property (strong, nonatomic) NSMutableArray* neighbours;

@property(nonatomic, readwrite) int distance;
@property(nonatomic, readwrite) CellView* fromCell;
- (void) reset;
@end

@interface CellConnection: NSObject
@property (strong, nonatomic) CellView *cell;
@property (assign, nonatomic) CGFloat weight;
@end
