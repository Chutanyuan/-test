//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AxcAnimationAsUCViewDelegate <NSObject>

- (void)touchMoveEndWithView:(UIView *)view;



@end



@interface AxcAnimationAsUCView : UIView

@property(nonatomic,strong)id<AxcAnimationAsUCViewDelegate>delegate;


@end
