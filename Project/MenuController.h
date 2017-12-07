//
//  MenuController.h
//  Project
//
//  Created by William Carne [el16wc] on 21/11/2017.
//  Copyright © 2017 William Carne [el16wc]. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerData.h"

@interface MenuController : UIViewController <UITextFieldDelegate>

- (IBAction)StartGame:(UIButton *)sender;//Sends player to the next view staring the game

//creating the outlet for the textfield
@property (weak, nonatomic) IBOutlet UITextField *PlayerNameTextField;

//creating outlets for all labels within the view (scoreboard labels)
@property (weak, nonatomic) IBOutlet UILabel *ScoreNumber1;
@property (weak, nonatomic) IBOutlet UILabel *ScoreNumber2;
@property (weak, nonatomic) IBOutlet UILabel *ScoreNumber3;
@property (weak, nonatomic) IBOutlet UILabel *ScoreNumber4;
@property (weak, nonatomic) IBOutlet UILabel *ScoreNumber5;

//Buttons to reset score table and show intructions view
- (IBAction)Instructions:(UIButton *)sender;
- (IBAction)ResetScores:(UIButton *)sender;

@end
