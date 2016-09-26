//
//  LYCustomDropSegment.m
//  LYDraopSegment
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "LYCustomDropSegment.h"
#import "LYDropSeg.h"
@interface LYCustomDropSegment(){
    UIViewController *_superVC;
}

@property (nonatomic,strong) UIScrollView *dropScrollView;

@end
@implementation LYCustomDropSegment

+(instancetype)dropSegmentWithSuperVC:(UIViewController *)superVC{
    return  [[self alloc]initWithDropSegmentWithSuperVC:superVC];
}
-(instancetype)initWithDropSegmentWithSuperVC:(UIViewController *)superVC{
    if(self = [super init]){
        _superVC = superVC;
        
    }
    return self;
}


-(void)setViewControllers:(NSArray<UIViewController *> *)viewControllers{
    
}
@end
