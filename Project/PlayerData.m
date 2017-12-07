//
//  PlayerData.m
//  Project
//
//  Created by William Carne [el16wc] on 21/11/2017.
//  Copyright © 2017 William Carne [el16wc]. All rights reserved.
//

#import "PlayerData.h"

@implementation PlayerData
@synthesize PlayerName = _PlayerName;
@synthesize MaxHP = _MaxHP;
@synthesize HP = _HP;
@synthesize AttackPower = _AttackPower;
@synthesize Coins = _Coins;
@synthesize Score = _Score;

static PlayerData *_sharedInstance;


//initialising the values of the datamodel
-(id) init {
    if (self = [super init]){
        //custom initialisation
        _PlayerName = @"Freyja";
        _MaxHP = 50;
        _HP = 50;
        _AttackPower = 10;
        _Coins = 100;
        _Score = 0;
    }
    return self;
}

+ (PlayerData *) sharedInstance//defining the method for accessing the shared instance of the datamodel
{
    if (!_sharedInstance) {
        _sharedInstance = [[PlayerData alloc]init];
    
    }
    return _sharedInstance;
}
@end
//Some code for this class was taken from Dr. Craig Evans' blog at : https://eencae.wordpress.com/ios-tutorials/other/passing-data-between-multiple-views/
