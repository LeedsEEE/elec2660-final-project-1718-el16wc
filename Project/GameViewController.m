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
    
    _Level = 1;
    _MonsterHP = 100;
    _MonsterHPMax = 100;
    _MonsterAttack = 10;
    _Monstertype = 1;
    _ButtonState = 0;
    CGRect Screen = [[UIScreen mainScreen] bounds];
    float ScreenWidth = CGRectGetWidth(Screen);
    float ScreenHeight = CGRectGetHeight(Screen);
    CGRect Enemyindicator1Frame = [self.EnemyIndicator1 frame];
    Enemyindicator1Frame.origin.x = 0.13*ScreenWidth;
    Enemyindicator1Frame.origin.y = 0.55*ScreenHeight;
    CGRect Enemyindicator2Frame = [self.EnemyIndicator2 frame];
    Enemyindicator2Frame.origin.x = 0.575*ScreenWidth;
    Enemyindicator2Frame.origin.y = 0.55*ScreenHeight;
    CGRect SelectEnemyType1OutletFrame = [self.SelectEnemyType1Outlet frame];
    SelectEnemyType1OutletFrame.origin.x = 0.05*ScreenWidth;
    SelectEnemyType1OutletFrame.origin.y = 0.25*ScreenHeight;
    CGRect SelectEnemyType2OutletFrame = [self.SelectEnemyType2Outlet frame];
    SelectEnemyType2OutletFrame.origin.x = 0.5*ScreenWidth;
    SelectEnemyType2OutletFrame.origin.y = 0.25*ScreenHeight;
    [self.EnemyIndicator1 setFrame:Enemyindicator1Frame];
    [self.EnemyIndicator2 setFrame:Enemyindicator2Frame];
    [self.SelectEnemyType1Outlet setFrame:SelectEnemyType1OutletFrame];
    [self.SelectEnemyType2Outlet setFrame:SelectEnemyType2OutletFrame];
    
   // [self StartFight];
    
    /*[self UpdateScreen];
    
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.05
                                                     target:self
                                                   selector:@selector(onTick:)
                                                   userInfo:nil
                                                    repeats:YES];
    
    _TimeRemaining = 100;
    
    PlayerData *data = [PlayerData sharedInstance];
    self.PlayerHPBar.text = [NSString stringWithFormat:@"%f HP",[data HP]];
    
    */
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)UpdateScreen{
    //initialising data needed to update positions
    PlayerData *data = [PlayerData sharedInstance];
    CGRect Screen = [[UIScreen mainScreen] bounds];
    float ScreenWidth = CGRectGetWidth(Screen);
    float ScreenHeight = CGRectGetHeight(Screen);
    
    //Updating Timer
    CGRect TimerBarFrame = [self.TimerBar frame];
    TimerBarFrame.size.width = 10;
    TimerBarFrame.size.height = _TimeRemaining*5;
    TimerBarFrame.origin.x = ScreenWidth - 25;
    TimerBarFrame.origin.y = ScreenHeight/10;
    [self.TimerBar setFrame:TimerBarFrame];
    
    //updating Enemy Image
    CGRect EnemyImageFrame = [self.EnemyImage frame];
    EnemyImageFrame.origin.x = ScreenWidth*0.5 - 128;
    EnemyImageFrame.origin.y = ScreenHeight* 0.5 - 128;
    [self.EnemyImage setFrame:EnemyImageFrame];
    
    //updating Enemy HP Bar
    float EnemyHPPercentage = _MonsterHP / _MonsterHPMax;
    CGRect EnemyHPBarFrame = [self.EnemyHPBar frame];
    if (EnemyHPPercentage >=0){
    EnemyHPBarFrame.size.width = EnemyHPPercentage * ScreenWidth * 0.8;
    }
    else{
        EnemyHPBarFrame.size.width = 0;
    }
    EnemyHPBarFrame.size.height = 25;
    EnemyHPBarFrame.origin.x = 0.1 * ScreenWidth;
    EnemyHPBarFrame.origin.y = 0.1 * ScreenHeight;
    [self.EnemyHPBar setFrame:EnemyHPBarFrame];
    CGRect EnemyHPBackgroundFrame = [self.EnemyHPBackground frame];
    EnemyHPBackgroundFrame.size.width = ScreenWidth * 0.8;
    EnemyHPBackgroundFrame.size.height = 25;
    EnemyHPBackgroundFrame.origin.x = 0.1 * ScreenWidth;
    EnemyHPBackgroundFrame.origin.y = 0.1 * ScreenHeight;
    [self.EnemyHPBackground setFrame:EnemyHPBackgroundFrame];
    self.EnemyHPBar.text = [NSString stringWithFormat:@"%.0f HP",_MonsterHP];
    
    //updating Player HP Bar
    self.PlayerHPBar.text = [NSString stringWithFormat:@"%.0f HP",[data HP]];
    CGRect PlayerHPFrame = [self.PlayerHPBar frame];
    CGRect PlayerHPBackgroundFrame = [self.PlayerHPBackground frame];
    PlayerHPBackgroundFrame.size.width = ScreenWidth * 0.8;
    PlayerHPBackgroundFrame.size.height = 25;
    PlayerHPBackgroundFrame.origin.x = 0.1 * ScreenWidth;
    PlayerHPBackgroundFrame.origin.y = 0.9 * ScreenHeight;
    [self.PlayerHPBackground setFrame:PlayerHPBackgroundFrame];
    float PlayerHP = [data HP];
    float MaxPlayerHP = [data MaxHP];
    float HPPercentage = 1;
    HPPercentage = PlayerHP/MaxPlayerHP;
    if(HPPercentage >=0){
        PlayerHPFrame.size.width = HPPercentage * ScreenWidth * 0.8;
        PlayerHPFrame.size.height = 25;
    }
    else{
        PlayerHPFrame.size.width = 0;
        PlayerHPFrame.size.height = 0;
    }
    NSLog(@"Current percentage = %.0f",HPPercentage);
    PlayerHPFrame.origin.x = 0.1 * ScreenWidth;
    PlayerHPFrame.origin.y = 0.9 * ScreenHeight;
    [self.PlayerHPBar setFrame:PlayerHPFrame];
    
    
    //updating Button Positions
    if (_ButtonState == 0){
        [self Buttonstate0];
    }
    if (_ButtonState == 1){
        [self Buttonstate1];
    }
    if (_ButtonState == 2){
        [self Buttonstate2];
    }
    if (_ButtonState == 3){
        [self Buttonstate3];
    }
}

-(void) Buttonstate0{
    CGRect Screen = [[UIScreen mainScreen] bounds];
    float ScreenWidth = CGRectGetWidth(Screen);
    float ScreenHeight = CGRectGetHeight(Screen);
    
    CGRect GoodButtonFrame = [self.PlayerAttackOutlet frame];
    GoodButtonFrame.origin.x = ScreenWidth * 0.1;
    GoodButtonFrame.origin.y = ScreenHeight * 0.25;
    [self.PlayerAttackOutlet setFrame:GoodButtonFrame];
    
    CGRect BadButtonFrame1 = [self.EnemyAttackOutlet1 frame];
    BadButtonFrame1.origin.x = ScreenWidth * 0.1;
    BadButtonFrame1.origin.y = ScreenHeight * 0.75;
    [self.EnemyAttackOutlet1 setFrame:BadButtonFrame1];
    
    CGRect BadButtonFrame2 = [self.EnemyAttackOutlet2 frame];
    BadButtonFrame2.origin.x = ScreenWidth * 0.7;
    BadButtonFrame2.origin.y = ScreenHeight * 0.25;
    [self.EnemyAttackOutlet2 setFrame:BadButtonFrame2];
    
    CGRect BadButtonFrame3 = [self.EnemyAttackOutlet3 frame];
    BadButtonFrame3.origin.x = ScreenWidth * 0.7;
    BadButtonFrame3.origin.y = ScreenHeight * 0.75;
    [self.EnemyAttackOutlet3 setFrame:BadButtonFrame3];
    
}


-(void) Buttonstate1{
    CGRect Screen = [[UIScreen mainScreen] bounds];
    float ScreenWidth = CGRectGetWidth(Screen);
    float ScreenHeight = CGRectGetHeight(Screen);
    
    CGRect GoodButtonFrame = [self.PlayerAttackOutlet frame];
    GoodButtonFrame.origin.x = ScreenWidth * 0.1;
    GoodButtonFrame.origin.y = ScreenHeight * 0.75;
    [self.PlayerAttackOutlet setFrame:GoodButtonFrame];
    
    CGRect BadButtonFrame1 = [self.EnemyAttackOutlet1 frame];
    BadButtonFrame1.origin.x = ScreenWidth * 0.1;
    BadButtonFrame1.origin.y = ScreenHeight * 0.25;
    [self.EnemyAttackOutlet1 setFrame:BadButtonFrame1];
    
    CGRect BadButtonFrame2 = [self.EnemyAttackOutlet2 frame];
    BadButtonFrame2.origin.x = ScreenWidth * 0.7;
    BadButtonFrame2.origin.y = ScreenHeight * 0.25;
    [self.EnemyAttackOutlet2 setFrame:BadButtonFrame2];
    
    CGRect BadButtonFrame3 = [self.EnemyAttackOutlet3 frame];
    BadButtonFrame3.origin.x = ScreenWidth * 0.7;
    BadButtonFrame3.origin.y = ScreenHeight * 0.75;
    [self.EnemyAttackOutlet3 setFrame:BadButtonFrame3];
    
}
-(void) Buttonstate2{
    CGRect Screen = [[UIScreen mainScreen] bounds];
    float ScreenWidth = CGRectGetWidth(Screen);
    float ScreenHeight = CGRectGetHeight(Screen);
    
    CGRect GoodButtonFrame = [self.PlayerAttackOutlet frame];
    GoodButtonFrame.origin.x = ScreenWidth * 0.7;
    GoodButtonFrame.origin.y = ScreenHeight * 0.25;
    [self.PlayerAttackOutlet setFrame:GoodButtonFrame];
    
    CGRect BadButtonFrame1 = [self.EnemyAttackOutlet1 frame];
    BadButtonFrame1.origin.x = ScreenWidth * 0.1;
    BadButtonFrame1.origin.y = ScreenHeight * 0.75;
    [self.EnemyAttackOutlet1 setFrame:BadButtonFrame1];
    
    CGRect BadButtonFrame2 = [self.EnemyAttackOutlet2 frame];
    BadButtonFrame2.origin.x = ScreenWidth * 0.1;
    BadButtonFrame2.origin.y = ScreenHeight * 0.25;
    [self.EnemyAttackOutlet2 setFrame:BadButtonFrame2];
    
    CGRect BadButtonFrame3 = [self.EnemyAttackOutlet3 frame];
    BadButtonFrame3.origin.x = ScreenWidth * 0.7;
    BadButtonFrame3.origin.y = ScreenHeight * 0.75;
    [self.EnemyAttackOutlet3 setFrame:BadButtonFrame3];
    
}
-(void) Buttonstate3{
    CGRect Screen = [[UIScreen mainScreen] bounds];
    float ScreenWidth = CGRectGetWidth(Screen);
    float ScreenHeight = CGRectGetHeight(Screen);
    
    CGRect GoodButtonFrame = [self.PlayerAttackOutlet frame];
    GoodButtonFrame.origin.x = ScreenWidth * 0.7;
    GoodButtonFrame.origin.y = ScreenHeight * 0.75;
    [self.PlayerAttackOutlet setFrame:GoodButtonFrame];
    
    CGRect BadButtonFrame1 = [self.EnemyAttackOutlet1 frame];
    BadButtonFrame1.origin.x = ScreenWidth * 0.1;
    BadButtonFrame1.origin.y = ScreenHeight * 0.75;
    [self.EnemyAttackOutlet1 setFrame:BadButtonFrame1];
    
    CGRect BadButtonFrame2 = [self.EnemyAttackOutlet2 frame];
    BadButtonFrame2.origin.x = ScreenWidth * 0.7;
    BadButtonFrame2.origin.y = ScreenHeight * 0.25;
    [self.EnemyAttackOutlet2 setFrame:BadButtonFrame2];
    
    CGRect BadButtonFrame3 = [self.EnemyAttackOutlet3 frame];
    BadButtonFrame3.origin.x = ScreenWidth * 0.1;
    BadButtonFrame3.origin.y = ScreenHeight * 0.25;
    [self.EnemyAttackOutlet3 setFrame:BadButtonFrame3];
    
}



- (void)GAMEOVER{
    PlayerData *data = [PlayerData sharedInstance];
    [data setHP:0];

}
-(void)onTick:(NSTimer *)timer {
    
    _TimeRemaining = _TimeRemaining -1;
    
    [self UpdateScreen];
    
    if (_TimeRemaining <= 0){
        [timer invalidate];
        timer = nil;
        NSLog(@"!G A M E  O V E R!");
        }
    if (_MonsterHP <= 0){
        [timer invalidate];
        timer = nil;
        [self EndFight];
    }
    
     }

-(void)StartFight{
    [self UpdateScreen];
    _TimeRemaining = 100;
    self.PlayerAttackOutlet.hidden = 0;
    self.EnemyAttackOutlet1.hidden = 0;
    self.EnemyAttackOutlet2.hidden = 0;
    self.EnemyAttackOutlet3.hidden = 0;
    self.EnemyImage.hidden = 0;
    self.TimerBar.hidden = 0;
    self.PlayerHPBar.hidden = 0;
    self.PlayerHPBackground.hidden = 0;
    self.EnemyHPBar.hidden = 0;
    self.EnemyHPBackground.hidden = 0;
    
    self.EnemyIndicator1.hidden = 1;
    self.EnemyIndicator2.hidden = 1;
    self.SelectEnemyType1Outlet.hidden = 1;
    self.SelectEnemyType2Outlet.hidden = 1;
    
    [self UpdateScreen];
    
    _MonsterHP = 100 * _Level * _Monstertype;
    _MonsterHPMax = 100 * _Level * _Monstertype;
    _MonsterAttack = 10 * _Level * _Monstertype;
    
    float TempTimer = _Level * _Monstertype;
    
    [NSTimer scheduledTimerWithTimeInterval:1/TempTimer
                                     target:self
                                   selector:@selector(onTick:)
                                   userInfo:nil
                                    repeats:YES];
    
    _TimeRemaining = 100;
    
    
    
    PlayerData *data = [PlayerData sharedInstance];
    self.PlayerHPBar.text = [NSString stringWithFormat:@"%.0f HP",[data HP]];
}

-(void)EndFight{
    self.PlayerAttackOutlet.hidden = 1;
    self.EnemyAttackOutlet1.hidden = 1;
    self.EnemyAttackOutlet2.hidden = 1;
    self.EnemyAttackOutlet3.hidden = 1;
    self.EnemyImage.hidden = 1;
    self.TimerBar.hidden = 1;
    self.PlayerHPBar.hidden = 1;
    self.PlayerHPBackground.hidden = 1;
    self.EnemyHPBar.hidden = 1;
    self.EnemyHPBackground.hidden = 1;
    
    self.EnemyIndicator1.hidden = 0;
    self.EnemyIndicator2.hidden = 0;
    self.SelectEnemyType1Outlet.hidden = 0;
    self.SelectEnemyType2Outlet.hidden = 0;
    
    PlayerData *data = [PlayerData sharedInstance];
    [data setCoins:[data Coins]+10*_Monstertype];
    [data setScore:[data Score]+100*_Monstertype*_TimeRemaining];
    CGRect Screen = [[UIScreen mainScreen] bounds];
    float ScreenWidth = CGRectGetWidth(Screen);
    float ScreenHeight = CGRectGetHeight(Screen);
    
    CGRect Enemyindicator1Frame = [self.EnemyIndicator1 frame];
    Enemyindicator1Frame.origin.x = 0.13*ScreenWidth;
    Enemyindicator1Frame.origin.y = 0.55*ScreenHeight;
    CGRect Enemyindicator2Frame = [self.EnemyIndicator2 frame];
    Enemyindicator2Frame.origin.x = 0.575*ScreenWidth;
    Enemyindicator2Frame.origin.y = 0.55*ScreenHeight;
    CGRect SelectEnemyType1OutletFrame = [self.SelectEnemyType1Outlet frame];
    SelectEnemyType1OutletFrame.origin.x = 0.05*ScreenWidth;
    SelectEnemyType1OutletFrame.origin.y = 0.25*ScreenHeight;
    CGRect SelectEnemyType2OutletFrame = [self.SelectEnemyType2Outlet frame];
    SelectEnemyType2OutletFrame.origin.x = 0.5*ScreenWidth;
    SelectEnemyType2OutletFrame.origin.y = 0.25*ScreenHeight;
    [self.EnemyIndicator1 setFrame:Enemyindicator1Frame];
    [self.EnemyIndicator2 setFrame:Enemyindicator2Frame];
    [self.SelectEnemyType1Outlet setFrame:SelectEnemyType1OutletFrame];
    [self.SelectEnemyType2Outlet setFrame:SelectEnemyType2OutletFrame];
    
    
    
    _Level++;
    
}



- (IBAction)PlayerAttack:(UIButton *)sender {
    PlayerData *data = [PlayerData sharedInstance];
    //[data setHP:[data HP]+1];
    _MonsterHP = _MonsterHP - [data AttackPower];
    _ButtonState = rand() %4;
    [self UpdateScreen];
    
}

- (IBAction)EnemyAttack:(UIButton *)sender {
    PlayerData *data = [PlayerData sharedInstance];
    [data setHP:[data HP]-_MonsterAttack];
    [self UpdateScreen];

}

- (IBAction)SelectEnemyType2:(UIButton *)sender {
    _Monstertype = 2;
    [self StartFight];
}

- (IBAction)SelectEnemyType1:(UIButton *)sender {
    _Monstertype = 1;
    [self StartFight];
}
@end
