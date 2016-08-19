//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef enum {
    AxcLabelAnimationTypeNormal = 0,
    AxcLabelAnimationTypeWave   = 1
}AxcLabelAnimationType;

@interface AxcLabelAnimation : UILabel
@property (nonatomic, copy) NSString           *text;
@property (nonatomic, copy) NSAttributedString *attributedText;

@property (nonatomic, assign) AxcLabelAnimationType type;

@property (nonatomic, assign) CGFloat    animationHeight;
@property (nonatomic, assign) NSUInteger rate; // 1 is fastest 10 is slowest, default is 2
@property (nonatomic, assign) CGFloat    kerning;

- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text;
- (instancetype)initWithFrame:(CGRect)frame attributedText:(NSAttributedString *)attributedText;

- (void)startAnimation;
- (void)pauseAnimation;
- (void)stopAnimation;

@end
