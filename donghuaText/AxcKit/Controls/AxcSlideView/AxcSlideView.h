//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IndexSec indexPath.section
#define IndexRow indexPath.row

#define ScreenBounds    [UIScreen mainScreen].bounds                         //返回屏幕Bounds
#define ScreenOrigin    ScreenBounds.origin                                 //返回屏幕原点
#define ScreenSize      ScreenBounds.size                                   //返回屏幕尺寸
#define ScreenOriginX   ScreenOrigin.x                                      //返回屏幕原点坐标X
#define ScreenOriginY   ScreenOrigin.y                                      //返回屏幕原点坐标Y
#define ScreenWidth     ScreenSize.width                                    //返回屏幕宽度
#define ScreenHeight    ScreenSize.height                                   //返回屏幕高度


typedef void(^LeftViewBlock)(NSInteger indexRow);

@class AxcSlideView;

@protocol AxcSlideViewDelegate <NSObject>

- (void)axcSlideView:(AxcSlideView *)axcSlideView didSelectAtIndex:(NSInteger )index;

@end

@interface AxcSlideView : UIView


@property (nonatomic,copy)LeftViewBlock leftBlock;

@property(nonatomic,weak)id <AxcSlideViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame superView:(UIView *)superView;

- (void)handle:(LeftViewBlock)block;
- (void)leftViewShow:(BOOL)show;

@end
