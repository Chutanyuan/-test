//
//  UIView+LNTouchs.h
//  LNViewTouchsExample
//
//  Created by 林洁 on 16/1/25.
//  Copyright © 2016年 onlylin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AxcTouchTap.h"
#import "AxcTouchLongPress.h"
#import "AxcTouchSwipe.h"
#import "AxcTouchPan.h"

@interface UIView (LNTouchs)

/**
 *  点击
 */
@property (nonatomic, strong) AxcTouchTap *tap;
/**
 *  长按
 */
@property (nonatomic, strong) AxcTouchLongPress *longPress;
/**
 *  向左滑动
 */
@property (nonatomic, strong) AxcTouchSwipe *swipeLeft;
/**
 *  向右滑动
 */
@property (nonatomic, strong) AxcTouchSwipe *swipeRight;
/**
 *  向上滑动
 */
@property (nonatomic, strong) AxcTouchSwipe *swipeUp;
/**
 *  向下滑动
 */
@property (nonatomic, strong) AxcTouchSwipe *swipeDown;
/**
 *  拖动
 */
@property (nonatomic, strong) AxcTouchPan *pan;

@end
