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

@property (weak, nonatomic) IBOutlet UILabel *PlayerHPLabel;

-(void) Failure;
-(void) onTick:(NSTimer *)timer;
@end

