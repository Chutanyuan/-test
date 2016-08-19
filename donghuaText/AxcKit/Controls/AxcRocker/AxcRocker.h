//
//  AxcUtilNotifViewController.m
//  AxcKit Text Demo
//
//  Created by Axc_5324 on 16/6/23.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RockStyle)
{
    RockStyleOpaque = 0,
    RockStyleTranslucent
};

typedef NS_ENUM(NSInteger, RockDirection)
{
    RockDirectionLeft = 0,
    RockDirectionUp,
    RockDirectionRight,
    RockDirectionDown,
    RockDirectionCenter,
};

@protocol AxcRockerDelegate;

@interface AxcRocker : UIView

@property (weak ,nonatomic) id <AxcRockerDelegate> delegate;
@property (nonatomic, readonly) RockDirection direction;

- (void)setRockerStyle:(RockStyle)style;

@end


@protocol AxcRockerDelegate <NSObject>
@optional
- (void)axcRockerDidChangeDirection:(AxcRocker *)rocker;
@end