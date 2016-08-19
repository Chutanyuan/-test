//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AxcCycleView;

@protocol AxcCycleViewDelegate <NSObject>

- (UIView *)AxcCycleView:(AxcCycleView *)axcCycleView atIndex:(NSInteger )index;

- (void)AxcCycleView:(AxcCycleView *)axcCycleView didSelectAtIndex:(NSInteger)index;

@end

@interface AxcCycleView : UIView

- (instancetype)initWithFrame:(CGRect)frame Content:(NSInteger )conten addTaget:(id)taget;

@property(nonatomic,weak)id <AxcCycleViewDelegate> delegate;

@property(nonatomic,assign)    NSInteger conten;
;

// 停止
- (void)stopAnimation;

/**
 *  开始启动
 *
 *  @param timeInterval 时间间隔
 *  @param repeat       YES
 */
- (void)startAnimationWithTimerInterval:(NSTimeInterval)timeInterval repeat:(BOOL)repeat;

@end
