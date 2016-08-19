//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CircleAnimationBottomView : UIView


@property(nonatomic,assign) CGFloat temperInter ;   //温度

@property (nonatomic, strong) UIImage *bgImage;     // 背景图片

@property (nonatomic, strong) NSString *text;       // 文字

@property (nonatomic, copy) NSString * typeImgName ; 

@property(nonatomic,copy) void (^didTouchBlock) (NSInteger temp);

@end
