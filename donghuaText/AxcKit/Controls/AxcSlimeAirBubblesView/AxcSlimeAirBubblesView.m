//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "AxcSlimeAirBubblesView.h"
#import "CommonHeader.h"
#import "AxcSlimeDotView.h"

@interface AxcSlimeAirBubblesView()<UIGestureRecognizerDelegate>

@property (nonatomic) CGFloat maxDistance;

@property (nonatomic, strong) AxcSlimeDotView *headDot;
@property (nonatomic, strong) AxcSlimeDotView *trailDot;
@property (nonatomic, strong) CAShapeLayer *shapLayer;

@end

@implementation AxcSlimeAirBubblesView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        self.maxDistance = 180;
        
        self.shapLayer.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        self.headDot.center = self.center;
        self.trailDot.center = self.center;
        
        [self.layer addSublayer: self.shapLayer];
        [self addSubview: self.trailDot];
        [self addSubview: self.headDot];    // 注意加入顺序
        
        UIPanGestureRecognizer *panGestrue = [[UIPanGestureRecognizer alloc] initWithTarget: self
                                                                                     action: @selector(panHeadDot:)];
        panGestrue.delegate = self;
        [self.headDot addGestureRecognizer: panGestrue];
        
    }
    return self;
}

#pragma mark - 计算圆心距
- (CGFloat) getDistanceBetweenDots {
    CGFloat x1 = self.trailDot.center.x;
    CGFloat y1 = self.trailDot.center.y;
    CGFloat x2 = self.headDot.center.x;
    CGFloat y2 = self.headDot.center.y;
    
    CGFloat distance = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
    
    return distance;
}

#pragma mark - 绘制贝塞尔图形
- (void) reloadBeziePath {
    CGFloat r1 = self.trailDot.frame.size.width / 2.0f;
    CGFloat r2 = self.headDot.frame.size.width / 2.0f;
    
    CGFloat x1 = self.trailDot.center.x;
    CGFloat y1 = self.trailDot.center.y;
    CGFloat x2 = self.headDot.center.x;
    CGFloat y2 = self.headDot.center.y;
    
    CGFloat distance = sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
    
    CGFloat sinDegree = (x2 - x1) / distance;
    CGFloat cosDegree = (y2 - y1) / distance;
    
    CGPoint pointA = CGPointMake(x1 - r1 * cosDegree, y1 + r1 * sinDegree);
    CGPoint pointB = CGPointMake(x1 + r1 * cosDegree, y1 - r1 * sinDegree);
    CGPoint pointC = CGPointMake(x2 + r2 * cosDegree, y2 - r2 * sinDegree);
    CGPoint pointD = CGPointMake(x2 - r2 * cosDegree, y2 + r2 * sinDegree);
    CGPoint pointN = CGPointMake(pointB.x + (distance / 2) * sinDegree, pointB.y + (distance / 2) * cosDegree);
    CGPoint pointM = CGPointMake(pointA.x + (distance / 2) * sinDegree, pointA.y + (distance / 2) * cosDegree);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint: pointA];
    [path addLineToPoint: pointB];
    [path addQuadCurveToPoint: pointC controlPoint: pointN];
    [path addLineToPoint: pointD];
    [path addQuadCurveToPoint: pointA controlPoint: pointM];
    
    self.shapLayer.path = path.CGPath;
}

#pragma mark - 贝塞尔图像破裂动画
- (void) layerBroke {
    self.shapLayer.path = nil;
    [UIView animateWithDuration: 0.7f
                          delay: 0
         usingSpringWithDamping: 0.2
          initialSpringVelocity: 0
                        options: UIViewAnimationOptionBeginFromCurrentState
                     animations: ^{
                         self.trailDot.transform = CGAffineTransformMakeScale(1, 1);
                     }
                     completion:^(BOOL finished) {
        
    }];
}

#pragma mark - 还原到原位置
- (void)placeHeadDot {
    [UIView animateWithDuration: 0.5f
                          delay: 0
         usingSpringWithDamping: 0.5
          initialSpringVelocity: 0
                        options: UIViewAnimationOptionBeginFromCurrentState
                     animations: ^{
                         self.headDot.center = self.center;
                     }
                     completion: ^(BOOL finished) {
        
    }];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if ([_delegate respondsToSelector:@selector(dragDropBegan)]) {
        [_delegate dragDropBegan];
    }    return YES;
}
#pragma mark - 编写手势
- (void) panHeadDot: (UIPanGestureRecognizer *) panGesture {
 
    switch (panGesture.state) {
        case UIGestureRecognizerStateChanged: {
            // 记录手势位置
            CGPoint location = [panGesture locationInView: self.headDot.superview];
            // headDot跟随手指
            self.headDot.center = location;
            // 计算圆心距
            CGFloat distance = [self getDistanceBetweenDots];
            if ([_delegate respondsToSelector:@selector(dragDropChange)]) {
                [_delegate dragDropChange];
            }
            if (distance < self.maxDistance) {
                // 模拟当headDot移走后，trailDot按照圆心距变小
                // 当距离太远时，就不再发生改变
                CGFloat scale = (1 - distance / self.maxDistance);
                scale = MAX(TRAILDOT_SCALE_MIN, scale);
                self.trailDot.transform = CGAffineTransformMakeScale(scale, scale);
                
                [self reloadBeziePath];
            } else {
                [self layerBroke];
            }
            break;
        }
        
        case UIGestureRecognizerStateEnded: {
            // 彻底破裂
            if ([_delegate respondsToSelector:@selector(dragDropEnding)]) {
                [_delegate dragDropEnding];
            }
            CGFloat distance = [self getDistanceBetweenDots];
            if (distance >= self.maxDistance) {
                if ([_delegate respondsToSelector:@selector(dragDropBreak)]) {
                    [_delegate dragDropBreak];
                }
            }else{
                [self layerBroke];
                [self placeHeadDot];

            }
            break;
        }
            
        default:
            break;
    }
}

#pragma mark - 懒加载
- (AxcSlimeDotView *) headDot {
    if (!_headDot) {
        _headDot = [[AxcSlimeDotView alloc] initWithFrame: CGRectMake(0, 0, HEADDOT_W, HEADDOT_W)];
    }
    return _headDot;
}

- (AxcSlimeDotView *) trailDot {
    if (!_trailDot) {
        _trailDot = [[AxcSlimeDotView alloc] initWithFrame: CGRectMake(0, 0, TRAILDOT_W_MAX, TRAILDOT_W_MAX)];
    }
    return _trailDot;
}

- (CAShapeLayer *) shapLayer {
    if (!_shapLayer) {
        _shapLayer = [CAShapeLayer layer];
        _shapLayer.fillColor = DGThemeColor.CGColor;
        _shapLayer.anchorPoint = CGPointMake(0, 0);
        _shapLayer.position = CGPointMake(0, 0);
    }
    return _shapLayer;
}

@end
