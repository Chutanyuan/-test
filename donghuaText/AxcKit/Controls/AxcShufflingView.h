//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AxcShufflingView : UIView

- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title;
//开始
- (void)start;
//停止
- (void)stop;

@end
