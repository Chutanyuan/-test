//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AxcCycleTextView : UIView

// default is 25
// 梯度宽度
@property (assign, nonatomic) CGFloat gradientWidth;

///default is 20
// 间距
@property (assign, nonatomic) CGFloat spacing;

///default is 50
// 速度 默认50
@property (assign, nonatomic) CGFloat velocity;

//default is 4
// 轮播一次后的时间间隔
@property (assign, nonatomic) NSTimeInterval timeInterval;

///default is system font ,size 26
@property (strong, nonatomic) UIFont *font;

///default is [UIColor whiteColor]

@property (strong, nonatomic) UIColor *textColor;


@property (strong, nonatomic) NSString *text;

@end
