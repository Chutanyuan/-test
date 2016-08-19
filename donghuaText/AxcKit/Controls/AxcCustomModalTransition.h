//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AxcCustomModalTransition : UIPercentDrivenInteractiveTransition<UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate,UIGestureRecognizerDelegate>

//---设置是否可拖拽（默认：不可拖动）
@property (nonatomic, assign, getter=isDragable) BOOL dragable;
//---初始化 model视图控制器
- (id)initWithModalViewController:(UIViewController *)modalViewController;

@end
