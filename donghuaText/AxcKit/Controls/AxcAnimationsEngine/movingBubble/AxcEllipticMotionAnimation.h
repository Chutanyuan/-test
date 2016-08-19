//
//  Axc动画引擎封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

/*AxcEllipticMotionAnimation用来生成带有椭圆动画*/

#import <QuartzCore/QuartzCore.h>

@interface AxcEllipticMotionAnimation : CAKeyframeAnimation

+(instancetype)animationWithDuration:(CFTimeInterval)duration
                            longAxis:(double)longAxis
                           shortAxis:(double)shortAxis
                          layerFrame:(CGRect)layerFrame;

@end
