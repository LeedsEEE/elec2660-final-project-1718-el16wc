//
//  SecondViewController.m
//  Project
//
//  Created by William Carne [el16wc] on 21/11/2017.
//  Copyright © 2017 William Carne [el16wc]. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

#pragma mark Initial setup
- (void)viewDidLoad {
    [super viewDidLoad];
    PlayerData *data = [PlayerData sharedInstance];//accesssing the sharedinstance of the player data model
    
    //setting initial values for the games variables
    _Level = 1;
    _MonsterHP = 100;
    _MonsterHPMax = 100;
    _MonsterAttack = 10;
    _Monstertype = 1;
    _ButtonState = 0;
    
    //setting the positions of the buttons and images in the encounter choosing section
    //getting the width and height of the screen
    CGRect Screen = [[UIScreen mainScreen] bounds];
    float ScreenWidth = CGRectGetWidth(Screen);
    float ScreenHeight = CGRectGetHeight(Screen);
    
    //creating a copy of the images frame, editing its size and position relative to the screen
    CGRect Enemyindicator1Frame = [self.EnemyIndicator1 frame];
    Enemyindicator1Frame.origin.x = 0.25*ScreenWidth-64;
    Enemyindicator1Frame.origin.y = 0.75*ScreenHeight-64;
    CGRect Enemyindicator2Frame = [self.EnemyIndicator2 frame];
    Enemyindicator2Frame.origin.x = 0.75*ScreenWidth-64;
    Enemyindicator2Frame.origin.y = 0.75*ScreenHeight-32;
    CGRect SelectEnemyType1OutletFrame = [self.SelectEnemyType1Outlet frame];
    SelectEnemyType1OutletFrame.origin.x = 0.25*ScreenWidth-128;
    SelectEnemyType1OutletFrame.origin.y = 0.4*ScreenHeight-128;
    CGRect SelectEnemyType2OutletFrame = [self.SelectEnemyType2Outlet frame];
    SelectEnemyType2OutletFrame.origin.x = 0.75*ScreenWidth-128;
    SelectEnemyType2OutletFrame.origin.y = 0.4*ScreenHeight-128;
    //setting the image frames to be the same as the ones created
    [self.EnemyIndicator1 setFrame:Enemyindicator1Frame];
    [self.EnemyIndicator2 setFrame:Enemyindicator2Frame];
    [self.SelectEnemyType1Outlet setFrame:SelectEnemyType1OutletFrame];
    [self.SelectEnemyType2Outlet setFrame:SelectEnemyType2OutletFrame];
    
    //hiding labels and buttons not yet in use
    self.ReturnToMenuOutlet.hidden = 1;
    self.FinalScoreLabel.hidden = 1;
    self.CurrentScoreLabel.hidden = 0;
    
    //setting the position of the score label relative to the screen size
    CGRect CurrentScoreFrame = [self.CurrentScoreLabel frame];
    CurrentScoreFrame.origin.x = ScreenWidth*0.5-100;
    CurrentScoreFrame.origin.y = 0.05* ScreenHeight;
    [self.CurrentScoreLabel setFrame:CurrentScoreFrame];
    self.CurrentScoreLabel.text = [NSString stringWithFormat:@"Score : %.0f",[data Score]];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark Updating screen and moving buttons
-(void)UpdateScreen{
    //initialising data needed to update positions
    PlayerData *data = [PlayerData sharedInstance];
    CGRect Screen = [[UIScreen mainScreen] bounds];
    float ScreenWidth = CGRectGetWidth(Screen);
    float ScreenHeight = CGRectGetHeight(Screen);
    
    //Updating Timer
    CGRect TimerBarFrame = [self.TimerBar frame];
    TimerBarFrame.size.width = 10;
    TimerBarFrame.size.height = _TimeRemaining*0.5;
    TimerBarFrame.origin.x = ScreenWidth - 25;
    TimerBarFrame.origin.y = ScreenHeight/10;
    [self.TimerBar setFrame:TimerBarFrame];
    
    //updating Enemy Image position
    CGRect EnemyImageFrame = [self.EnemyImage frame];
    EnemyImageFrame.origin.x = ScreenWidth*0.45 - 128;
    EnemyImageFrame.origin.y = ScreenHeight* 0.5 - 128;
    [self.EnemyImage setFrame:EnemyImageFrame];
    
    //updating Enemy HP Bar
    float EnemyHPPercentage = _MonsterHP / _MonsterHPMax;
    CGRect EnemyHPBarFrame = [self.EnemyHPBar frame];
    if (EnemyHPPercentage >=0){
    EnemyHPBarFrame.size.width = EnemyHPPercentage * ScreenWidth * 0.8;
    }
    else{
        EnemyHPBarFrame.size.width = 0;
    }
    EnemyHPBarFrame.size.height = 25;
    EnemyHPBarFrame.origin.x = 0.1 * ScreenWidth;
    EnemyHPBarFrame.origin.y = 0.1 * ScreenHeight;
    [self.EnemyHPBar setFrame:EnemyHPBarFrame];
    CGRect EnemyHPBackgroundFrame = [self.EnemyHPBackground frame];
    EnemyHPBackgroundFrame.size.width = ScreenWidth * 0.8;
    EnemyHPBackgroundFrame.size.height = 25;
    EnemyHPBackgroundFrame.origin.x = 0.1 * ScreenWidth;
    EnemyHPBackgroundFrame.origin.y = 0.1 * ScreenHeight;
    [self.EnemyHPBackground setFrame:EnemyHPBackgroundFrame];
    self.EnemyHPBar.text = [NSString stringWithFormat:@"%.0f HP",_MonsterHP];
    
    //updating Player HP Bar
    self.PlayerHPBar.text = [NSString stringWithFormat:@"%.0f HP",[data HP]];
    CGRect PlayerHPFrame = [self.PlayerHPBar frame];
    CGRect PlayerHPBackgroundFrame = [self.PlayerHPBackground frame];
    PlayerHPBackgroundFrame.size.width = ScreenWidth * 0.8;
    PlayerHPBackgroundFrame.size.height = 25;
    PlayerHPBackgroundFrame.origin.x = 0.1 * ScreenWidth;
    PlayerHPBackgroundFrame.origin.y = 0.9 * ScreenHeight;
    [self.PlayerHPBackground setFrame:PlayerHPBackgroundFrame];
    float PlayerHP = [data HP];
    float MaxPlayerHP = [data MaxHP];
    float HPPercentage = 1;
    HPPercentage = PlayerHP/MaxPlayerHP;
    if(HPPercentage >=0){
        PlayerHPFrame.size.width = HPPercentage * ScreenWidth * 0.8;
        PlayerHPFrame.size.height = 25;
    }
    else{
        PlayerHPFrame.size.width = 0;
        PlayerHPFrame.size.height = 0;
    }
    NSLog(@"Current percentage = %.0f",HPPercentage);//shows current percentage value for debugging
    PlayerHPFrame.origin.x = 0.1 * ScreenWidth;
    PlayerHPFrame.origin.y = 0.9 * ScreenHeight;
    [self.PlayerHPBar setFrame:PlayerHPFrame];
    
    //updating the Score label
    CGRect CurrentScoreFrame = [self.CurrentScoreLabel frame];
    CurrentScoreFrame.origin.x = ScreenWidth*0.5-100;
    CurrentScoreFrame.origin.y = 0.05* ScreenHeight;
    [self.CurrentScoreLabel setFrame:CurrentScoreFrame];
    self.CurrentScoreLabel.text = [NSString stringWithFormat:@"Score : %.0f",[data Score]];
    
    
    
    //updating Button Positions
    if (_ButtonState == 0){
        [self Buttonstate0];
    }
    if (_ButtonState == 1){
        [self Buttonstate1];
    }
    if (_ButtonState == 2){
        [self Buttonstate2];
    }
    if (_ButtonState == 3){
        [self Buttonstate3];
    }
}
//These functions (Buttonstate0-Buttonstate3) are used to switch the positions of the buttons in the game between one of 4 states
-(void) Buttonstate0{
    //initialising screenwidth to allow positions to be relative to screensize
    CGRect Screen = [[UIScreen mainScreen] bounds];
    float ScreenWidth = CGRectGetWidth(Screen);
    float ScreenHeight = CGRectGetHeight(Screen);
    
    //placing buttons
    CGRect GoodButtonFrame = [self.PlayerAttackOutlet frame];
    GoodButtonFrame.origin.x = ScreenWidth * 0.1;
    GoodButtonFrame.origin.y = ScreenHeight * 0.25;
    [self.PlayerAttackOutlet setFrame:GoodButtonFrame];
    
    CGRect BadButtonFrame1 = [self.EnemyAttackOutlet1 frame];
    BadButtonFrame1.origin.x = ScreenWidth * 0.1;
    BadButtonFrame1.origin.y = ScreenHeight * 0.75;
    [self.EnemyAttackOutlet1 setFrame:BadButtonFrame1];
    
    CGRect BadButtonFrame2 = [self.EnemyAttackOutlet2 frame];
    BadButtonFrame2.origin.x = ScreenWidth * 0.7;
    BadButtonFrame2.origin.y = ScreenHeight * 0.25;
    [self.EnemyAttackOutlet2 setFrame:BadButtonFrame2];
    
    CGRect BadButtonFrame3 = [self.EnemyAttackOutlet3 frame];
    BadButtonFrame3.origin.x = ScreenWidth * 0.7;
    BadButtonFrame3.origin.y = ScreenHeight * 0.75;
    [self.EnemyAttackOutlet3 setFrame:BadButtonFrame3];
    
}


-(void) Buttonstate1{
    CGRect Screen = [[UIScreen mainScreen] bounds];
    float ScreenWidth = CGRectGetWidth(Screen);
    float ScreenHeight = CGRectGetHeight(Screen);
    
    CGRect GoodButtonFrame = [self.PlayerAttackOutlet frame];
    GoodButtonFrame.origin.x = ScreenWidth * 0.1;
    GoodButtonFrame.origin.y = ScreenHeight * 0.75;
    [self.PlayerAttackOutlet setFrame:GoodButtonFrame];
    
    CGRect BadButtonFrame1 = [self.EnemyAttackOutlet1 frame];
    BadButtonFrame1.origin.x = ScreenWidth * 0.1;
    BadButtonFrame1.origin.y = ScreenHeight * 0.25;
    [self.EnemyAttackOutlet1 setFrame:BadButtonFrame1];
    
    CGRect BadButtonFrame2 = [self.EnemyAttackOutlet2 frame];
    BadButtonFrame2.origin.x = ScreenWidth * 0.7;
    BadButtonFrame2.origin.y = ScreenHeight * 0.25;
    [self.EnemyAttackOutlet2 setFrame:BadButtonFrame2];
    
    CGRect BadButtonFrame3 = [self.EnemyAttackOutlet3 frame];
    BadButtonFrame3.origin.x = ScreenWidth * 0.7;
    BadButtonFrame3.origin.y = ScreenHeight * 0.75;
    [self.EnemyAttackOutlet3 setFrame:BadButtonFrame3];
    
}
-(void) Buttonstate2{
    CGRect Screen = [[UIScreen mainScreen] bounds];
    float ScreenWidth = CGRectGetWidth(Screen);
    float ScreenHeight = CGRectGetHeight(Screen);
    
    CGRect GoodButtonFrame = [self.PlayerAttackOutlet frame];
    GoodButtonFrame.origin.x = ScreenWidth * 0.7;
    GoodButtonFrame.origin.y = ScreenHeight * 0.25;
    [self.PlayerAttackOutlet setFrame:GoodButtonFrame];
    
    CGRect BadButtonFrame1 = [self.EnemyAttackOutlet1 frame];
    BadButtonFrame1.origin.x = ScreenWidth * 0.1;
    BadButtonFrame1.origin.y = ScreenHeight * 0.75;
    [self.EnemyAttackOutlet1 setFrame:BadButtonFrame1];
    
    CGRect BadButtonFrame2 = [self.EnemyAttackOutlet2 frame];
    BadButtonFrame2.origin.x = ScreenWidth * 0.1;
    BadButtonFrame2.origin.y = ScreenHeight * 0.25;
    [self.EnemyAttackOutlet2 setFrame:BadButtonFrame2];
    
    CGRect BadButtonFrame3 = [self.EnemyAttackOutlet3 frame];
    BadButtonFrame3.origin.x = ScreenWidth * 0.7;
    BadButtonFrame3.origin.y = ScreenHeight * 0.75;
    [self.EnemyAttackOutlet3 setFrame:BadButtonFrame3];
    
}
-(void) Buttonstate3{
    CGRect Screen = [[UIScreen mainScreen] bounds];
    float ScreenWidth = CGRectGetWidth(Screen);
    float ScreenHeight = CGRectGetHeight(Screen);
    
    CGRect GoodButtonFrame = [self.PlayerAttackOutlet frame];
    GoodButtonFrame.origin.x = ScreenWidth * 0.7;
    GoodButtonFrame.origin.y = ScreenHeight * 0.75;
    [self.PlayerAttackOutlet setFrame:GoodButtonFrame];
    
    CGRect BadButtonFrame1 = [self.EnemyAttackOutlet1 frame];
    BadButtonFrame1.origin.x = ScreenWidth * 0.1;
    BadButtonFrame1.origin.y = ScreenHeight * 0.75;
    [self.EnemyAttackOutlet1 setFrame:BadButtonFrame1];
    
    CGRect BadButtonFrame2 = [self.EnemyAttackOutlet2 frame];
    BadButtonFrame2.origin.x = ScreenWidth * 0.7;
    BadButtonFrame2.origin.y = ScreenHeight * 0.25;
    [self.EnemyAttackOutlet2 setFrame:BadButtonFrame2];
    
    CGRect BadButtonFrame3 = [self.EnemyAttackOutlet3 frame];
    BadButtonFrame3.origin.x = ScreenWidth * 0.1;
    BadButtonFrame3.origin.y = ScreenHeight * 0.25;
    [self.EnemyAttackOutlet3 setFrame:BadButtonFrame3];
    
}


#pragma mark Fail state
//method called when the user enters one of the two failure states of the game (HP<=0 or Time remaining <= 0)
- (void)GAMEOVER{
    PlayerData *data = [PlayerData sharedInstance];
    [data setHP:0];
    
    CGRect Screen = [[UIScreen mainScreen] bounds];
    float ScreenWidth = CGRectGetWidth(Screen);
    float ScreenHeight = CGRectGetHeight(Screen);
    //Hiding all outlets no longer being used
    self.PlayerAttackOutlet.hidden = 1;
    self.EnemyAttackOutlet1.hidden = 1;
    self.EnemyAttackOutlet2.hidden = 1;
    self.EnemyAttackOutlet3.hidden = 1;
    self.EnemyImage.hidden = 1;
    self.TimerBar.hidden = 1;
    self.PlayerHPBar.hidden = 1;
    self.PlayerHPBackground.hidden = 1;
    self.EnemyHPBar.hidden = 1;
    self.EnemyHPBackground.hidden = 1;
    
    self.EnemyIndicator1.hidden = 1;
    self.EnemyIndicator2.hidden = 1;
    self.SelectEnemyType1Outlet.hidden = 1;
    self.SelectEnemyType2Outlet.hidden = 1;
    self.CurrentScoreLabel.hidden = 1;
    
    //setting the final score of the player to compensate for gold that was not spent
    [data setScore:[data Score] + [data Coins]*10];
    
    //setting size and postion of the game over/return to menu button
    CGRect GameOverFrame = [self.ReturnToMenuOutlet frame];
    GameOverFrame.origin.x = ScreenWidth * 0.5 - 256;
    GameOverFrame.origin.y = ScreenHeight * 0.5 - 256;
    [self.ReturnToMenuOutlet setFrame:GameOverFrame];
    
    //updating final score label text and adjusting position on the screen
    self.FinalScoreLabel.text = [NSString stringWithFormat:@"Final Score : %.0f",[data Score]];
    CGRect FinalScoreLabelFrame = [self.FinalScoreLabel frame];
    FinalScoreLabelFrame.origin.x = 0.5 * ScreenWidth - 100;
    FinalScoreLabelFrame.origin.y = 0.8 * ScreenHeight;
    
    //showing the game over button and final score label
    self.ReturnToMenuOutlet.hidden = 0;
    self.FinalScoreLabel.hidden = 0;
    
    

}

#pragma mark Ticker
//function called every time the timer repeats in the battle phase
-(void)onTick:(NSTimer *)timer {
    PlayerData *data = [PlayerData sharedInstance];
    //reduce time remaining
    _TimeRemaining = _TimeRemaining -1;
    
    
    [self UpdateScreen];//updates the screen to show any new information
    
    //checking for failstates and calling the gameover method and nulling the timer if one is reached
    if (_TimeRemaining <= 0){
        [timer invalidate];
        timer = nil;
        NSLog(@"!G A M E  O V E R!");
        [self GAMEOVER];
        }
    if ([data HP] <= 0){
        [timer invalidate];
        timer = nil;
        NSLog(@"!G A M E  O V E R!");
        [self GAMEOVER];
    }
    
    //checking if the player has defeated the enemy and calling the endfight method and nulling the timer
    if (_MonsterHP <= 0){
        [timer invalidate];
        timer = nil;
        [self EndFight];
    }
    
     }


# pragma mark Starting/ending encounters
//method called when the player chooses an encounter
-(void)StartFight{
    
    //checks which encounter was chosen and changes the sprite for the enemy accordingly
    if (_Monstertype == 1){
        [self.EnemyImage setImage:[UIImage imageNamed:@"Bad guyx512"]];
    }
    else {
        [self.EnemyImage setImage:[UIImage imageNamed:@"Mimicx512"]];
    }
    
    //reset time remaining
    _TimeRemaining = 1000;
    
    //hide all objects not being used
    self.PlayerAttackOutlet.hidden = 0;
    self.EnemyAttackOutlet1.hidden = 0;
    self.EnemyAttackOutlet2.hidden = 0;
    self.EnemyAttackOutlet3.hidden = 0;
    self.EnemyImage.hidden = 0;
    self.TimerBar.hidden = 0;
    self.PlayerHPBar.hidden = 0;
    self.PlayerHPBackground.hidden = 0;
    self.EnemyHPBar.hidden = 0;
    self.EnemyHPBackground.hidden = 0;
    
    //show all objects being used
    self.EnemyIndicator1.hidden = 1;
    self.EnemyIndicator2.hidden = 1;
    self.SelectEnemyType1Outlet.hidden = 1;
    self.SelectEnemyType2Outlet.hidden = 1;
    
    
    //update screen to show the updated info
    [self UpdateScreen];
    
    //set variables for the monster stats to be proportional to the number of enemies defeated and the type of enemy chosen
    _MonsterHP = 100 * _Level * _Monstertype;
    _MonsterHPMax = 100 * _Level * _Monstertype;
    _MonsterAttack = 10 * _Level * _Monstertype;
    
    //setting timer which speeds up depending on the number of levels completed.
    float TempTimer = _Level *40*_Monstertype + _Monstertype * 100;
    [NSTimer scheduledTimerWithTimeInterval:1/TempTimer
                                     target:self
                                   selector:@selector(onTick:)
                                   userInfo:nil
                                    repeats:YES];
}

//method called when an enemy is defeated
-(void)EndFight{
    //hide all objects not currently being used
    self.PlayerAttackOutlet.hidden = 1;
    self.EnemyAttackOutlet1.hidden = 1;
    self.EnemyAttackOutlet2.hidden = 1;
    self.EnemyAttackOutlet3.hidden = 1;
    self.EnemyImage.hidden = 1;
    self.TimerBar.hidden = 1;
    self.PlayerHPBar.hidden = 1;
    self.PlayerHPBackground.hidden = 1;
    self.EnemyHPBar.hidden = 1;
    self.EnemyHPBackground.hidden = 1;
    //show enemy defeated icon
    self.EnemyDefeat.hidden = 0;
    
    //increase score and coins
    PlayerData *data = [PlayerData sharedInstance];
    [data setCoins:[data Coins]+10*_Monstertype*2];
    [data setScore:[data Score]+100*_Monstertype*_TimeRemaining];
    
    //get screen size
    CGRect Screen = [[UIScreen mainScreen] bounds];
    float ScreenWidth = CGRectGetWidth(Screen);
    float ScreenHeight = CGRectGetHeight(Screen);
    
    //setting positions of the enemy indicators and the door buttons to select them relative to screen size
    CGRect Enemyindicator1Frame = [self.EnemyIndicator1 frame];
    Enemyindicator1Frame.origin.x = 0.25*ScreenWidth-64;
    Enemyindicator1Frame.origin.y = 0.75*ScreenHeight-64;
    CGRect Enemyindicator2Frame = [self.EnemyIndicator2 frame];
    Enemyindicator2Frame.origin.x = 0.75*ScreenWidth-64;
    Enemyindicator2Frame.origin.y = 0.75*ScreenHeight-32;
    CGRect SelectEnemyType1OutletFrame = [self.SelectEnemyType1Outlet frame];
    SelectEnemyType1OutletFrame.origin.x = 0.25*ScreenWidth-128;
    SelectEnemyType1OutletFrame.origin.y = 0.4*ScreenHeight-128;
    CGRect SelectEnemyType2OutletFrame = [self.SelectEnemyType2Outlet frame];
    SelectEnemyType2OutletFrame.origin.x = 0.75*ScreenWidth-128;
    SelectEnemyType2OutletFrame.origin.y = 0.4*ScreenHeight-128;
    [self.EnemyIndicator1 setFrame:Enemyindicator1Frame];
    [self.EnemyIndicator2 setFrame:Enemyindicator2Frame];
    [self.SelectEnemyType1Outlet setFrame:SelectEnemyType1OutletFrame];
    [self.SelectEnemyType2Outlet setFrame:SelectEnemyType2OutletFrame];
    //update score label
    self.CurrentScoreLabel.text = [NSString stringWithFormat:@"Score : %.0f",[data Score]];
    
    //waits a short time showing the enemy defeated image then shows the encounter selection screen
    //this stops the player from accidentally tapping the screen and starting another encounter without meaning to
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(Transition)
                                   userInfo:nil
                                    repeats:NO];
    
    //increments the level variable which is used to scale the difficulty with the the number of enemies defeated
    _Level++;
    
}

// used at the end of the timers which show the player an enemy has been defeated and that their coins have increased
-(void)Transition{
    //shows the encounter selection buttons and images
    self.EnemyIndicator1.hidden = 0;
    self.EnemyIndicator2.hidden = 0;
    self.SelectEnemyType1Outlet.hidden = 0;
    self.SelectEnemyType2Outlet.hidden = 0;
    //hides the enemy defeated and coins increased images
    self.EnemyDefeat.hidden = 1;
    self.CoinIncrease.hidden = 1;
}


#pragma mark Attack buttons
//method for player hitting the correct button
- (IBAction)PlayerAttack:(UIButton *)sender {
    PlayerData *data = [PlayerData sharedInstance];
    //decreases enemy health by the players own attack power value
    _MonsterHP = _MonsterHP - [data AttackPower];
    //changes the button state
    _ButtonState = rand() %4;
    //updates the screen to show the new button positions
    [self UpdateScreen];
    
}

//mehtod for when the player hits the wrong button
- (IBAction)EnemyAttack:(UIButton *)sender {
    PlayerData *data = [PlayerData sharedInstance];
    //decreases the player HP by the Monster Attack value
    [data setHP:[data HP]-_MonsterAttack];
    //updates screen to show the change in HP
    [self UpdateScreen];

}


#pragma mark Enemy selection
//method called when the player chooses the chest encounter
- (IBAction)SelectEnemyType2:(UIButton *)sender {
    PlayerData *data = [PlayerData sharedInstance];
    //creates a value between 0 and 5
    int DiceRoll = 1;
    DiceRoll = rand() %6;
    //gives the player a 1/6 chance of finding a chest which gives them gold
    if (DiceRoll == 0){
        [data setCoins:[data Coins] + 100];
        //shows the coin increased image for a short time to show the player they have earned a reward
        self.CoinIncrease.hidden = 0;
        [NSTimer scheduledTimerWithTimeInterval:1
                                         target:self
                                       selector:@selector(Transition)
                                       userInfo:nil
                                        repeats:NO];
    }
    //if the player does not win the dice roll then the startfight function is called after setting the monster type to increase difficulty
    else {
        _Monstertype = 1.2;
        [self StartFight];
    }
    
}

- (IBAction)SelectEnemyType1:(UIButton *)sender {
    _Monstertype = 1;
    [self StartFight];
}

#pragma mark Saving data and returning to menu
- (IBAction)ReturnToMenu:(UIButton *)sender {
    //creating variables from the players Name and score when they reached a fail state
    PlayerData *data = [PlayerData sharedInstance];
    NSString *HighScoreName = [data PlayerName];
    NSInteger HighScore = [data Score];
    
    //accessing the stored userdefaults and creating variables so they are easy to work with
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
    
    //check if the new score is better than the number one score from the leaderboards
    if(HighScore > TopScore){
        //set the new score to be the top score and shift the rest of the scores down one position
        [defaults setObject:HighScoreName forKey:@"TopPlayer"];
        [defaults setInteger:HighScore forKey:@"TopScore"];
        [defaults setObject:TopPlayer forKey:@"SecondPlayer"];
        [defaults setInteger:TopScore forKey:@"SecondScore"];
        [defaults setObject:SecondPlayer forKey:@"ThirdPlayer"];
        [defaults setInteger:SecondScore forKey:@"ThirdScore"];
        [defaults setObject:ThirdPlayer forKey:@"FourthPlayer"];
        [defaults setInteger:ThirdScore forKey:@"FourthScore"];
        [defaults setObject:FourthPlayer forKey:@"FifthPlayer"];
        [defaults setInteger:FourthScore forKey:@"FifthScore"];
        [defaults synchronize];
    }
    //repeat for lower postions
    else if(HighScore > SecondScore){
        [defaults setObject:HighScoreName forKey:@"SecondPlayer"];
        [defaults setInteger:HighScore forKey:@"SecondScore"];
        [defaults setObject:SecondPlayer forKey:@"ThirdPlayer"];
        [defaults setInteger:SecondScore forKey:@"ThirdScore"];
        [defaults setObject:ThirdPlayer forKey:@"FourthPlayer"];
        [defaults setInteger:ThirdScore forKey:@"FourthScore"];
        [defaults setObject:FourthPlayer forKey:@"FifthPlayer"];
        [defaults setInteger:FourthScore forKey:@"FifthScore"];
        [defaults synchronize];
    }
    else if(HighScore > ThirdScore){
        [defaults setObject:HighScoreName forKey:@"ThirdPlayer"];
        [defaults setInteger:HighScore forKey:@"ThirdScore"];
        [defaults setObject:ThirdPlayer forKey:@"FourthPlayer"];
        [defaults setInteger:ThirdScore forKey:@"FourthScore"];
        [defaults setObject:FourthPlayer forKey:@"FifthPlayer"];
        [defaults setInteger:FourthScore forKey:@"FifthScore"];
        [defaults synchronize];
    }
    else if(HighScore >FourthScore){
        [defaults setObject:HighScoreName forKey:@"FourthPlayer"];
        [defaults setInteger:HighScore forKey:@"FourthScore"];
        [defaults setObject:FourthPlayer forKey:@"FifthPlayer"];
        [defaults setInteger:FourthScore forKey:@"FifthScore"];
        [defaults synchronize];
    }
    else if(HighScore > FifthScore){
        [defaults setObject:HighScoreName forKey:@"FifthPlayer"];
        [defaults setInteger:HighScore forKey:@"FifthScore"];
        [defaults synchronize];
    }
    
}
@end
