//
//  PlayerData.h
//  Project
//
//  Created by William Carne [el16wc] on 21/11/2017.
//  Copyright © 2017 William Carne [el16wc]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerData : NSObject

@property (nonatomic, copy) NSString *PlayerName;
@property float MaxHP;
@property float HP;
@property int AttackPower;
@property int Coins;
@property int Score;

+ (PlayerData *) sharedInstance;

@end
