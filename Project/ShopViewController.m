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

#pragma mark View setup
- (void)viewDidLoad {
    [super viewDidLoad];
    PlayerData *data = [PlayerData sharedInstance];//initialising instance of player data model
    //setting all labels to have the initial player values
    self.PlayerNameTest.text = [data PlayerName];
    self.MaxHealthLabel.text = [NSString stringWithFormat:@"%.0f HP",[data MaxHP]];
    self.HealthLabel.text = [NSString stringWithFormat:@"%.0f HP",[data HP]];
    self.AttackLabel.text = [NSString stringWithFormat:@"%d AP",[data AttackPower]];
    self.CoinLabel.text = [NSString stringWithFormat:@"%.0f Gold",[data Coins]];
    self.ScoreLabel.text = [NSString stringWithFormat:@"Score : %.0f",[data Score]];
}
-(void)viewDidAppear:(BOOL)animated{
    //Viewdidappear forces labels to refresh when the player changes tabs
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
    
}


#pragma mark Button Setup
- (IBAction)HealthPotion:(UIButton *)sender {
    PlayerData *data = [PlayerData sharedInstance];//accessing shared instance of data model
    //checks if the player has enough coins to purchase item. if they do then it sets HP to its max value and reduces coins by the cost of the upgrade
    if([data Coins] >= 5){
        if([data HP] != [data MaxHP]){                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    [data setHP:[data MaxHP]];
    [data setCoins:[data Coins] - 5];
    //Updates labels to reflect changes to players HP and coin levels
    self.MaxHealthLabel.text = [NSString stringWithFormat:@"%.0f HP",[data MaxHP]];
    self.HealthLabel.text = [NSString stringWithFormat:@"%.0f HP",[data HP]];
    self.AttackLabel.text = [NSString stringWithFormat:@"%d AP",[data AttackPower]];
    self.CoinLabel.text = [NSString stringWithFormat:@"%.0f Gold",[data Coins]];
        }
    }
}

- (IBAction)ArmourUpgrade:(UIButton *)sender {
    PlayerData *data = [PlayerData sharedInstance];
    //similar to Healthpotion button except it increases the maximum hp of the player instead of restoring the current amount
    if([data Coins] >= 15){
        [data setCoins:[data Coins] - 15];
        [data setMaxHP:[data MaxHP]+20];
        [data setHP:[data MaxHP]];
        self.MaxHealthLabel.text = [NSString stringWithFormat:@"%.0f HP",[data MaxHP]];
        self.HealthLabel.text = [NSString stringWithFormat:@"%.0f HP",[data HP]];
        self.AttackLabel.text = [NSString stringWithFormat:@"%d AP",[data AttackPower]];
        self.CoinLabel.text = [NSString stringWithFormat:@"%.0f Gold",[data Coins]];
    }
}

- (IBAction)AttackUpgrade:(UIButton *)sender {
    PlayerData *data = [PlayerData sharedInstance];
    //if the player has enough coins the button will increase their attack power and reduce their coin value
    if([data Coins] >= 10){
    [data setAttackPower:[data AttackPower]+5];
    self.AttackLabel.text = [NSString stringWithFormat:@"%d AP",[data AttackPower]];
    [data setCoins:[data Coins] - 10];
    self.CoinLabel.text = [NSString stringWithFormat:@"%.0f Gold",[data Coins]];
    }
}
@end
