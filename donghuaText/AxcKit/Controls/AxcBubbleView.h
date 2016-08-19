//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CleanMessageBlock)(BOOL);

@class AxcBubbleView;

@protocol AxcBubbleViewDelegate <NSObject>

- (void)axcBubbleViewCleanMessage:(AxcBubbleView *)axcBubbleView isClear:(BOOL)isClear;

@end


@interface AxcBubbleView : UIView

@property(nonatomic,)id <AxcBubbleViewDelegate> delegate;

@property (nonatomic, copy) CleanMessageBlock cleanMessageBlock;
/**
 *  显示未读数Label
 */
@property (nonatomic, strong) UILabel *unReadLabel;
/**
 *  气泡颜色
 */
@property (nonatomic, strong) UIColor *bubbleColor;
/**
 *  拉伸系数，取值（0~1），系数越大，拉伸距离越长。
 */
@property (nonatomic, assign) CGFloat decayCoefficent;
/**
 *  初始化bubbleView
 *
 *  @param centerPoint 中心点坐标
 *  @param radius      半径
 *  @param superView   父视图
 *
 *  @return 实例对象
 */
- (instancetype)initWithCenterPoint:(CGPoint)centerPoint bubleRadius:(CGFloat)radius addToSuperView:(UIView *)superView;
- (void)hidenBubbleView;
- (void)showBubbleView;


@end
