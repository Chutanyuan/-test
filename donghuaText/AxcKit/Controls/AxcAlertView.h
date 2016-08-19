//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//
#import <UIKit/UIKit.h>
@class AxcAlertView;
typedef NS_ENUM(NSInteger,kAlertViewStyle) {
    kAlertViewStyleSuccess,
    kAlertViewStyleFail,
    kAlertViewStyleWarn,
};

typedef NS_ENUM(NSInteger,kAlerViewShowTime) {
    kAlerViewShowTimeDefault, //默认三秒
    kAlerViewShowTimeOneSecond,
    kAlerViewShowTimeTwoSeconds,
};

@protocol AxcAlertViewDelegate <NSObject>

- (void)alertView:(AxcAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface AxcAlertView : UIView

@property (nonatomic,strong)id<AxcAlertViewDelegate> delegate;

- (instancetype)initWithTitle:(NSString *)title target:(id<AxcAlertViewDelegate>)delegate style:(kAlertViewStyle)kAlertViewStyle buttonsTitle:(NSArray *)titles;

- (instancetype)initWithTitle:(NSString *)title style:(kAlertViewStyle)kAlertViewStyle showTime:(kAlerViewShowTime)time;

- (void)showInView:(UIView *)superView;
@end
