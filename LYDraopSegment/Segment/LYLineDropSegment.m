//
//  LYLineDropSegment.m
//  LYDraopSegment
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "LYLineDropSegment.h"

@interface LYLineDropSegment()
{
    UIView *_lineView;
}
@end
@implementation LYLineDropSegment

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
        
        
    }];
    
    _lineView = [[UIView alloc]init];
    _lineView.backgroundColor = [UIColor redColor];
    [_topTitleScrollView addSubview:_lineView];
    _lineView.frame = CGRectMake(0, kTopTitleHeight-kTopLineHeight, kTopTitleWidth, kTopLineHeight);

    
    [self scrollViewDidEndScrollingAnimation:_dropScrollView];

}


-(void)clickChange:(UIButton *)btn{
    [super clickChangeVC:btn];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [super scrollViewDidEndScrollingAnimation:scrollView];
    NSInteger index = scrollView.contentOffset.x / kScreenWidth;
//    [self changeCurrentSelectObj:index];
    
    UIButton *button = _topTitleScrollView.subviews[index];
    CGFloat topOffsetX = _topTitleScrollView.contentOffset.x;
    topOffsetX = button.center.x - kScreenWidth/2;
    //最小移动边界
    if(topOffsetX < 0) topOffsetX = 0;
    //最大移动边界
    if(topOffsetX > _topTitleScrollView.contentSize.width - kScreenWidth) topOffsetX = _topTitleScrollView.contentSize.width - kScreenWidth;
    
    [_topTitleScrollView setContentOffset:CGPointMake(topOffsetX, 0) animated:YES];

    [UIView animateWithDuration:0.35 animations:^{
        _lineView.frame = CGRectMake(index*_titleWidth, kTopTitleHeight-kTopLineHeight, kTopTitleWidth, kTopLineHeight);
    }];
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

-(void)setLineColor:(UIColor *)lineColor{
    _lineView.backgroundColor = lineColor;
}

@end
