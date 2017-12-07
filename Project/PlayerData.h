//
//  PlayerData.h
//  Project
//
//  Created by William Carne [el16wc] on 21/11/2017.
//  Copyright © 2017 William Carne [el16wc]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerData : NSObject
//creating the properties needed for the played data model
@property (nonatomic, copy) NSString *PlayerName;
@property float MaxHP;
@property float HP;
@property int AttackPower;
@property float Coins;
@property float Score;

+ (PlayerData *) sharedInstance;

@end
//Some code for this class was taken from Dr. Craig Evans' blog at : https://eencae.wordpress.com/ios-tutorials/other/passing-data-between-multiple-views/
