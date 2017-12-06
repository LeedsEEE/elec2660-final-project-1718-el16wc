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
- (IBAction)PlayerAttack:(UIButton *)sender;
- (IBAction)EnemyAttack:(UIButton *)sender;
- (IBAction)SelectEnemyType2:(UIButton *)sender;
- (IBAction)SelectEnemyType1:(UIButton *)sender;
- (IBAction)ReturnToMenu:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *ReturnToMenuOutlet;
@property (weak, nonatomic) IBOutlet UILabel *FinalScoreLabel;

@property (weak, nonatomic) IBOutlet UIButton *PlayerAttackOutlet;
@property (weak, nonatomic) IBOutlet UIButton *EnemyAttackOutlet1;
@property (weak, nonatomic) IBOutlet UIButton *EnemyAttackOutlet2;
@property (weak, nonatomic) IBOutlet UIButton *EnemyAttackOutlet3;

@property (weak, nonatomic) IBOutlet UILabel *CurrentScoreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *EnemyImage;
@property (weak, nonatomic) IBOutlet UILabel *TimerBar;
@property (weak, nonatomic) IBOutlet UILabel *PlayerHPBar;
@property (weak, nonatomic) IBOutlet UILabel *PlayerHPBackground;
@property (weak, nonatomic) IBOutlet UILabel *EnemyHPBar;
@property (weak, nonatomic) IBOutlet UILabel *EnemyHPBackground;

@property (weak, nonatomic) IBOutlet UIImageView *EnemyIndicator1;
@property (weak, nonatomic) IBOutlet UIImageView *EnemyIndicator2;
@property (weak, nonatomic) IBOutlet UIButton *SelectEnemyType1Outlet;
@property (weak, nonatomic) IBOutlet UIButton *SelectEnemyType2Outlet;

@property (weak, nonatomic) IBOutlet UIImageView *CoinIncrease;

@property (weak, nonatomic) IBOutlet UIImageView *EnemyDefeat;

@property int TimeRemaining;
@property int ButtonState;
@property int LevelState;

@property float MonsterHP;
@property float MonsterHPMax;
@property float MonsterAttack;
@property float Level;
@property int Monstertype;

-(void) GAMEOVER;

-(void) onTick:(NSTimer *)timer;

-(void) UpdateScreen;

-(void) Buttonstate0;
-(void) Buttonstate1;
-(void) Buttonstate2;
-(void) Buttonstate3;

-(void) StartFight;
-(void) EndFight;

-(void) EnemyDefeated;


@end

