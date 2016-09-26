//
//  LYDropSegment.h
//  LYDraopSegment
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYDropSeg.h"

typedef enum {
    DropSegTypeDefault,
    DropSegTypeLine
}DropSegType;

@interface LYDropSegment : UIView<UIScrollViewDelegate>
{
    UIViewController *_superVC;//父控制器
    UIScrollView *_topTitleScrollView;//按钮视图
    UIScrollView *_dropScrollView;//内容视图
    CGFloat _titleWidth;//每个按钮的宽度
}

+(instancetype)dropSegmentWithSuperVC:(UIViewController *)superVC;


//所有子控制器
@property (nonatomic,strong) NSArray<UIViewController *> *viewControllers;

@property (nonatomic,strong) NSMutableArray<UIButton *> *buttons;

//normal - 字体大小
@property (nonatomic,assign) CGFloat fontSize;

//normal - 字体颜色
@property (nonatomic,strong) UIColor *titleColor;

//点击切换子控制器方法
-(void)clickChangeVC:(UIButton *)button;


@end
