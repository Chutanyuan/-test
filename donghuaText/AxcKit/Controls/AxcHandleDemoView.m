//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "AxcHandleDemoView.h"

static const NSTimeInterval duration = 1.f;
static const NSTimeInterval enlangerDuration = 0.05f;
static const NSTimeInterval shrinkDuration = 0.1f;

@interface AxcHandleDemoView ()
@property (nonatomic, strong) UIButton *handleDemoBtn;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) NSTimer *enlangerTimer;
@property (nonatomic, strong) NSTimer *shrinkTimer;
@end

@implementation AxcHandleDemoView{
    CGFloat currentScale;
    CGFloat currentMaxSide;
}

- (instancetype)initWithFrame:(CGRect)frame normalTitle:(NSString *)normalTitle HighlightedTitle:(NSString *)HighlightedTitle{
    if (self = [super initWithFrame:frame]) {
        self.bgView = [[UIView alloc]initWithFrame:CGRectMake((CGRectGetWidth(frame)-CGRectGetHeight(frame))*0.5, 0, CGRectGetHeight(frame), CGRectGetHeight(frame))];
        self.bgView.layer.cornerRadius = CGRectGetHeight(frame) / 2;
        self.bgView.hidden = YES;
        
        self.handleDemoBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        [self.handleDemoBtn setTitle:normalTitle forState:UIControlStateNormal];
        [self.handleDemoBtn setTitle:HighlightedTitle forState:UIControlStateHighlighted];
        
        [self.handleDemoBtn addTarget:self action:@selector(handleBtnTouchDownAction) forControlEvents:UIControlEventTouchDown];
        [self.handleDemoBtn addTarget:self action:@selector(handleBtnTouchUpOutsideAction) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
        
        [self addSubview:self.bgView];
        [self addSubview:self.handleDemoBtn];
    }
    return self;
}

- (void)setCompletedColor:(UIColor *)completedColor{
    self.bgView.backgroundColor = completedColor;
}
- (void)setButtonBackgroundColor:(UIColor *)buttonBackgroundColor{
    [self.handleDemoBtn setBackgroundColor:buttonBackgroundColor];
}

- (void)handleBtnTouchDownAction{
    currentMaxSide = [self calculateMaxSide];
    
    self.bgView.hidden = NO;
    self.enlangerTimer = [NSTimer scheduledTimerWithTimeInterval:enlangerDuration target:self selector:@selector(handleEnlargerAction) userInfo:nil repeats:YES];
}

- (void)handleBtnTouchUpOutsideAction{
    [self.enlangerTimer invalidate];
    self.handleDemoBtn.userInteractionEnabled = NO;
    self.shrinkTimer = [NSTimer scheduledTimerWithTimeInterval:shrinkDuration target:self selector:@selector(handleShrinkAction) userInfo:nil repeats:YES];
}

- (void)handleEnlargerAction{
    CGFloat ratio = enlangerDuration/duration;
    CGFloat bgViewRadius = self.bgView.bounds.size.height*0.5;
    currentScale += ratio*(currentMaxSide/bgViewRadius);
    self.bgView.transform = CGAffineTransformMakeScale(currentScale, currentScale);
    if (currentScale >= (currentMaxSide/bgViewRadius)) {
        [self.enlangerTimer invalidate];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(axcHandleDemoView:endTouchButton:)]) {
            [self.delegate axcHandleDemoView:self endTouchButton:self.handleDemoBtn];
        }
    }
}

- (void)handleShrinkAction{
    CGFloat ratio = shrinkDuration/duration;
    CGFloat bgViewRadius = self.bgView.bounds.size.height*0.5;
    currentScale -= ratio*(currentMaxSide/bgViewRadius);
    self.bgView.transform = CGAffineTransformMakeScale(currentScale, currentScale);
    if (currentScale <= 0) {
        [self.shrinkTimer invalidate];
        self.handleDemoBtn.userInteractionEnabled = YES;
        self.bgView.hidden = YES;
        self.bgView.transform = CGAffineTransformIdentity;
    }
}

//取得放大到最大后的边的长度
- (CGFloat)calculateMaxSide{
    CGPoint bgViewCenter = self.bgView.center;
    CGPoint svCenter = self.center;
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    
    CGFloat w;
    CGFloat h;
    
    if (bgViewCenter.x > svCenter.x) {
        if (bgViewCenter.y < svCenter.y) {
            //第一象限
            w = bgViewCenter.x;
            h = screenHeight - bgViewCenter.y;
        }else{
            //第四象限
            w = bgViewCenter.x;
            h = bgViewCenter.y;
        }
    } else {
        if (bgViewCenter.y < svCenter.y) {
            //第二象限
            w = screenWidth - bgViewCenter.x;
            h = screenHeight - bgViewCenter.y;
        } else {
            //第三象限
            w = screenWidth - bgViewCenter.x;
            h = bgViewCenter.y;
        }
    }
    
    CGFloat maxSide = sqrt(w*w+h*h);
    
    return maxSide;
}

@end
