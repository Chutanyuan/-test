//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSObject (YMOptionsAndDefaults)
- (void)ym_registerOptions:(NSDictionary *)options
				  defaults:(NSDictionary *)defaults;
- (id)ym_optionOrDefaultForKey:(NSString*)optionKey;
@end
//==================================================================================================


//
// Convenient category method to find actual ViewController that contains a view
//
@interface UIView (FindUIViewController)
- (UIViewController *) containingViewController;
- (id) traverseResponderChainForUIViewController;
@end
//==================================================================================================


//
//  AxcSemiModalViewController.h
//  AxcSemiModalViewController
//
//  Created by Kent Nguyen on 2/5/12.
//  Copyright (c) 2012 Kent ZhaoXin. All rights reserved.
//

#define kSemiModalDidShowNotification @"kSemiModalDidShowNotification"
#define kSemiModalDidHideNotification @"kSemiModalDidHideNotification"
#define kSemiModalWasResizedNotification @"kSemiModalWasResizedNotification"

extern const struct AxcSemiModalOption {
	__unsafe_unretained NSString *traverseParentHierarchy; // boxed BOOL. default is YES.
	__unsafe_unretained NSString *pushParentBack;		   // boxed BOOL. default is YES.
	__unsafe_unretained NSString *animationDuration; // boxed double, in seconds. default is 0.5.
	__unsafe_unretained NSString *parentAlpha;       // boxed float. lower is darker. default is 0.5.
    __unsafe_unretained NSString *parentScale;       // boxed double default is 0.8
	__unsafe_unretained NSString *shadowOpacity;     // default is 0.8
	__unsafe_unretained NSString *transitionStyle;	 // boxed NSNumber - one of the AxcSemiModalTransitionStyle values.
    __unsafe_unretained NSString *disableCancel;     // boxed BOOL. default is NO.
    __unsafe_unretained NSString *backgroundView;     // UIView, custom background.
} AxcSemiModalOptionKeys;

typedef NS_ENUM(NSUInteger, AxcSemiModalTransitionStyle) {
	AxcSemiModalTransitionStyleSlideUp,
	AxcSemiModalTransitionStyleFadeInOut,
	AxcSemiModalTransitionStyleFadeIn,
	AxcSemiModalTransitionStyleFadeOut,
};

typedef void (^AxcTransitionCompletionBlock)(void);

@interface UIViewController (AxcSemiModal)

/**
 Displays a view controller over the receiver, which is "dimmed".
 @param vc           The view controller to display semi-modally; its view's frame height is used.
 @param options	     See AxcSemiModalOptionKeys constants.
 @param completion   Is called after `-[vc viewDidAppear:]`.
 @param dismissBlock Is called when the user dismisses the semi-modal view by tapping the dimmed receiver view.
 */
-(void)presentSemiViewController:(UIViewController*)vc
					 withOptions:(NSDictionary*)options
					  completion:(AxcTransitionCompletionBlock)completion
					dismissBlock:(AxcTransitionCompletionBlock)dismissBlock;

-(void)presentSemiView:(UIView*)view
		   withOptions:(NSDictionary*)options
			completion:(AxcTransitionCompletionBlock)completion;

// Convenient overloading methods
-(void)presentSemiViewController:(UIViewController*)vc;
-(void)presentSemiViewController:(UIViewController*)vc withOptions:(NSDictionary*)options;
-(void)presentSemiView:(UIView*)vc;
-(void)presentSemiView:(UIView*)view withOptions:(NSDictionary*)options;

// Update (refresh) backgroundView
-(void)updateBackground;
// Dismiss & resize
-(void)resizeSemiView:(CGSize)newSize;
-(void)dismissSemiModalView;
-(void)dismissSemiModalViewWithCompletion:(AxcTransitionCompletionBlock)completion;

@end
