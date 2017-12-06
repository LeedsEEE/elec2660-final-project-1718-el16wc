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

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *HighScoreName = @"N/A";
    NSInteger HighScore = 0;
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
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
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
    
    self.ScoreNumber1.text = [NSString stringWithFormat:@"1. %@ -- %ld",TopPlayer,TopScore];
    self.ScoreNumber2.text = [NSString stringWithFormat:@"2. %@ -- %ld",SecondPlayer,SecondScore];
    self.ScoreNumber3.text = [NSString stringWithFormat:@"3. %@ -- %ld",ThirdPlayer,ThirdScore];
    self.ScoreNumber4.text = [NSString stringWithFormat:@"4. %@ -- %ld",FourthPlayer,FourthScore];
    self.ScoreNumber5.text = [NSString stringWithFormat:@"5. %@ -- %ld",FifthPlayer,FifthScore];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)StartGame:(UIButton *)sender {
    PlayerData *data = [PlayerData sharedInstance];
    [data setPlayerName:self.PlayerNameTextField.text ];
    [data setMaxHP:50];
    [data setHP:50];
    [data setScore:0];
    [data setAttackPower:15];
    [data setCoins:50];
}


- (IBAction)Instructions:(UIButton *)sender {
}

- (IBAction)ResetScores:(UIButton *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *HighScoreName = @"N/A";
    NSInteger HighScore = 0;
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
