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

@property (weak, nonatomic) IBOutlet UIButton *PlayerAttackOutlet;
@property (weak, nonatomic) IBOutlet UIButton *EnemyAttackOutlet1;
@property (weak, nonatomic) IBOutlet UIButton *EnemyAttackOutlet2;
@property (weak, nonatomic) IBOutlet UIButton *EnemyAttackOutlet3;



@property (weak, nonatomic) IBOutlet UILabel *PlayerHPLabel;
@property (weak, nonatomic) IBOutlet UILabel *TimerBar;
@property (weak, nonatomic) IBOutlet UILabel *PlayerHPBar;
@property int TimeRemaining;
@property int ButtonState;

-(void) Failure;

-(void) onTick:(NSTimer *)timer;

-(void) Buttonstate0;
-(void) Buttonstate1;
-(void) Buttonstate2;
-(void) Buttonstate3;


@end

