//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AxcSlimeAirBubblesViewDelegate <NSObject>

/**
 *  开始拖拽
 */
- (void)dragDropBegan;

/**
 *  拖拽中
 */
- (void)dragDropChange;

/**
 *  拖拽结束
 */
- (void)dragDropEnding;

/**
 *  拖拽破裂
 */
- (void)dragDropBreak;

@end


@interface AxcSlimeAirBubblesView : UIView

@property(nonatomic,strong)id <AxcSlimeAirBubblesViewDelegate> delegate;



@end
