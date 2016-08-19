//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "AxcCircleView.h"



@interface AxcCircleView ()
- (void)showImage;
- (CGFloat)getRadinaByRadian:(CGFloat)radian;
- (void)addGesture;
//- (void)handleSinglePan:(id)sender;
//- (void)dragPoint:(CGPoint)dragPoint movePoint:(CGPoint)movePoint centerPoint:(CGPoint)centerPoint;
//- (void)reviseCirclePoint;
//- (void)animateWithDuration:(CGFloat)time animateDelay:(CGFloat)delay changeIndex:(NSInteger)change_index toIndex:(NSInteger)to_index circleArray:(NSMutableArray *)array clockwise:(BOOL)is_clockwise;
@end

@implementation AxcCircleView



@synthesize arrImages;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
                center = CGPointMake(frame.size.width/4.0, frame.size.height/2.0);
//        center = CGPointMake(0, frame.size.height/2.0);
        
    }
    return self;
}

- (void)loadView{
    if (arrImages.count > 0) {
        [self addGesture];
        [self showImage];
    }else{
        return;
    }
}

/*
 显示圆环
 显示方式是确定圆心正下方的点，然后逆时针绘制点
 */
- (void)showImage{
    self.backgroundColor = [UIColor grayColor];
    CGFloat fRadina;//与y轴的夹角

    average_radina = 2*M_PI/arrImages.count;

    AxcImageView *dragImageView = [arrImages objectAtIndex:0];
    CGFloat width = dragImageView.frame.size.width;
    CGFloat heigh = dragImageView.frame.size.height;
    //计算半径
    radius = MIN(self.frame.size.width-width, self.frame.size.height-heigh)/2.0;
    
    
    // 484:800 图不是半圆 奶奶的 还是改成标准的半圆吧  要不没个都要调半径
    UIImageView *bgmageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/6, 0, radius-5, radius*2+10)];
    bgmageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    bgmageView.image = [UIImage imageNamed:@"cricle_big"];
    [self addSubview:bgmageView];
    
    CGFloat hello = [self getRadinaByRadian:2*average_radina + M_PI/9/2];
    NSLog(@"%lf",hello);

    
    for (int i=0; i<arrImages.count; i++) {
        
        fRadina = [self getRadinaByRadian:i*(average_radina) + M_PI/9/2];
        NSLog(@"%lf",fRadina);
        CGPoint point = [self getPointByRadian:fRadina centreOfCircle:center radiusOfCircle:radius];
        AxcImageView *imageview = [arrImages objectAtIndex:i];
        
        if (fRadina == hello) {
            
            imageview.frame = CGRectMake(0, 0, 80, 60);
            
        }else{
            imageview.frame = CGRectMake(0, 0, 80, 30);
        }
        
        imageview.center = point;
        imageview.current_radian = fRadina;
        imageview.radian = fRadina;
        imageview.view_point = point;
        imageview.current_animation_radian = [self getAnimationRadianByRadian:fRadina];
        imageview.animation_radian = [self getAnimationRadianByRadian:fRadina];
        [self addSubview:imageview];
        imageview.userInteractionEnabled = YES;
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = 1000 + i;
        button.frame = imageview.bounds;
        [imageview addSubview:button];
        [button addTarget:self action:@selector(handleSinglePan3333333:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
}
- (void)handleSinglePan3333333:(UIButton*)sender{

    if ([_delegate respondsToSelector:@selector(didSelectItemAtSuperView:)]) {
        [_delegate didSelectItemAtSuperView:sender.tag];
    }
    
    AxcImageView *imageView = [arrImages objectAtIndex:sender.tag - 1000];
    CGFloat hello = [self getRadinaByRadian:2*average_radina + M_PI/9/2];
    CGPoint point = [self getPointByRadian:hello centreOfCircle:center radiusOfCircle:radius];

    if (imageView.center.x == point.x && imageView.center.y == point.y) {
        NSLog(@"不用动");
    }else {
        
        CGFloat fRadina1 = [self getRadinaByRadian:0*(average_radina) + M_PI/9/2];
        CGPoint point1 = [self getPointByRadian:fRadina1 centreOfCircle:center radiusOfCircle:radius];
        
        CGFloat fRadina2 = [self getRadinaByRadian:1*(average_radina) + M_PI/9/2];
        CGPoint point2 = [self getPointByRadian:fRadina2 centreOfCircle:center radiusOfCircle:radius];
        
        CGFloat fRadina3 = [self getRadinaByRadian:3*(average_radina) + M_PI/9/2];
        CGPoint point3 = [self getPointByRadian:fRadina3 centreOfCircle:center radiusOfCircle:radius];
        
        CGFloat fRadina4 = [self getRadinaByRadian:4*(average_radina) + M_PI/9/2];
        CGPoint point4 = [self getPointByRadian:fRadina4 centreOfCircle:center radiusOfCircle:radius];
        
        
        //从下逆时针
        if (imageView.center.x == point1.x && imageView.center.y == point1.y) { //
            NSLog(@"1232321");
            //上去两个位置
            [self startUp2];
        }else if (imageView.center.x == point2.x && imageView.center.y == point2.y) {
            [self start1];
            
        }else if (imageView.center.x == point3.x && imageView.center.y == point3.y){
            [self start2];
            
        }else if (imageView.center.x == point4.x && imageView.center.y == point4.y){
            [self down2];
            
        }
        
        
    }
    
    
    
}
//计算线与y轴的夹角,确保在0～2*M_PI之间
- (CGFloat)getRadinaByRadian:(CGFloat)radian
{
    if(radian > 2 * M_PI)//floorf表示不大于该数的最大整数
        return (radian - floorf(radian / (2.0f * M_PI)) * 2.0f * M_PI);
    
    if(radian < 0.0f)//ceilf表示不小于于该数的最小整数
        return (2.0f * M_PI + radian - ceilf(radian / (2.0f * M_PI)) * 2.0f * M_PI);
    
    return radian;
}

//根据夹角（与y轴），中心点，半径就出点坐标
- (CGPoint)getPointByRadian:(CGFloat)radian centreOfCircle:(CGPoint)circle_point radiusOfCircle:(CGFloat)circle_radius
{
    CGFloat c_x = sinf(radian) * circle_radius + circle_point.x + 40;
    CGFloat c_y = cosf(radian) * circle_radius + circle_point.y;
    
    return CGPointMake(c_x, c_y);
}

//根据和y轴的夹角换算成与x轴的夹角用于拖动后旋转
- (CGFloat)getAnimationRadianByRadian:(CGFloat)radian
{
    
    CGFloat an_r = 2.0f * M_PI -  radian + M_PI_2;
    
    if(an_r < 0.0f)
        an_r =  - an_r;
    
    return an_r;
}

/*
 添加手势
 */
- (void)addGesture{
    
    
    UISwipeGestureRecognizer *recognizer;
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [self addGestureRecognizer:recognizer];
    
    
    UISwipeGestureRecognizer *recognizerUp;
    
    recognizerUp = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizerUp setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [self addGestureRecognizer:recognizerUp];

}
#pragma makr - 上推 下拉手势
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    if(recognizer.direction==UISwipeGestureRecognizerDirectionDown) { //下拉

        [self start2];
        
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionUp) { //上滑

        [self start1];
        
    }
}
#pragma mark - 上去两个位置
- (void)startUp2 {
    
    
    AxcImageView *imageview0 = [arrImages objectAtIndex:0];
    CGPoint zeroPoint = imageview0.view_point;
    CGFloat zeroCurrent_an_radian = imageview0.current_animation_radian;
    CGFloat zeroCurrent_radian = imageview0.current_radian;
    
    AxcImageView *imageviewFirst = [arrImages objectAtIndex:1];
    CGPoint FirstPoint = imageviewFirst.view_point;
    CGFloat FirstCurrent_an_radian = imageviewFirst.current_animation_radian;
    CGFloat FirstCurrent_radian = imageviewFirst.current_radian;
    
    
    
    
    for (int i=0; i< arrImages.count; i++) {
        
        AxcImageView *imageview1 = [arrImages objectAtIndex:i];
        if (i < arrImages.count-2) {
            AxcImageView *imageview2 = [arrImages objectAtIndex:i+2];
            
            [UIView animateWithDuration:0.5 animations:^{
                
                imageview1.center = imageview2.view_point;
                imageview1.view_point = imageview2.view_point;
                imageview1.current_animation_radian = imageview2.animation_radian;
                imageview1.current_radian = imageview2.radian;
                
                CGFloat hello = [self getRadinaByRadian:2*average_radina + M_PI/9/2];
                CGPoint point = [self getPointByRadian:hello centreOfCircle:center radiusOfCircle:radius];
                if (imageview1.center.x == point.x && imageview1.center.y == point.y) {
                    imageview1.bounds = CGRectMake(0, 0, 80, 60);
                }else{
                    
                    imageview1.bounds = CGRectMake(0, 0, 80, 30);
                }
                
            } completion:^(BOOL finished) {
                
            }];
            
            
        }else if (i == arrImages.count-2){
        
            [UIView animateWithDuration:0.5 animations:^{
                imageview1.center = zeroPoint;
                imageview1.view_point = zeroPoint;
                imageview1.current_animation_radian = zeroCurrent_an_radian;
                imageview1.current_radian = zeroCurrent_radian;
                
                
                CGFloat hello = [self getRadinaByRadian:2*average_radina + M_PI/9/2];
                CGPoint point = [self getPointByRadian:hello centreOfCircle:center radiusOfCircle:radius];
                if (imageview1.center.x == point.x && imageview1.center.y == point.y) {
                    imageview1.bounds = CGRectMake(0, 0, 80, 60);
                }else{
                    
                    imageview1.bounds = CGRectMake(0, 0, 80, 30);
                }
                
                
            } completion:^(BOOL finished) {
                
            }];

        }
        else { //count-1
            [UIView animateWithDuration:0.5 animations:^{
                imageview1.center = FirstPoint;
                imageview1.view_point = FirstPoint;
                imageview1.current_animation_radian = FirstCurrent_an_radian;
                imageview1.current_radian = FirstCurrent_radian;
                
                
                CGFloat hello = [self getRadinaByRadian:2*average_radina + M_PI/9/2];
                CGPoint point = [self getPointByRadian:hello centreOfCircle:center radiusOfCircle:radius];
                if (imageview1.center.x == point.x && imageview1.center.y == point.y) {
                    imageview1.bounds = CGRectMake(0, 0, 80, 60);
                }else{
                    
                    imageview1.bounds = CGRectMake(0, 0, 80, 30);
                }
                
                
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    

    
}
#pragma  mark - 下来两个位置
- (void)down2 {
    NSLog(@"下来呀");
    AxcImageView *imageview0 = [arrImages objectAtIndex:arrImages.count-1];
    CGPoint lastPoint = imageview0.view_point;
    CGFloat lastCurrent_an_radian = imageview0.current_animation_radian;
    CGFloat lastCurrent_radian = imageview0.current_radian;
    
    AxcImageView *imageviewFirst = [arrImages objectAtIndex:arrImages.count-2];
    CGPoint FirstPoint = imageviewFirst.view_point;
    CGFloat FirstCurrent_an_radian = imageviewFirst.current_animation_radian;
    CGFloat FirstCurrent_radian = imageviewFirst.current_radian;
    
    for (int i=(int)arrImages.count-1; i>=0; i--) {
        
        AxcImageView *imageview1 = [arrImages objectAtIndex:i];
        if (i > 1) {
            AxcImageView *imageview2 = [arrImages objectAtIndex:i-2];
            
            [UIView animateWithDuration:0.5 animations:^{
                
                CGFloat hello = [self getRadinaByRadian:2*average_radina + M_PI/9/2];
                CGPoint point = [self getPointByRadian:hello centreOfCircle:center radiusOfCircle:radius];
                
                if (imageview2.view_point.x== point.x && imageview2.view_point.y == point.y) {
                    imageview1.frame = CGRectMake(0, 0, 80, 60);
                    if ([_delegate respondsToSelector:@selector(didSelectItemAtSuperView:)]) {
                        [_delegate didSelectItemAtSuperView:i];
                    }
                    
                }
                else {
                    imageview1.frame = CGRectMake(0, 0, 80, 30);
                }
                imageview1.center = imageview2.view_point;
                imageview1.view_point = imageview2.view_point;
                imageview1.current_animation_radian = imageview2.animation_radian;
                imageview1.current_radian = imageview2.radian;
                
            } completion:^(BOOL finished) {
                
            }];
            
            
        }else if (i==1){
            
            
            [UIView animateWithDuration:0.5 animations:^{
                
                imageview1.center = lastPoint;
                imageview1.view_point = lastPoint;
                imageview1.current_animation_radian = lastCurrent_an_radian;
                imageview1.current_radian = lastCurrent_radian;
                
                CGFloat hello = [self getRadinaByRadian:2*average_radina + M_PI/9/2];
                CGPoint point = [self getPointByRadian:hello centreOfCircle:center radiusOfCircle:radius];
                
                if (imageview1.view_point.x== point.x && imageview1.view_point.y == point.y) {
                    imageview1.bounds = CGRectMake(0, 0, 80, 60);
                    if ([_delegate respondsToSelector:@selector(didSelectItemAtSuperView:)]) {
                        [_delegate didSelectItemAtSuperView:i];
                    }
                    
                }
                else {
                    imageview1.bounds = CGRectMake(0, 0, 80, 30);
                }
                
            }];

        
        }
        else if(i==0){
            
            [UIView animateWithDuration:0.5 animations:^{
                
                imageview1.center = FirstPoint;
                imageview1.view_point = FirstPoint;
                imageview1.current_animation_radian = FirstCurrent_an_radian;
                imageview1.current_radian = FirstCurrent_radian;
                
                CGFloat hello = [self getRadinaByRadian:2*average_radina + M_PI/9/2];
                CGPoint point = [self getPointByRadian:hello centreOfCircle:center radiusOfCircle:radius];
                
                if (imageview1.view_point.x== point.x && imageview1.view_point.y == point.y) {
                    imageview1.bounds = CGRectMake(0, 0, 80, 60);
                    if ([_delegate respondsToSelector:@selector(didSelectItemAtSuperView:)]) {
                        [_delegate didSelectItemAtSuperView:i];
                    }
                    
                }
                else {
                    imageview1.bounds = CGRectMake(0, 0, 80, 30);
                }
                
            }];

            
        }
    }



}
#pragma mark - 下滑
- (void)start2 {
    NSLog(@"下滑");
    AxcImageView *imageview0 = [arrImages objectAtIndex:arrImages.count-1];
    CGPoint lastPoint = imageview0.view_point;
    CGFloat lastCurrent_an_radian = imageview0.current_animation_radian;
    CGFloat lastCurrent_radian = imageview0.current_radian;
    
    for (int i=(int)arrImages.count-1; i>=0; i--) {
        
        AxcImageView *imageview1 = [arrImages objectAtIndex:i];
        if (i > 0) {
            AxcImageView *imageview2 = [arrImages objectAtIndex:i-1];

            [UIView animateWithDuration:0.5 animations:^{
                
                CGFloat hello = [self getRadinaByRadian:2*average_radina + M_PI/9/2];
                CGPoint point = [self getPointByRadian:hello centreOfCircle:center radiusOfCircle:radius];

                if (imageview2.view_point.x== point.x && imageview2.view_point.y == point.y) {
                    imageview1.frame = CGRectMake(0, 0, 80, 60);
                    if ([_delegate respondsToSelector:@selector(didSelectItemAtSuperView:)]) {
                        [_delegate didSelectItemAtSuperView:i];
                    }

                }
                else {
                    imageview1.frame = CGRectMake(0, 0, 80, 30);
                }
                imageview1.center = imageview2.view_point;
                imageview1.view_point = imageview2.view_point;
                imageview1.current_animation_radian = imageview2.animation_radian;
                imageview1.current_radian = imageview2.radian;
                
            } completion:^(BOOL finished) {
                
            }];
            
            
        }else {
            [UIView animateWithDuration:0.5 animations:^{
                
                imageview1.center = lastPoint;
                imageview1.view_point = lastPoint;
                imageview1.current_animation_radian = lastCurrent_an_radian;
                imageview1.current_radian = lastCurrent_radian;
                
                CGFloat hello = [self getRadinaByRadian:2*average_radina + M_PI/9/2];
                CGPoint point = [self getPointByRadian:hello centreOfCircle:center radiusOfCircle:radius];
                
                if (imageview1.view_point.x== point.x && imageview1.view_point.y == point.y) {
                    imageview1.bounds = CGRectMake(0, 0, 80, 60);
                    if ([_delegate respondsToSelector:@selector(didSelectItemAtSuperView:)]) {
                        [_delegate didSelectItemAtSuperView:i];
                    }

                }
                else {
                    imageview1.bounds = CGRectMake(0, 0, 80, 30);
                }

            } completion:^(BOOL finished) {
                
            }];
        }
    }
}

#pragma mark - 上推
- (void)start1 {
    
    AxcImageView *imageview0 = [arrImages objectAtIndex:0];
    
    CGPoint zeroPoint = imageview0.view_point;
    CGFloat zeroCurrent_an_radian = imageview0.current_animation_radian;
    CGFloat zeroCurrent_radian = imageview0.current_radian;
    
    for (int i=0; i< arrImages.count; i++) {

        AxcImageView *imageview1 = [arrImages objectAtIndex:i];
        if (i < arrImages.count-1) {
            AxcImageView *imageview2 = [arrImages objectAtIndex:i+1];

            
            [UIView animateWithDuration:0.5 animations:^{

                imageview1.center = imageview2.view_point;
                imageview1.view_point = imageview2.view_point;
                imageview1.current_animation_radian = imageview2.animation_radian;
                imageview1.current_radian = imageview2.radian;
                
                CGFloat hello = [self getRadinaByRadian:2*average_radina + M_PI/9/2];
                CGPoint point = [self getPointByRadian:hello centreOfCircle:center radiusOfCircle:radius];
                if (imageview1.center.x == point.x && imageview1.center.y == point.y) {
                        imageview1.bounds = CGRectMake(0, 0, 80, 60);
                }else{

                        imageview1.bounds = CGRectMake(0, 0, 80, 30);
                }
                
            }];

            
        }else {
            [UIView animateWithDuration:0.5 animations:^{
                imageview1.center = zeroPoint;
                imageview1.view_point = zeroPoint;
                imageview1.current_animation_radian = zeroCurrent_an_radian;
                imageview1.current_radian = zeroCurrent_radian;
                
                
                CGFloat hello = [self getRadinaByRadian:2*average_radina + M_PI/9/2];
                CGPoint point = [self getPointByRadian:hello centreOfCircle:center radiusOfCircle:radius];
                if (imageview1.center.x == point.x && imageview1.center.y == point.y) {
                    imageview1.bounds = CGRectMake(0, 0, 80, 60);
                }else{
                    
                    imageview1.bounds = CGRectMake(0, 0, 80, 30);
                }

                
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    
}




//计算schAtan值
- (CGFloat)schAtan2f:(CGFloat)a theB:(CGFloat)b
{
    CGFloat rd = atan2f(a,b);
    
    if(rd < 0.0f)
        rd = M_PI * 2 + rd;
    
    return rd;
}





@end
