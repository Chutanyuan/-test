//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AxcCircleAnimationView : UIView
/**
 *  传入的百分比（0-100）
 */
@property (nonatomic, strong) NSString *percentStr;
/**
 *  恢复原位置
 */
-(void)clear;
@end
