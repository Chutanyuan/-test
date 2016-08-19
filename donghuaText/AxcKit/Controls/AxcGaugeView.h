//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AxcGaugeView : UIView

@property (nonatomic,assign) float value;
@property (nonatomic,assign) float minValue;
@property (nonatomic,assign) float maxValue;
@property (nonatomic,strong) UIColor *startColor;
@property (nonatomic,strong) UIColor *endColor;
//刻度线数
@property (nonatomic,assign) int count;
//开始角度
@property (nonatomic,assign) CGFloat startAngle;
//结束角度
@property (nonatomic,assign) CGFloat endAngle;
//圆弧线宽
@property (nonatomic,assign) CGFloat lineWidth;
//底部标志文字
@property (nonatomic,copy) NSString *buttomString;

@end
