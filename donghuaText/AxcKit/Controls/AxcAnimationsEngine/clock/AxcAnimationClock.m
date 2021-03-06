//
//  Axc动画引擎封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "AxcAnimationClock.h"
#import "AxcTimingFunctionMath.h"

typedef struct {
    char *keyPath;
    double duration;
    double fromValue;
    double toValue;
    double tension;
    double velocity;
} ClockAnimationParams;

//数值常量
ClockAnimationParams const clockParams = (ClockAnimationParams){
    .keyPath = "layerStrokeAnimation",
    .duration = 0.8,
    .fromValue = 0.0,
    .toValue = M_PI,
    .tension = 5,
    .velocity = 0.4,
};

static const u_long kPopNumberOfPoints = 100;
static const double kPopVelocityMutiplier = 10;

@implementation AxcAnimationClock

+(instancetype)clock2value:(CGFloat)value
{
    return [self.class animationWithClangKeyPath:clockParams.keyPath
                                        duration:clockParams.duration
                                         tension:clockParams.tension
                                        velocity:clockParams.velocity
                                       fromValue:clockParams.fromValue
                                         toValue:clockParams.toValue];
}

+(instancetype)clockAnimationWithFromValue:(CGFloat)fromValue endValue:(CGFloat)endValue damping:(double)dampig
{
    AxcAnimationClock *animation = [self.class animationWithKeyPath:@"layerStrokeAnimation"];
    
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = clockParams.duration;
    animation.values = [self animationValuesFromValue:fromValue
                                              toValue:endValue
                                          withTension:clockParams.tension
                                          andVelocity:dampig];
    return animation;
}

+(instancetype)animationWithClangKeyPath:(char *)keyPath
                                duration:(CFTimeInterval)duration
                                 tension:(double)tension
                                velocity:(double)velocity
                               fromValue:(double)fromValue
                                 toValue:(double)toValue
{
    return [self.class clockAnimationWithFromValue:fromValue endValue:toValue damping:tension];
}

#pragma mark - 计算关键帧值相关
+(NSArray *)animationValuesFromValue:(double)fromValue
                             toValue:(double)toValue
                         withTension:(double)tension
                         andVelocity:(double)velocity
{
    NSMutableArray *values = [NSMutableArray new];
    velocity *= kPopVelocityMutiplier;
    
    for (double i = 1; i < kPopNumberOfPoints + 1; ++i) {
        double x = i / kPopNumberOfPoints;
        double value = [AxcTimingFunctionMath dampValueWithBasicValue:x damping:tension velocity:tension];
        [values addObject:@(value)];
    }
    
    return [NSArray arrayWithArray:values];
}

@end
