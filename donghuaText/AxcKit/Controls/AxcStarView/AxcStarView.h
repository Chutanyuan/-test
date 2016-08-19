//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AxcStarView : UIView
/**
 *  半径
 */
@property (nonatomic, assign) CGFloat radius;
/**
 *  填充颜色 默认橙色
 */
@property (nonatomic, strong) UIColor *fillColor;
/**
 *  线条颜色 默认是灰色
 */
@property (nonatomic, strong) UIColor *lineColor;

/**
 *  填充的percent 默认为1
 */
@property (nonatomic, assign) CGFloat percent;
/**
 *  边框线的宽度 默认1
 */
@property (nonatomic, assign) CGFloat lineWidth;
@end
