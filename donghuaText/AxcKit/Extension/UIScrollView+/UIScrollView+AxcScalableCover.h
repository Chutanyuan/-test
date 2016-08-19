//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//
#import <UIKit/UIKit.h>


static const CGFloat axHeight = 200;



@interface AxcScalableCover : UIImageView

@property (nonatomic, strong) UIScrollView *scrollView;

@end




@interface UIScrollView (ScalableCover)

@property (nonatomic, weak) AxcScalableCover *scalableCover;

- (void)axcAddScalableCoverWithImage:(UIImage *)image;
- (void)removeScalableCover;

@end

