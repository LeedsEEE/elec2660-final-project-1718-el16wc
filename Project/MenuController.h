//
//  MenuController.h
//  Project
//
//  Created by William Carne [el16wc] on 21/11/2017.
//  Copyright © 2017 William Carne [el16wc]. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerData.h"

@interface MenuController : UIViewController <UITextFieldDelegate>
- (IBAction)StartGame:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *PlayerNameTextField;

@end