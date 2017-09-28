//
//  MainViewController.h
//  GoBots
//
//  Created by Rax on 9/2/17.
//  Copyright © 2017 The Tech Time. All rights reserved.
//

#import "GameController.h"
#import "GameBoardView.h"
#import "MessageUtil.h"
#import "SoundEffect.h"

@interface MainViewController : UIViewController <GameControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *robotAScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *robotBScoreLabel;
@property (weak, nonatomic) IBOutlet GameBoardView *gameBoard;
@property (weak, nonatomic) IBOutlet UILabel *victoryMessageRobotA;
@property (weak, nonatomic) IBOutlet UILabel *victoryMessageRobotB;
@property (weak, nonatomic) IBOutlet UILabel *HUDView;
@property (weak, nonatomic) IBOutlet UILabel *drawCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
- (IBAction)didTapPlay:(UIButton *)sender;
@end
