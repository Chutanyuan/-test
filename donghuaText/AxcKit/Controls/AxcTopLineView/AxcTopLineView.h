//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AxcTopLineViewModel.h"

@class AxcTopLineView;

@protocol AxcTopLineViewDelegate <NSObject>

- (void)axcTopLineView:(AxcTopLineView *)axcTopLineView didSelectAtIndex:(NSInteger )index;

@end

@interface AxcTopLineView : UIView

@property (nonatomic,copy) void (^clickBlock)(NSInteger index);//第几个数据被点击

//数组内部数据需要是AxcTopLineViewModel类型
- (void)setVerticalShowDataArr:(NSMutableArray *)dataArr;

//停止定时器(界面消失前必须要停止定时器否则内存泄漏)
- (void)stopTimer;

@property(nonatomic,strong)id <AxcTopLineViewDelegate>delegate;

@end
