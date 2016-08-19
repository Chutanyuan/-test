//
//  Axc动画引擎封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "AxcEllipticAnimationButton.h"
#import "AxcEllipticMotionAnimation.h"

@implementation AxcEllipticAnimationButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSublayers];
    }
    return self;
}

-(void)setupSublayers
{
    //下层
    CALayer *bottomLayer = [CALayer layer];
    bottomLayer.frame = self.bounds;
    bottomLayer.contents = (__bridge id)([ UIImage imageNamed:@"testImage"].CGImage);
    [self.layer addSublayer:bottomLayer];
    
    AxcEllipticMotionAnimation *topAnimation = [AxcEllipticMotionAnimation animationWithDuration:3 longAxis:3 shortAxis:2 layerFrame:self.frame];
    
    [bottomLayer addAnimation:topAnimation forKey:nil];
    //下层
    CALayer *topLayer = [CALayer layer];
    topLayer.frame = self.bounds;
    topLayer.contents = (__bridge id)([ UIImage imageNamed:@"topLayer"].CGImage);
    [self.layer addSublayer:topLayer];
    
    AxcEllipticMotionAnimation *bottomAnimation = [AxcEllipticMotionAnimation animationWithDuration:3.5 longAxis:3.5 shortAxis:2.5 layerFrame:self.frame];
    
    [topLayer addAnimation:bottomAnimation forKey:nil];
}

@end
