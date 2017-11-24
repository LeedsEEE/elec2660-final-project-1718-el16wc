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
    
    PlayerData *data = [PlayerData sharedInstance];
    self.PlayerHPLabel.text = [NSString stringWithFormat:@"%d HP",[data HP]];
    
    [NSTimer scheduledTimerWithTimeInterval:10.0
                                     target:self
                                   selector:@selector(Failure)
                                   userInfo:nil
                                    repeats:NO];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)Failure{
    PlayerData *data = [PlayerData sharedInstance];
    [data setHP:0];
    self.PlayerHPLabel.text = [NSString stringWithFormat:@"%d HP",[data HP]];
}
-(void)onTick:(NSTimer *)timer {
    PlayerData *data = [PlayerData sharedInstance];
    [data setHP:[data HP]-1];
     self.PlayerHPLabel.text = [NSString stringWithFormat:@"%d HP",[data HP]];
     }
@end
