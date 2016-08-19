//
//  Axc动画引擎封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AxcTimingFunctionMath : NSObject

+(double)dampValueWithBasicValue:(double)value damping:(double)damping velocity:(double)velocity;

+(double)popValueWithBasicValue:(double)value velocity:(double)velocity;

+(double)shakeValueWithBasicValue:(double)value tension:(double)tension velocity:(double)velocity;

@end
