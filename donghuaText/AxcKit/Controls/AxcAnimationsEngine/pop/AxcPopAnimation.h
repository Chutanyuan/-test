//
//  Axc动画引擎封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface AxcPopAnimation : CAKeyframeAnimation

//返回参数已经配置好的弹动
+(instancetype)pop;

+(instancetype)popAnimationWithKeyPath:(NSString *)keyPath
                           duration:(CFTimeInterval)duration
                            damping:(double)damping
                           velocity:(double)velocity
                          fromValue:(double)fromValue
                            toValue:(double)toValue;

@end
