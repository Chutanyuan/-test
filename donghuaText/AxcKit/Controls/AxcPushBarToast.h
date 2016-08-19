//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, AxcPushBarToastType){
    AxcPushBarToastTypeStatusBar,
    AxcPushBarToastTypeNavigationBar
};

typedef NS_ENUM(NSInteger, AxcPushBarToastPresentationType){
    AxcPushBarToastPresentationTypeCover,
    AxcPushBarToastPresentationTypePush
};

typedef NS_ENUM(NSInteger, AxcPushBarToastAnimationDirection) {
    AxcPushBarToastAnimationDirectionTop,
    AxcPushBarToastAnimationDirectionBottom,
    AxcPushBarToastAnimationDirectionLeft,
    AxcPushBarToastAnimationDirectionRight
};

typedef NS_ENUM(NSInteger, AxcPushBarToastAnimationType) {
    AxcPushBarToastAnimationTypeLinear,
    AxcPushBarToastAnimationTypeSpring,
    AxcPushBarToastAnimationTypeGravity
};

extern NSString *const kAxcPushBarToastNotificationTypeKey;
extern NSString *const kAxcPushBarToastNotificationPresentationTypeKey;

extern NSString *const kAxcPushBarToastAnimationInTypeKey;
extern NSString *const kAxcPushBarToastAnimationOutTypeKey;
extern NSString *const kAxcPushBarToastAnimationInDirectionKey;
extern NSString *const kAxcPushBarToastAnimationOutDirectionKey;

extern NSString *const kAxcPushBarToastAnimationInTimeIntervalKey;
extern NSString *const kAxcPushBarToastTimeIntervalKey;
extern NSString *const kAxcPushBarToastAnimationOutTimeIntervalKey;

extern NSString *const kAxcPushBarToastAnimationSpringDampingKey;
extern NSString *const kAxcPushBarToastAnimationSpringInitialVelocityKey;

extern NSString *const kAxcPushBarToastAnimationGravityMagnitudeKey;

extern NSString *const kAxcPushBarToastTextKey;
extern NSString *const kAxcPushBarToastFontKey;
extern NSString *const kAxcPushBarToastTextColorKey;
extern NSString *const kAxcPushBarToastTextAlignmentKey;
extern NSString *const kAxcPushBarToastTextShadowColorKey;
extern NSString *const kAxcPushBarToastTextShadowOffsetKey;
extern NSString *const kAxcPushBarToastTextMaxNumberOfLinesKey;

extern NSString *const kAxcPushBarToastBackgroundColorKey;
extern NSString *const kAxcPushBarToastImageKey;

@interface AxcPushBarToastManager : NSObject

+ (void)setDefaultOptions:(NSDictionary*)defaultOptions;
+ (void)showNotificationWithOptions:(NSDictionary*)options completionBlock:(void (^)(void))completion;
+ (void)showNotificationWithMessage:(NSString*)message completionBlock:(void (^)(void))completion;

@end