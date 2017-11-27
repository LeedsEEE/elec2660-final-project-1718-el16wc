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

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:0.05
                                                     target:self
                                                   selector:@selector(onTick:)
                                                   userInfo:nil
                                                    repeats:YES];
    
    _TimeRemaining = 100;
    
    PlayerData *data = [PlayerData sharedInstance];
    self.PlayerHPLabel.text = [NSString stringWithFormat:@"%f HP",[data HP]];
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)Failure{
    PlayerData *data = [PlayerData sharedInstance];
    [data setHP:0];
    self.PlayerHPLabel.text = [NSString stringWithFormat:@"%.0f HP",[data HP]];
}
-(void)onTick:(NSTimer *)timer {
    PlayerData *data = [PlayerData sharedInstance];
    //[data setHP:[data HP]-1];
    _TimeRemaining = _TimeRemaining -1;
     self.PlayerHPLabel.text = [NSString stringWithFormat:@"%.0f HP",[data HP]];
    
    CGRect TimerBarFrame = [self.TimerBar frame];
    TimerBarFrame.size.width = 10;
    TimerBarFrame.size.height = _TimeRemaining*5;
    TimerBarFrame.origin.x = 360;
    TimerBarFrame.origin.y = 80;
    [self.TimerBar setFrame:TimerBarFrame];
    
    CGRect PlayerHPFrame = [self.PlayerHPBar frame];
    float PlayerHP = [data HP];
    float MaxPlayerHP = [data MaxHP];
    float HPPercentage = 1;
    HPPercentage = PlayerHP/MaxPlayerHP;
    PlayerHPFrame.size.width = HPPercentage * 300;
    //PlayerHPFrame.size.width = _TimeRemaining*3;
    NSLog(@"Current percentage = %.0f",HPPercentage);
    PlayerHPFrame.origin.x = 50;
    PlayerHPFrame.origin.y = 620;
    [self.PlayerHPBar setFrame:PlayerHPFrame];
    
    if (_TimeRemaining <= 0){
        [timer invalidate];
        timer = nil;
        NSLog(@"!G A M E  O V E R!");
    }
     }

- (IBAction)PlayerAttack:(UIButton *)sender {
    PlayerData *data = [PlayerData sharedInstance];
    [data setHP:[data HP]+1];
}

- (IBAction)EnemyAttack:(UIButton *)sender {
    PlayerData *data = [PlayerData sharedInstance];
    [data setHP:[data HP]-1];
}
@end
