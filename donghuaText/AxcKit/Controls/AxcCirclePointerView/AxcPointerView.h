//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AxcPointerView : UIView
/**
 *  转动指针
 *
 *  @param percent       （0-100）
 *  @param animationTime 动画时间
 */
-(void)updatePointer:(NSInteger)percent withAnimationTime:(CGFloat)animationTime;
/**
 *  恢复原位置
 */
-(void)clear;
@end
