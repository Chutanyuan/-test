//
//  UIView+AutoresizingMask.h
//  AxcKit Text Demo
//
//  Created by Axc_5324 on 16/6/20.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AutoresizingMask)

/**
 *  左右距离按比例增减
 */
- (void)axcAutoresizingMaskLeftAndRight;

/**
 *  上下距离按比例增减
 */
- (void)axcAutoresizingMaskTopAndBottom;

/**
 *  上下左右全方位按比例增减
 */
- (void)axcAutoresizingMaskComprehensive;

/**
 *  宽高按比例增减
 */
- (void)axcAutoresizingMaskWideAndHigh;


@end
