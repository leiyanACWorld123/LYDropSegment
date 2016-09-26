//
//  LYCustomDropSegment.h
//  LYDraopSegment
/*
 *
 *   普通版
 *
 ****/

#import <UIKit/UIKit.h>

@interface LYCustomDropSegment : UIView

+(instancetype)dropSegmentWithSuperVC:(UIViewController *)superVC;

@property (nonatomic,strong) NSArray<UIViewController *> *viewControllers;

@end
