//
//  LYCustomDropSegment.m
//  LYDraopSegment
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "LYCustomDropSegment.h"
@interface LYCustomDropSegment()
{
    
}
@end
@implementation LYCustomDropSegment

-(void)setViewControllers:(NSArray<UIViewController *> *)viewControllers{
    
    [super setViewControllers:viewControllers];
       
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [_superVC addChildViewController:obj];
        UIButton *titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(idx*_titleWidth, 0, _titleWidth, kTopTitleHeight)];
        titleBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
        titleBtn.tag = idx;
        [titleBtn setTitle:obj.title forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [_topTitleScrollView addSubview:titleBtn];
        [titleBtn addTarget:self action:@selector(clickChange:) forControlEvents:UIControlEventTouchUpInside];
    
        [self.buttons addObject:titleBtn];
    }];
    
    //默认显示第0个子控制器
    [self scrollViewDidEndScrollingAnimation:_dropScrollView];
}



/**
 点击切换子控制器
 */
-(void)clickChange:(UIButton *)btn{
    [super clickChangeVC:btn];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [super scrollViewDidEndScrollingAnimation:scrollView];
    
    NSInteger index = scrollView.contentOffset.x / kScreenWidth;
    UIButton *button = _topTitleScrollView.subviews[index];
    CGFloat topOffsetX = _topTitleScrollView.contentOffset.x;
    topOffsetX = button.center.x - kScreenWidth/2;
    //最小移动边界
    if(topOffsetX < 0) topOffsetX = 0;
    //最大移动边界
    if(topOffsetX > _topTitleScrollView.contentSize.width - kScreenWidth) topOffsetX = _topTitleScrollView.contentSize.width - kScreenWidth;
    
    [_topTitleScrollView setContentOffset:CGPointMake(topOffsetX, 0) animated:YES];
    
//    [self changeCurrentSelectObj:index];
}

//-(void)changeCurrentSelectObj:(NSInteger)index{
//    if(index == 0){
//        UIButton *button = _topTitleScrollView.subviews[index];
//        UIButton *button1 = _topTitleScrollView.subviews[index+1];
//        button.selected = YES;
//        button1.selected = NO;
//    }else if (index > 0 && index < self.viewControllers.count - 1){
//        UIButton *button1 = _topTitleScrollView.subviews[index - 1];
//        UIButton *button2 = _topTitleScrollView.subviews[index + 1];
//        UIButton *button = _topTitleScrollView.subviews[index];
//        button.selected = YES;
//        button1.selected = NO;
//        button2.selected = NO;
//    }else{
//        UIButton *button1 = _topTitleScrollView.subviews[index - 1];
//        UIButton *button = _topTitleScrollView.subviews[index];
//        button.selected = YES;
//        button1.selected = NO;
//    }
//}

#pragma mark Set
-(void)setFontSize:(CGFloat)fontSize{
    [_topTitleScrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[UIButton class]]){
            UIButton *btn = obj;
            btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        }
    }];
}
@end
