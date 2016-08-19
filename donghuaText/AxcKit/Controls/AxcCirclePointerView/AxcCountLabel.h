//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AxcCountLabel : UILabel
/**
 *  更新数据
 *
 *  @param percent （0-100）
 */
-(void)updateLabel:(NSInteger)percent withAnimationTime:(CGFloat)animationTime;
/**
 *  恢复原位置
 */
-(void)clear;
@end
