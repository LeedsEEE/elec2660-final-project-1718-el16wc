//
//  FirstViewController.h
//  Project
//
//  Created by William Carne [el16wc] on 21/11/2017.
//  Copyright © 2017 William Carne [el16wc]. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerData.h"

@interface ShopViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *PlayerNameTest;
@property (weak, nonatomic) IBOutlet UILabel *MaxHealthLabel;
@property (weak, nonatomic) IBOutlet UILabel *HealthLabel;
@property (weak, nonatomic) IBOutlet UILabel *AttackLabel;
@property (weak, nonatomic) IBOutlet UILabel *CoinLabel;
@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel;

- (IBAction)HealthPotion:(UIButton *)sender;
- (IBAction)ArmourUpgrade:(UIButton *)sender;
- (IBAction)AttackUpgrade:(UIButton *)sender;


@end

