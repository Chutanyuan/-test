//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//





//   此控件在Cell多于10时会出现Bug  且内存占用量高!!!!谨慎使用




#import "AxcCycleView.h"
#import "AxcElementView.h"

#define BaseViewTag 20

#define BaseViewWidth self.frame.size.width
#define BaseViewHeight self.frame.size.height
#define BaseViewOriginX 0
#define BaseViewOriginY 0

#define DeltaX 10
#define DeltaY 10

@interface AxcCycleView ()
{
}

@end

@implementation AxcCycleView {
    NSInteger _viewCount;
    NSMutableArray * _frameArray;
    NSInteger _index;
    NSTimer * _timer;
    
    AxcElementView * subview;
    UIView *View;
}

- (instancetype)initWithFrame:(CGRect)frame Content:(NSInteger )conten addTaget:(id)taget{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.conten = conten;
        _viewCount = conten;
        _index = 0;
        _delegate = taget;
        [self setFrameArray];
        [self makeSubviews];
    }
    return self;
}



- (void)startAnimationWithTimerInterval:(NSTimeInterval)timeInterval repeat:(BOOL)repeat {
    _timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                              target:self
                                            selector:@selector(startAnimation)
                                            userInfo:nil
                                             repeats:repeat];
}

- (void)stopAnimation {
    [_timer invalidate];
}

- (void)setFrameArray {
    _frameArray = [[NSMutableArray alloc] init];
    CGRect frame0 = CGRectMake(BaseViewOriginX, BaseViewOriginY, BaseViewWidth, 0);
    [_frameArray addObject:[NSValue valueWithCGRect:frame0]];
    for (NSInteger i=0; i<_viewCount; ++i) {
        CGRect frame = CGRectMake(BaseViewOriginX + i*DeltaX, BaseViewOriginY + i*DeltaY, BaseViewWidth - 2*i*DeltaX, BaseViewHeight);
        [_frameArray addObject:[NSValue valueWithCGRect:frame]];
    }
    CGRect LastFrame = CGRectMake(BaseViewOriginX + (_conten -1)*DeltaX, BaseViewOriginY + (_conten -1)*DeltaY, BaseViewWidth - 2*(_conten -1)*DeltaX, 0);
    [_frameArray addObject:[NSValue valueWithCGRect:LastFrame]];
}

- (void)makeSubviews {
    for (NSInteger i=_viewCount; i>=1; i--) {

        subview = [[AxcElementView alloc] initWithFrame:[[_frameArray objectAtIndex:i] CGRectValue]];
        subview.backgroundColor = [UIColor lightGrayColor];
        subview.tag = BaseViewTag + i;
        subview.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapSubview)];
        [subview addGestureRecognizer:tap];
        [self addSubview:subview];
        if ([_delegate respondsToSelector:@selector(AxcCycleView:atIndex:)]) {
            [_delegate AxcCycleView:self atIndex:subview.tag - BaseViewTag].frame = subview.frame;
            [subview addSubview:[_delegate AxcCycleView:self atIndex:subview.tag- BaseViewTag - 1]];
        }
        if (i == 1) {
            subview = [[AxcElementView alloc] initWithFrame:[[_frameArray objectAtIndex:0] CGRectValue]];//为了实现轮播效果添加
            subview.tag = BaseViewTag;
            subview.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapSubview)];
            [subview addGestureRecognizer:tap];
            [self addSubview:subview];
//            if ([_delegate respondsToSelector:@selector(AxcCycleView:atIndex:)]) {
//                [_delegate AxcCycleView:self atIndex:subview.tag - BaseViewTag].frame = subview.frame;
//                [subview addSubview:[_delegate AxcCycleView:self atIndex:subview.tag- BaseViewTag]];
//            }
        }
    }
}

- (void)startAnimation {
    
    [self viewWithTag:BaseViewTag].backgroundColor = [UIColor lightGrayColor];
    [UIView animateWithDuration:0.3 animations:^{
        for (NSInteger i=0; i<_viewCount; i++) {
            [[self viewWithTag:BaseViewTag+i] setFrame:[[_frameArray objectAtIndex:i+1] CGRectValue]];
        }
    } completion:^(BOOL finished) {
        [[self viewWithTag:BaseViewTag+_viewCount] setFrame:[[_frameArray objectAtIndex:0] CGRectValue]];
        [self bringSubviewToFront:[self viewWithTag:BaseViewTag+_viewCount]];
        [self viewWithTag:BaseViewTag+_viewCount].tag = BaseViewTag - 1;
        for(NSInteger i=_viewCount; i>=-1; i--) {
            [self viewWithTag:BaseViewTag+i].tag++;
        }
    }];
    _index = _index==_viewCount-1? 0 : _index+1;
}

- (void)TapSubview{
    if ([_delegate respondsToSelector:@selector(AxcCycleView:didSelectAtIndex:)]) {
        NSInteger index = 0;
        if (_conten -( subview.tag - BaseViewTag) == _conten) {
            index = 0;
        }else{
            index = _conten -( subview.tag - BaseViewTag);
        }
        [_delegate AxcCycleView:self didSelectAtIndex:index];
    }
}


@end
