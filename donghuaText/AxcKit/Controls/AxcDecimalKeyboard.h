//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AxcDecimalKeyboard : UIView

@property (copy, nonatomic, nullable) void (^done)();       /*< 点击确定执行的回调 */
@property (nonatomic) UIColor *tintColor;                   /*< 主色调（针对确定按钮） */
@property (copy, nonatomic, nullable) BOOL (^shouldInput)(id<UIKeyInput> inputView);

- (instancetype)initWithTintColor:(UIColor *)tintColor;

@end

NS_ASSUME_NONNULL_END
