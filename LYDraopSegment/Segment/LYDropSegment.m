//
//  LYDropSegment.m
//  LYDraopSegment
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "LYDropSegment.h"

@implementation LYDropSegment

+(instancetype)dropSegmentWithSuperVC:(UIViewController *)superVC{
    return  [[self alloc]initWithDropSegmentWithSuperVC:superVC];
}
-(instancetype)initWithDropSegmentWithSuperVC:(UIViewController *)superVC{
    if(self = [super init]){
        
        _superVC = superVC;
        [superVC.view addSubview:self];
        
        _topTitleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kTopTitleHeight)];
        _topTitleScrollView.backgroundColor = [UIColor greenColor];
        _topTitleScrollView.showsHorizontalScrollIndicator = NO;
        _topTitleScrollView.showsVerticalScrollIndicator = NO;
        [superVC.view addSubview:_topTitleScrollView];
        
        _dropScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, kTopTitleHeight, kScreenWidth, kScreenHeight - kTopTitleHeight)];
        _dropScrollView.backgroundColor = [UIColor whiteColor];
        _dropScrollView.showsHorizontalScrollIndicator = NO;
        _dropScrollView.showsVerticalScrollIndicator = NO;
        _dropScrollView.delegate = self;
        _dropScrollView.pagingEnabled = YES;
        [superVC.view addSubview:_dropScrollView];
        
    }
    return self;
}

-(void)setViewControllers:(NSArray<UIViewController *> *)viewControllers{
    
    _viewControllers = viewControllers;
    
    //判断标题总宽度是否大于屏幕宽度
    _titleWidth = 0;
    if(kScreenWidth < kTopTitleWidth * viewControllers.count){
        _titleWidth = kTopTitleWidth;
    }else{
        _titleWidth = kTopTitleWidth + (kScreenWidth - kTopTitleWidth * viewControllers.count) / viewControllers.count;
    }
    
    _topTitleScrollView.contentSize = CGSizeMake(_titleWidth*viewControllers.count, 0);
    _dropScrollView.contentSize = CGSizeMake(kScreenWidth*viewControllers.count, 0);
}



/**
 点击切换子控制器
 */
-(void)clickChangeVC:(UIButton *)button{
    
    CGFloat topOffsetX = _topTitleScrollView.contentOffset.x;
    topOffsetX = button.center.x - kScreenWidth/2;
    //最小移动边界
    if(topOffsetX < 0) topOffsetX = 0;
    //最大移动边界
    if(topOffsetX > _topTitleScrollView.contentSize.width - kScreenWidth) topOffsetX = _topTitleScrollView.contentSize.width - kScreenWidth;
    
    [_topTitleScrollView setContentOffset:CGPointMake(topOffsetX, 0) animated:YES];

    
    NSInteger offsetX = button.tag * kScreenWidth;
    [_dropScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}
/**
 通过点击，进行动画滑动结束后调取方法
 */
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    NSInteger index = scrollView.contentOffset.x / kScreenWidth;
    UIViewController *currentVC = _superVC.childViewControllers[index];
    
    if(currentVC.isViewLoaded) return;
    
    currentVC.view.frame = CGRectMake(scrollView.contentOffset.x, 0, kScreenWidth, CGRectGetHeight(scrollView.frame));
    [scrollView addSubview:currentVC.view];
}

/**
 通过手动拖拽，结束拖拽后调取方法
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}
@end
