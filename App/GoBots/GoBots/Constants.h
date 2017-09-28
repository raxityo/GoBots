//
//  Constants.h
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

// Application Constants
// Size of game board.
// The game board size must be even to form Hamiltonian cycle.
// I mean, it will work but it's kinda funny to see the robot getting stuck 🤷🏼‍♂️
#define BOARD_SIZE          8

// Use Hamilton algorithm to try to create Hamiltonian cycle.
// It's boring but never fails 🙅‍♂️
#define ALGORITHM_HAMILTON  NO


// Board Object identifiers
#define IDENTIFIER_A        @"A"
#define IDENTIFIER_B        @"B"
#define IDENTIFIER_PRIZE    @"$"

// Time Constants

#define MOVE_DELAY          .5
#define ROUNDS_DELAY        0.5

#endif /* Constants_h */
