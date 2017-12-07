//
//  MenuController.m
//  Project
//
//  Created by William Carne [el16wc] on 21/11/2017.
//  Copyright © 2017 William Carne [el16wc]. All rights reserved.
//

#import "MenuController.h"

@interface MenuController ()

@end

@implementation MenuController

#pragma mark view setup
- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];//accessing user defaults
    
    //initialising default values to replace nuls in the userdefaults.
    NSString *HighScoreName = @"N/A";
    NSInteger HighScore = 0;
    
    //checking for nuls in the userdefaults for the keys being used and replacing them with the default values created
    if([defaults objectForKey:@"TopPlayer"] == nil){
        [defaults setObject:HighScoreName forKey:@"TopPlayer"];
        [defaults setInteger:HighScore forKey:@"TopScore"];
        [defaults synchronize];
    }
    if([defaults objectForKey:@"SecondPlayer"] == nil){
        [defaults setObject:HighScoreName forKey:@"SecondPlayer"];
        [defaults setInteger:HighScore forKey:@"SecondScore"];
        [defaults synchronize];
    }
    if([defaults objectForKey:@"ThirdPlayer"] == nil){
        [defaults setObject:HighScoreName forKey:@"ThirdPlayer"];
        [defaults setInteger:HighScore forKey:@"ThirdScore"];
        [defaults synchronize];
    }
    if([defaults objectForKey:@"FourthPlayer"] == nil){
        [defaults setObject:HighScoreName forKey:@"FourthPlayer"];
        [defaults setInteger:HighScore forKey:@"FourthScore"];
        [defaults synchronize];
    }
    if([defaults objectForKey:@"FifthPlayer"] == nil){
        [defaults setObject:HighScoreName forKey:@"FifthPlayer"];
        [defaults setInteger:HighScore forKey:@"FifthScore"];
        [defaults synchronize];
    }
    
    //creating variables from the stored values stored in userdefaults
    NSInteger TopScore = [defaults integerForKey:@"TopScore"];
    NSInteger SecondScore = [defaults integerForKey:@"SecondScore"];
    NSInteger ThirdScore = [defaults integerForKey:@"ThirdScore"];
    NSInteger FourthScore = [defaults integerForKey:@"FourthScore"];
    NSInteger FifthScore = [defaults integerForKey:@"FifthScore"];
    NSString *TopPlayer = [defaults stringForKey:@"TopPlayer"];
    NSString *SecondPlayer = [defaults stringForKey:@"SecondPlayer"];
    NSString *ThirdPlayer = [defaults stringForKey:@"ThirdPlayer"];
    NSString *FourthPlayer = [defaults stringForKey:@"FourthPlayer"];
    NSString *FifthPlayer = [defaults stringForKey:@"FifthPlayer"];
    
    //setting the scoreboard label's text using the variables created from userdefaults
    self.ScoreNumber1.text = [NSString stringWithFormat:@"1. %@ -- %ld",TopPlayer,TopScore];
    self.ScoreNumber2.text = [NSString stringWithFormat:@"2. %@ -- %ld",SecondPlayer,SecondScore];
    self.ScoreNumber3.text = [NSString stringWithFormat:@"3. %@ -- %ld",ThirdPlayer,ThirdScore];
    self.ScoreNumber4.text = [NSString stringWithFormat:@"4. %@ -- %ld",FourthPlayer,FourthScore];
    self.ScoreNumber5.text = [NSString stringWithFormat:@"5. %@ -- %ld",FifthPlayer,FifthScore];
}

-(void)viewDidAppear:(BOOL)animated{
    //creating variables from the stored values stored in userdefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger TopScore = [defaults integerForKey:@"TopScore"];
    NSInteger SecondScore = [defaults integerForKey:@"SecondScore"];
    NSInteger ThirdScore = [defaults integerForKey:@"ThirdScore"];
    NSInteger FourthScore = [defaults integerForKey:@"FourthScore"];
    NSInteger FifthScore = [defaults integerForKey:@"FifthScore"];
    NSString *TopPlayer = [defaults stringForKey:@"TopPlayer"];
    NSString *SecondPlayer = [defaults stringForKey:@"SecondPlayer"];
    NSString *ThirdPlayer = [defaults stringForKey:@"ThirdPlayer"];
    NSString *FourthPlayer = [defaults stringForKey:@"FourthPlayer"];
    NSString *FifthPlayer = [defaults stringForKey:@"FifthPlayer"];
    
    //setting the scoreboard label's text using the variables created from userdefaults
    self.ScoreNumber1.text = [NSString stringWithFormat:@"1. %@ -- %ld",TopPlayer,TopScore];
    self.ScoreNumber2.text = [NSString stringWithFormat:@"2. %@ -- %ld",SecondPlayer,SecondScore];
    self.ScoreNumber3.text = [NSString stringWithFormat:@"3. %@ -- %ld",ThirdPlayer,ThirdScore];
    self.ScoreNumber4.text = [NSString stringWithFormat:@"4. %@ -- %ld",FourthPlayer,FourthScore];
    self.ScoreNumber5.text = [NSString stringWithFormat:@"5. %@ -- %ld",FifthPlayer,FifthScore];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark Button setup

- (IBAction)StartGame:(UIButton *)sender {
    //sets the base values for the playerdata before transistioning to the game/shop view
    PlayerData *data = [PlayerData sharedInstance];
    [data setPlayerName:self.PlayerNameTextField.text ];
    [data setMaxHP:50];
    [data setHP:50];
    [data setScore:0];
    [data setAttackPower:15];
    [data setCoins:50];
}


- (IBAction)Instructions:(UIButton *)sender {
    //any additional setup before transistion to instructions tab to be done here
}

- (IBAction)ResetScores:(UIButton *)sender {
    //method Resets all values stored in userdefaults for the keys being used and then updates the score labels
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];//accessing user defaults
    
    //setting the values to reset to
    NSString *HighScoreName = @"N/A";
    NSInteger HighScore = 0;
    
    //setting the values in userdefaults to the reset values
    [defaults setObject:HighScoreName forKey:@"TopPlayer"];
    [defaults setInteger:HighScore forKey:@"TopScore"];
    [defaults setObject:HighScoreName forKey:@"SecondPlayer"];
    [defaults setInteger:HighScore forKey:@"SecondScore"];
    [defaults setObject:HighScoreName forKey:@"ThirdPlayer"];
    [defaults setInteger:HighScore forKey:@"ThirdScore"];
    [defaults setObject:HighScoreName forKey:@"FourthPlayer"];
    [defaults setInteger:HighScore forKey:@"FourthScore"];
    [defaults setObject:HighScoreName forKey:@"FifthPlayer"];
    [defaults setInteger:HighScore forKey:@"FifthScore"];
    [defaults synchronize];
    
    //setting the score labels
    NSInteger TopScore = [defaults integerForKey:@"TopScore"];
    NSInteger SecondScore = [defaults integerForKey:@"SecondScore"];
    NSInteger ThirdScore = [defaults integerForKey:@"ThirdScore"];
    NSInteger FourthScore = [defaults integerForKey:@"FourthScore"];
    NSInteger FifthScore = [defaults integerForKey:@"FifthScore"];
    NSString *TopPlayer = [defaults stringForKey:@"TopPlayer"];
    NSString *SecondPlayer = [defaults stringForKey:@"SecondPlayer"];
    NSString *ThirdPlayer = [defaults stringForKey:@"ThirdPlayer"];
    NSString *FourthPlayer = [defaults stringForKey:@"FourthPlayer"];
    NSString *FifthPlayer = [defaults stringForKey:@"FifthPlayer"];
    
    self.ScoreNumber1.text = [NSString stringWithFormat:@"1. %@ -- %ld",TopPlayer,TopScore];
    self.ScoreNumber2.text = [NSString stringWithFormat:@"2. %@ -- %ld",SecondPlayer,SecondScore];
    self.ScoreNumber3.text = [NSString stringWithFormat:@"3. %@ -- %ld",ThirdPlayer,ThirdScore];
    self.ScoreNumber4.text = [NSString stringWithFormat:@"4. %@ -- %ld",FourthPlayer,FourthScore];
    self.ScoreNumber5.text = [NSString stringWithFormat:@"5. %@ -- %ld",FifthPlayer,FifthScore];
}
@end
