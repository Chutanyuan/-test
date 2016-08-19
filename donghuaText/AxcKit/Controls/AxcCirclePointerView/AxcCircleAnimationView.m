//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "AxcCircleAnimationView.h"
#import "AxcCirclePointerView.h"
#import "AxcCountLabel.h"
#import "AxcPointerView.h"

#define RGBA(r,g,b,a)      [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#define AnimationIntertime 1.5
@interface AxcCircleAnimationView ()
{
    NSTimer *timer;
}
@property (nonatomic, strong) AxcCirclePointerView *circleView;
@property (nonatomic, strong) AxcCountLabel *countLabel;
@property (nonatomic, strong) AxcPointerView *pointerView;
@end
@implementation AxcCircleAnimationView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configViews];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self configViews];
    }
    return self;
}
-(void)configViews{
    [self instanceCircle];
    
    [self instancePercentLabel];
    
    [self instancePointerView];
}
//初始化圆圈
-(void)instanceCircle{
    self.circleView = [[AxcCirclePointerView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    [self addSubview:self.circleView];
}
//初始化显示label
-(void)instancePercentLabel{
    self.countLabel = [[AxcCountLabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    [self addSubview:self.countLabel];
}
-(void)instancePointerView{
    self.pointerView = [[AxcPointerView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    [self addSubview:self.pointerView];
}

//set
-(void)setPercentStr:(NSString *)percentStr{
    if(![_percentStr isEqualToString:percentStr]){
        [self.circleView makeCircle:[percentStr integerValue] withAnimationTime:AnimationIntertime];
        [self.countLabel updateLabel:[percentStr integerValue] withAnimationTime:AnimationIntertime];
        [self.pointerView updatePointer:[percentStr integerValue] withAnimationTime:AnimationIntertime];
    }
    _percentStr = percentStr;
}

// 恢复原位置
-(void)clear{
    
    [self.circleView clearCircles];
    
    [self.countLabel clear];
    
    [self.pointerView clear];
}
@end
