//
//  ViewController.m
//  LYDraopSegment
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"
#import "SevenViewController.h"
#import "EightViewController.h"

#import "LYContants.h"

@interface ViewController ()

@end

@implementation ViewController
-(BOOL)prefersStatusBarHidden{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    FirstViewController *firstVC = [[FirstViewController alloc]init];
    firstVC.title = @"第一页";
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    secondVC.title = @"第二页";
    ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
    thirdVC.title = @"第三页";
    FourViewController *fourVC = [[FourViewController alloc]init];
    fourVC.title = @"第四页";
    FiveViewController *fiveVC = [[FiveViewController alloc]init];
    fiveVC.title = @"第五页";
    SixViewController *sixVC = [[SixViewController alloc]init];
    sixVC.title = @"第六页";
    SevenViewController *sevenVC = [[SevenViewController alloc]init];
    sevenVC.title = @"第七页";
    EightViewController *eightVC = [[EightViewController alloc]init];
    eightVC.title = @"第八页";

    LYLineDropSegment *dropSegment = [LYLineDropSegment dropSegmentWithSuperVC:self];
    dropSegment.viewControllers = @[firstVC,secondVC,thirdVC,fourVC,fiveVC,sixVC,sevenVC,eightVC];
    dropSegment.fontSize = 15.f;
//    dropSegment.selectedBackground = [UIColor purpleColor];
//    dropSegment.selectedFontSize = 20.f;
//    dropSegment.selectedTitleColor = [UIColor yellowColor];
}
@end
