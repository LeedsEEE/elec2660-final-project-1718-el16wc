//
//  SecondViewController.h
//  Project
//
//  Created by William Carne [el16wc] on 21/11/2017.
//  Copyright © 2017 William Carne [el16wc]. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerData.h"

@interface GameViewController : UIViewController

//Actions for buttons
- (IBAction)PlayerAttack:(UIButton *)sender;
- (IBAction)EnemyAttack:(UIButton *)sender;
- (IBAction)SelectEnemyType2:(UIButton *)sender;
- (IBAction)SelectEnemyType1:(UIButton *)sender;
- (IBAction)ReturnToMenu:(UIButton *)sender;

//outlets for the gameover screen
@property (weak, nonatomic) IBOutlet UIButton *ReturnToMenuOutlet;
@property (weak, nonatomic) IBOutlet UILabel *FinalScoreLabel;

//outlets for the attack buttons
@property (weak, nonatomic) IBOutlet UIButton *PlayerAttackOutlet;
@property (weak, nonatomic) IBOutlet UIButton *EnemyAttackOutlet1;
@property (weak, nonatomic) IBOutlet UIButton *EnemyAttackOutlet2;
@property (weak, nonatomic) IBOutlet UIButton *EnemyAttackOutlet3;

//outlets for the encounter phase (hpbars and sprites)
@property (weak, nonatomic) IBOutlet UILabel *CurrentScoreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *EnemyImage;
@property (weak, nonatomic) IBOutlet UILabel *TimerBar;
@property (weak, nonatomic) IBOutlet UILabel *PlayerHPBar;
@property (weak, nonatomic) IBOutlet UILabel *PlayerHPBackground;
@property (weak, nonatomic) IBOutlet UILabel *EnemyHPBar;
@property (weak, nonatomic) IBOutlet UILabel *EnemyHPBackground;

//outlets for encounter choosing screen
@property (weak, nonatomic) IBOutlet UIImageView *EnemyIndicator1;
@property (weak, nonatomic) IBOutlet UIImageView *EnemyIndicator2;
@property (weak, nonatomic) IBOutlet UIButton *SelectEnemyType1Outlet;
@property (weak, nonatomic) IBOutlet UIButton *SelectEnemyType2Outlet;

//outlets for transition sprites
@property (weak, nonatomic) IBOutlet UIImageView *CoinIncrease;
@property (weak, nonatomic) IBOutlet UIImageView *EnemyDefeat;

//properties used to control the level and layout
@property int TimeRemaining;
@property int ButtonState;
@property int LevelState;

//properties used for the setting the enemy hp and attack power as well as scaling the player rewards
@property float MonsterHP;
@property float MonsterHPMax;
@property float MonsterAttack;
@property float Level;
@property float Monstertype;

//function for fail states
-(void) GAMEOVER;

//function called when the timer completes in the encounter sequence
-(void) onTick:(NSTimer *)timer;//idea of ontick function usinga timer was found on stack exchange :https://stackoverflow.com/questions/1449035/how-do-i-use-nstimer

//function to update labels and positions on the screen
-(void) UpdateScreen;

//used to move the attack buttons between 4 states
-(void) Buttonstate0;
-(void) Buttonstate1;
-(void) Buttonstate2;
-(void) Buttonstate3;

//functions for starting or ending fights
-(void) StartFight;
-(void) EndFight;

//used as a delay function to give player time between actions and choices
-(void) Transition;


@end

