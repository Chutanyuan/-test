//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AxcDisperseBtn : UIView
//边界
@property (assign, nonatomic) CGRect borderRect;

@property (strong, nonatomic) UIImage *closeImage;

@property (strong, nonatomic) UIImage *openImage;

@property (nonatomic ,copy)NSArray *btns;
//回收按钮
-(void)recoverBotton;
@end
