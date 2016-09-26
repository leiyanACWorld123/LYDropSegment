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

#import "LYCustomDropSegment.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FirstViewController *firstVC = [[FirstViewController alloc]init];
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
    
//    [self addChildViewController:firstVC];
//    [self addChildViewController:secondVC];
//    [self addChildViewController:thirdVC];

    [self.view addSubview:firstVC.view];
    [self.view addSubview:secondVC.view];
    [self.view addSubview:thirdVC.view];

}
@end
