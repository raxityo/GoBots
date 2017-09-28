//
//  UIColor+GoBotsColor
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import "UIColor+GoBotsColor.h"

@implementation UIColor (GoBotsColor)

+ (UIColor *) cellBorderColor
{
    return [UIColor colorWithRed: .75 green: .75 blue: .75 alpha: 1];
}

+ (UIColor *) prizeTokenColor
{
    return [UIColor colorWithRed: (76.0f/255.0f) green: (217.0f/255.0f) blue: (100.0f/255.0f) alpha: 1];
}

+ (UIColor *) robotColorRed
{
    return [UIColor colorWithRed: 1 green: (45.0f/255.0f) blue: (85.0f/255.0f) alpha: 1];
}

+ (UIColor *) robotColorRedSecondary
{
    return [[UIColor robotColorRed] colorWithAlphaComponent: 0.4];
}

+ (UIColor *) robotColorBlue
{
    return [UIColor colorWithRed: (90.0f/255.0f) green: (200.0f/255.0f) blue: (250.0f/255.0f) alpha: 1];
}

+ (UIColor *) robotColorBlueSecondary
{
    return [[UIColor robotColorBlue] colorWithAlphaComponent: 0.4];
}
@end
