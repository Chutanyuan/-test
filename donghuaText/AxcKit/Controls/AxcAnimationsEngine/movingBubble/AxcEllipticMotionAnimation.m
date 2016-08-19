//
//  Axc动画引擎封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "AxcEllipticMotionAnimation.h"

@implementation AxcEllipticMotionAnimation

+(instancetype)animationWithDuration:(CFTimeInterval)duration
                            longAxis:(double)longAxis
                           shortAxis:(double)shortAxis
                          layerFrame:(CGRect)layerFrame
{
    AxcEllipticMotionAnimation *ellipticAnmation = [self.class animationWithKeyPath:@"position"];
    
    ellipticAnmation.removedOnCompletion = NO;
    ellipticAnmation.fillMode = kCAFillModeBackwards;
    ellipticAnmation.duration = duration;
    ellipticAnmation.calculationMode = kCAAnimationPaced;
    ellipticAnmation.repeatCount = MAXFLOAT;
    
    CGMutablePathRef ellipticPath = CGPathCreateMutable();
    
    CGPathAddEllipseInRect(ellipticPath, NULL, CGRectMake(layerFrame.size.width/2-longAxis/2, layerFrame.size.height/2-shortAxis/2, longAxis, shortAxis));
    ellipticAnmation.path = ellipticPath;
    CGPathRelease(ellipticPath);
    ellipticAnmation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    return ellipticAnmation;
}

@end
