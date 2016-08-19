//
//  Axc动画引擎封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface AxcAnimationClock : CAKeyframeAnimation

//value must between [0,1]
+(instancetype)clock2value:(CGFloat)value;

//fromValue,endValue must between [0,1]
+(instancetype)clockAnimationWithFromValue:(CGFloat)fromValue endValue:(CGFloat)endValue damping:(double)dampig;

@end
