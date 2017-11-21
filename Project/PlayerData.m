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

-(id) init {
    if (self = [super init]){
        //custom initialisation
        _PlayerName = @"Blarg";
        _MaxHP = 60;
        _HP = 50;
        _AttackPower = 10;
        _Coins = 100;
        _Score = 0;
    }
    return self;
}

+ (PlayerData *) sharedInstance
{
    if (!_sharedInstance) {
        _sharedInstance = [[PlayerData alloc]init];
    
    }
    return _sharedInstance;
}
@end
