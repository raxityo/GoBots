//
//  MainViewController.m
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

GameController* gameController;

#pragma mark - ViewController Lifecycle

- (void) viewDidLoad
{
    [super viewDidLoad];
    gameController = [[GameController alloc] initWithGameBoard: self.gameBoard];
    gameController.delegate = self;
}

@synthesize HUDView = _HUDView;

- (void)setHUDView:(UILabel *) HUDView
{
    if (_HUDView == nil)
    {
        _HUDView = HUDView;
        self.HUDView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent: 0.7];
    }
}
- (void)didTapPlay:(UIButton *)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        [sender setHidden: YES];
    } completion:^(BOOL finished) {
        [self startGame];
    }];
}
#pragma mark - View control methods

- (void) startGame
{
    [self showAlert: @"GO!" completion:^{
        [gameController start];
    }];
}

- (void) updateScores
{
    self.robotAScoreLabel.text = @(gameController.robotA.score).stringValue;
    self.robotBScoreLabel.text = @(gameController.robotB.score).stringValue;
}

- (void) showVictoryMessage: (Robot *) winner
                 completion: (void (^)(void))completion
{
    UILabel* messageLabel = winner == gameController.robotA
        ? self.victoryMessageRobotA
        : self.victoryMessageRobotB;

    messageLabel.text = [MessageUtil getRandomVictoryMessage];
    [self fadeInLabel: messageLabel
           completion: completion];

}

- (void) showAlert: (NSString*) message
        completion: (void (^)(void))completion
{
    self.HUDView.text = message;
    [self fadeInLabel: self.HUDView
           completion: completion];
}

- (void) fadeInLabel: (UILabel*) messageLabel
          completion: (void (^)(void))completion
{
    [UIView animateWithDuration: 0.3 animations:^{
        [messageLabel setHidden: false];
    } completion:^(BOOL finished) {

        [TimeUtility dispatchDelayed:^{
            [UIView animateWithDuration: 0.3 animations: ^{
                [messageLabel setHidden: true];
            }];

            completion();
        } after: ROUNDS_DELAY];
    }];
}

#pragma mark - GameControllerDelegate

- (void) gameControllerDidFinishRoundWithWinner:(Robot *) winner
{
    [self updateScores];
    [self showVictoryMessage: winner completion:^{
        [gameController restart];
    }];
}

- (void) gameControllerDidDraw: (int) drawCount
{
    [self showAlert:@"DRAW!" completion:^{
        self.drawCountLabel.text = [NSString stringWithFormat:@"Draw: %d", drawCount ];
        [gameController restart];
    }];
}
@end
