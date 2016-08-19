//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AxcImageView.h"

@protocol AxcCircleViewDelegate <NSObject>

- (void)didSelectItemAtSuperView:(NSInteger)index;

@end
@interface AxcCircleView : UIView<UIGestureRecognizerDelegate>
{
@private
    //圆的半径
    CGFloat radius;
    //圆心（在CircleView上的位置）
    CGPoint center;
    //平均角度
    CGFloat average_radina;
    //拖动的点
    CGPoint pointDrag;
    //拖动结束后间隔的个数
    NSInteger step;

}
@property(nonatomic, retain) NSMutableArray *arrImages;

@property (nonatomic, assign) id <AxcCircleViewDelegate> delegate;
- (void)loadView;
@end
