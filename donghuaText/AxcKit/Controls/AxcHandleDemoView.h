//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AxcHandleDemoView;

@protocol AxcHandleDemoViewDelegate <NSObject>


@optional


- (void)axcHandleDemoView:(AxcHandleDemoView *)axcHandleDemoView endTouchButton:(UIButton *)sender;

@end

@interface AxcHandleDemoView : UIView

- (instancetype)initWithFrame:(CGRect)frame normalTitle:(NSString *)normalTitle HighlightedTitle:(NSString *)HighlightedTitle;

@property (nonatomic, weak) id<AxcHandleDemoViewDelegate> delegate;

/**
 *  扩展时的颜色
 */
@property(nonatomic,strong)UIColor *completedColor;

/**
 *  按钮的背景颜色
 */
@property(nonatomic,strong)UIColor *buttonBackgroundColor;

@end
