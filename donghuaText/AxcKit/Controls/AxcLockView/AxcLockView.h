//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol AxcLockViewDelegate <NSObject>

- (void)axcReturnsTheGesturesPassword:(NSString *)password;

@end


@interface AxcLockView : UIView

@property(nonatomic,weak)id <AxcLockViewDelegate> delegate;


- (void)awakeFromNib;

@end
