//
//  LYHollowDropSegment.m
//  LYDraopSegment
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "LYHollowDropSegment.h"
@interface LYHollowDropSegment()
{
    UIView *_clipView;
    UIView *_maskView;
}
@end
@implementation LYHollowDropSegment

-(void)setViewControllers:(NSArray<UIViewController *> *)viewControllers{
    
    [super setViewControllers:viewControllers];
    
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [_superVC addChildViewController:obj];
        UIButton *titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(idx*_titleWidth, 0, _titleWidth, kTopTitleHeight)];
        titleBtn.tag = idx;
        titleBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
        [titleBtn setTitle:obj.title forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_topTitleScrollView addSubview:titleBtn];
        [titleBtn addTarget:self action:@selector(clickChange:) forControlEvents:UIControlEventTouchUpInside];
    }];
    
    _clipView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,_titleWidth,kTopTitleHeight)];
    _clipView.backgroundColor = [UIColor clearColor];
    _clipView.clipsToBounds = YES;
    [_topTitleScrollView addSubview:_clipView];
    
    _maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _topTitleScrollView.contentSize.width,kTopTitleHeight)];
    _maskView.backgroundColor = [UIColor redColor];
    [_clipView addSubview:_maskView];

    [viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [_superVC addChildViewController:obj];
        UIButton *titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(idx*_titleWidth, 0, _titleWidth, kTopTitleHeight)];
        titleBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
        titleBtn.tag = idx;
        [titleBtn setTitle:obj.title forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        titleBtn.backgroundColor = [UIColor clearColor];
        [_maskView addSubview:titleBtn];
        [titleBtn addTarget:self action:@selector(clickChange:) forControlEvents:UIControlEventTouchUpInside];
    }];

    
    //默认显示第0个子控制器
    [self scrollViewDidEndScrollingAnimation:_dropScrollView];
}


/**
 点击切换子控制器
 */
-(void)clickChange:(UIButton *)btn{
    [super clickChangeVC:btn];
    [UIView animateWithDuration:0.35 animations:^{
        _clipView.frame = CGRectMake(btn.tag*_titleWidth, 0, _clipView.frame.size.width, _clipView.frame.size.height);
        _maskView.frame = CGRectMake(-btn.tag*_titleWidth, 0, _maskView.frame.size.width, _maskView.frame.size.height);
    }];

}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [super scrollViewDidEndScrollingAnimation:scrollView];
}
#pragma mark Set
-(void)setFontSize:(CGFloat)fontSize{
    [_topTitleScrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[UIButton class]]){
            UIButton *btn = obj;
            btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        }
    }];
}

-(void)setTitleColor:(UIColor *)titleColor{
    [_topTitleScrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[UIButton class]]){
            UIButton *btn = obj;
            [btn setTitleColor:titleColor forState:UIControlStateNormal];
        }
    }];
}

-(void)setSelectedFontSize:(CGFloat)selectedFontSize{
    [_maskView.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.titleLabel.font = [UIFont systemFontOfSize:selectedFontSize];
    }];
}
-(void)setSelectedBackground:(UIColor *)selectedBackground{
    _maskView.backgroundColor = selectedBackground;
}
-(void)setSelectedTitleColor:(UIColor *)selectedTitleColor{
    [_maskView.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setTitleColor:selectedTitleColor forState:UIControlStateNormal];
    }];
}
@end
