//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(UIView_Ext)

//orgin x/y
@property (assign, nonatomic) CGPoint origin;
@property (assign, nonatomic) CGFloat originX;
@property (assign, nonatomic) CGFloat originY;

@property (assign, nonatomic) CGFloat sizeHeight;
@property (assign, nonatomic) CGFloat sizeWidth;
//center x/y
@property (assign, nonatomic) CGFloat floatx;
@property (assign, nonatomic) CGFloat floaty;

@property (assign, nonatomic) CGFloat bottom;
@property (assign, nonatomic) CGFloat right;
@end
