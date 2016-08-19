//
//  Axc动画引擎封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "AxcSpringFlipperAnimation.h"
#import "AxcTimingFunctionMath.h"
#import <UIKit/UIKit.h>

typedef struct {
    char *keyPath;
    double duration;
    double fromValue;
    double toValue;
    double damping;
    double velocity;
} SpringFlipperAnimationParams;

//数值常量
SpringFlipperAnimationParams const springFlipperParams = (SpringFlipperAnimationParams){
    .keyPath = "transform.rotation.y",
    .duration = 1.2,
    .fromValue = 0.0,
    .toValue = M_PI,
    .damping = 0.3,
    .velocity = 1.2,
};

static const u_long kNumberOfPoints = 500;
static const double kDampingMutiplier = 10;
static const double kVelocityMutiplier = 10;

@implementation AxcSpringFlipperAnimation

+(instancetype)springFlipper
{
    return [self.class animationWithClangKeyPath:springFlipperParams.keyPath
                                        duration:springFlipperParams.duration
                                         damping:springFlipperParams.damping
                                        velocity:springFlipperParams.velocity
                                       fromValue:springFlipperParams.fromValue
                                         toValue:springFlipperParams.toValue];
}

+(instancetype)animationWithKeyPath:(NSString *)keyPath
                            duration:(CFTimeInterval)duration
                             damping:(double)damping
                            velocity:(double)velocity
                           fromValue:(double)fromValue
                             toValue:(double)toValue
{
    AxcSpringFlipperAnimation *animation = [self.class animationWithKeyPath:keyPath];
    
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = duration;
    animation.values = [self animationValuesFromValue:fromValue
                                              toValue:toValue
                                          withDamping:damping
                                          andVelocity:velocity];
    return animation;
}

+(instancetype)animationWithClangKeyPath:(char *)keyPath
                                 duration:(CFTimeInterval)duration
                                  damping:(double)damping
                                 velocity:(double)velocity
                                fromValue:(double)fromValue
                                  toValue:(double)toValue
{
    return [self.class animationWithKeyPath:[NSString stringWithUTF8String:keyPath] duration:duration damping:damping velocity:velocity fromValue:fromValue toValue:toValue];
}

#pragma mark - 计算关键帧值相关
+(NSArray *)animationValuesFromValue:(double)fromValue
                              toValue:(double)toValue
                          withDamping:(double)damping
                          andVelocity:(double)velocity
{
    NSMutableArray *values = [NSMutableArray new];
    CGFloat distanceBetweenValues = toValue - fromValue;
    velocity *= kVelocityMutiplier;
    damping *= kDampingMutiplier;
    
    for (double i = 0; i < kNumberOfPoints; ++i) {
        double x = i / kNumberOfPoints;
        double normalizedValue = [AxcTimingFunctionMath dampValueWithBasicValue:x damping:damping velocity:velocity];
        double value = toValue - distanceBetweenValues * normalizedValue;
        [values addObject:@(value)];
    }

    [values addObject:@(toValue)];
    
    return [NSArray arrayWithArray:values];
}

@end
