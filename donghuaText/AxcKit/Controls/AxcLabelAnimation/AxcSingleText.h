//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AxcSingleText : NSObject

@property (nonatomic, copy  ) NSString *text;
@property (nonatomic, strong) UIColor  *textColor;
@property (nonatomic, assign) CGFloat  animationRange;
@property (nonatomic, assign) BOOL     enumerated;

+ (instancetype)singleTextWithAnimationRange:(CGFloat)animationRange;

- (CGFloat)locationWithFirstEnumerate;

- (CGFloat)locationWithNormalAnimation;
- (void)normalReset;

- (CGFloat)locationWithWaveAnimationCompletion:(void(^)())completion;
- (void)waveReset;

@end
