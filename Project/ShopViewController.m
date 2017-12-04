//
//  FirstViewController.m
//  Project
//
//  Created by William Carne [el16wc] on 21/11/2017.
//  Copyright © 2017 William Carne [el16wc]. All rights reserved.
//

#import "ShopViewController.h"

@interface ShopViewController ()

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PlayerData *data = [PlayerData sharedInstance];
    self.PlayerNameTest.text = [data PlayerName];
    self.MaxHealthLabel.text = [NSString stringWithFormat:@"%.0f HP",[data MaxHP]];
    self.HealthLabel.text = [NSString stringWithFormat:@"%.0f HP",[data HP]];
    self.AttackLabel.text = [NSString stringWithFormat:@"%d AP",[data AttackPower]];
    self.CoinLabel.text = [NSString stringWithFormat:@"%.0f Gold",[data Coins]];
    self.ScoreLabel.text = [NSString stringWithFormat:@"Score : %.0f",[data Score]];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear:(BOOL)animated{
    PlayerData *data = [PlayerData sharedInstance];
    self.PlayerNameTest.text = [data PlayerName];
    self.MaxHealthLabel.text = [NSString stringWithFormat:@"%.0f HP",[data MaxHP]];
    self.HealthLabel.text = [NSString stringWithFormat:@"%.0f HP",[data HP]];
    self.AttackLabel.text = [NSString stringWithFormat:@"%d AP",[data AttackPower]];
    self.CoinLabel.text = [NSString stringWithFormat:@"%.0f Gold",[data Coins]];
    self.ScoreLabel.text = [NSString stringWithFormat:@"Score : %.0f",[data Score]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)HealthPotion:(UIButton *)sender {
    PlayerData *data = [PlayerData sharedInstance];
    if([data Coins] >= 5){
        if([data HP] != [data MaxHP]){                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    [data setHP:[data MaxHP]];
    [data setCoins:[data Coins] - 5];
    self.MaxHealthLabel.text = [NSString stringWithFormat:@"%.0f HP",[data MaxHP]];
    self.HealthLabel.text = [NSString stringWithFormat:@"%.0f HP",[data HP]];
    self.AttackLabel.text = [NSString stringWithFormat:@"%d AP",[data AttackPower]];
    self.CoinLabel.text = [NSString stringWithFormat:@"%.0f Gold",[data Coins]];
        }
    }
}

- (IBAction)ArmourUpgrade:(UIButton *)sender {
    PlayerData *data = [PlayerData sharedInstance];
    if([data Coins] >= 10){
        [data setCoins:[data Coins] - 10];
        [data setMaxHP:[data MaxHP]+10];
        self.MaxHealthLabel.text = [NSString stringWithFormat:@"%.0f HP",[data MaxHP]];
        self.HealthLabel.text = [NSString stringWithFormat:@"%.0f HP",[data HP]];
        self.AttackLabel.text = [NSString stringWithFormat:@"%d AP",[data AttackPower]];
        self.CoinLabel.text = [NSString stringWithFormat:@"%.0f Gold",[data Coins]];
    }
}

- (IBAction)AttackUpgrade:(UIButton *)sender {
    PlayerData *data = [PlayerData sharedInstance];
    if([data Coins] >= 10){
    [data setAttackPower:[data AttackPower]+5];
    self.AttackLabel.text = [NSString stringWithFormat:@"%d AP",[data AttackPower]];
    [data setCoins:[data Coins] - 10];
    self.CoinLabel.text = [NSString stringWithFormat:@"%.0f Gold",[data Coins]];
    }
}
@end
