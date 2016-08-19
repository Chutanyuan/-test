//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>



/**
 *  滑动或点击scoreView的回调Block
 *
 *  @param score 分数
 */
typedef void(^starScoreViewBlock)(CGFloat score);

@class AxcStarScoreView;

@protocol AxcStarScoreViewDelegate <NSObject>

- (void)AxcStarScoreView:(AxcStarScoreView *)axcStarScoreView didSelectAtNewRating:(CGFloat )newRating;

@end



@interface AxcStarScoreView : UIView

/**
 *  初始化方法
 *
 *  @param singleWH  每个星星的宽度
 *  @param margin    星星之间的距离
 *  @param starCount 星星的个数
 *  @param superView 被添加到的父控件
 */
+ (instancetype)starScoreViewWithSingleStarWH:(CGFloat)singleWH starMargin:(CGFloat)margin starCount:(NSInteger)starCount addedTo:(UIView *)superView;


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

/**
 *  分数
 */
@property (nonatomic, assign) CGFloat score;

/**
 *  满值分数，默认为10
 */
@property (nonatomic, assign) CGFloat maxScore;
/**
 *  halfMode 为NO 则根据score对应的百分比填充 为YES 则只显示一半填充或者全部填充
 */
@property (nonatomic, assign) BOOL halfMode;
/**
 *  是否允许用户手动进行滑动改变score的值
 */
@property (nonatomic, assign) BOOL isAllowTouch;
/**
 *  改变score的值的回调block
 */
@property (nonatomic, copy) starScoreViewBlock scoreBlock;
/**
 *  回调代理
 */
@property(nonatomic,strong)id <AxcStarScoreViewDelegate> delegate;

@end
