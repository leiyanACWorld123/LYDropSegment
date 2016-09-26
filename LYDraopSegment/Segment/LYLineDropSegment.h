//
//  LYLineDropSegment.h
//  LYDraopSegment
//
/*
 *
 *   下划线样式
 *
 ****/

#import "LYDropSegment.h"
#import "LYCustomAndLineProtocol.h"

@interface LYLineDropSegment : LYDropSegment<LYCustomAndLineProtocol>

@property (nonatomic,strong) UIColor *lineColor;
@end
