//
//  LYHollowDropSegment.h
//  LYDraopSegment
//
/*
 *
 *   镂空样式
 *
 ****/

#import "LYDropSegment.h"

@interface LYHollowDropSegment : LYDropSegment

/**
 *  选中状态下，字体颜色
 */
@property (nonatomic,strong) UIColor *selectedTitleColor;
/**
 *  选中状态下，背景色
 */
@property (nonatomic,strong) UIColor *selectedBackground;
/**
 *  选中状态下，字体
 */
@property (nonatomic,assign) CGFloat selectedFontSize;

@end
