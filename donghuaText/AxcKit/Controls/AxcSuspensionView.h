//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DownLoadBlock) ();

@interface AxcSuspensionView : UIView



@property (nonatomic ,assign) CGPoint startPoint;//触摸起始点

@property (nonatomic ,assign) CGPoint endPoint;//触摸结束点

@property (nonatomic ,copy) DownLoadBlock downLoadBlock;

/**
 *  是否自适应导航栏64高度？默认不适应
 */
@property(nonatomic,assign)BOOL theAdaptiveNavigationBar;

@end
