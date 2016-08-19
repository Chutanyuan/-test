//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "UIViewController+AxcSemiModal.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

const struct AxcSemiModalOption AxcSemiModalOptionKeys = {
	.traverseParentHierarchy = @"AxcSemiModalOptionTraverseParentHierarchy",
	.pushParentBack          = @"AxcSemiModalOptionPushParentBack",
	.animationDuration       = @"AxcSemiModalOptionAnimationDuration",
	.parentAlpha             = @"AxcSemiModalOptionParentAlpha",
    .parentScale             = @"AxcSemiModalOptionParentScale",
	.shadowOpacity           = @"AxcSemiModalOptionShadowOpacity",
	.transitionStyle         = @"AxcSemiModalTransitionStyle",
    .disableCancel           = @"AxcSemiModalOptionDisableCancel",
    .backgroundView          = @"AxcSemiModelOptionBackgroundView",
};

#define kSemiModalViewController           @"PaPQC93kjgzUanz"
#define kSemiModalDismissBlock             @"l27h7RU2dzVfPoQ"
#define kSemiModalPresentingViewController @"QKWuTQjUkWaO1Xr"
#define kSemiModalOverlayTag               10001
#define kSemiModalScreenshotTag            10002
#define kSemiModalModalViewTag             10003
#define kSemiModalDismissButtonTag         10004

@interface UIViewController (AxcSemiModalInternal)
-(UIView*)parentTarget;
-(CAAnimationGroup*)animationGroupForward:(BOOL)_forward;
@end

@implementation UIViewController (AxcSemiModalInternal)

-(UIViewController*)Axc_parentTargetViewController {
	UIViewController * target = self;
	if ([[self ym_optionOrDefaultForKey:AxcSemiModalOptionKeys.traverseParentHierarchy] boolValue]) {
		// cover UINav & UITabbar as well
		while (target.parentViewController != nil) {
			target = target.parentViewController;
		}
	}
	return target;
}
-(UIView*)parentTarget {
    return [self Axc_parentTargetViewController].view;
}

#pragma mark Options and defaults

-(void)Axc_registerDefaultsAndOptions:(NSDictionary*)options {
	[self ym_registerOptions:options defaults:@{
     AxcSemiModalOptionKeys.traverseParentHierarchy : @(YES),
     AxcSemiModalOptionKeys.pushParentBack : @(YES),
     AxcSemiModalOptionKeys.animationDuration : @(0.5),
     AxcSemiModalOptionKeys.parentAlpha : @(0.5),
     AxcSemiModalOptionKeys.parentScale : @(0.8),     
     AxcSemiModalOptionKeys.shadowOpacity : @(0.8),
     AxcSemiModalOptionKeys.transitionStyle : @(AxcSemiModalTransitionStyleSlideUp),
     AxcSemiModalOptionKeys.disableCancel : @(NO),
	 }];
}

#pragma mark Push-back animation group

-(CAAnimationGroup*)animationGroupForward:(BOOL)_forward {
    // Create animation keys, forwards and backwards
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0/-900;
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        // The rotation angle is minor as the view is nearer
        t1 = CATransform3DRotate(t1, 7.5f*M_PI/180.0f, 1, 0, 0);
    } else {
        t1 = CATransform3DRotate(t1, 15.0f*M_PI/180.0f, 1, 0, 0);
    }
    
    CATransform3D t2 = CATransform3DIdentity;
    t2.m34 = t1.m34;
    double scale = [[self ym_optionOrDefaultForKey:AxcSemiModalOptionKeys.parentScale] doubleValue];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        // Minor shift to mantai perspective
        t2 = CATransform3DTranslate(t2, 0, [self parentTarget].frame.size.height*-0.04, 0);
        t2 = CATransform3DScale(t2, scale, scale, 1);
    } else {
        t2 = CATransform3DTranslate(t2, 0, [self parentTarget].frame.size.height*-0.08, 0);
        t2 = CATransform3DScale(t2, scale, scale, 1);
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:t1];
	CFTimeInterval duration = [[self ym_optionOrDefaultForKey:AxcSemiModalOptionKeys.animationDuration] doubleValue];
    animation.duration = duration/2;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation2.toValue = [NSValue valueWithCATransform3D:(_forward?t2:CATransform3DIdentity)];
    animation2.beginTime = animation.duration;
    animation2.duration = animation.duration;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [group setDuration:animation.duration*2];
    [group setAnimations:[NSArray arrayWithObjects:animation,animation2, nil]];
    return group;
}

-(void)Axc_interfaceOrientationDidChange:(NSNotification*)notification {
	UIView *overlay = [[self parentTarget] viewWithTag:kSemiModalOverlayTag];
	[self Axc_addOrUpdateParentScreenshotInView:overlay];
}

-(UIImageView*)Axc_addOrUpdateParentScreenshotInView:(UIView*)screenshotContainer {
	UIView *target = [self parentTarget];
	UIView *semiView = [target viewWithTag:kSemiModalModalViewTag];
	
	screenshotContainer.hidden = YES; // screenshot without the overlay!
	semiView.hidden = YES;
	UIGraphicsBeginImageContextWithOptions(target.bounds.size, YES, [[UIScreen mainScreen] scale]);
    if ([target respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        [target drawViewHierarchyInRect:target.bounds afterScreenUpdates:YES];
    } else {
        [target.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	screenshotContainer.hidden = NO;
	semiView.hidden = NO;
	
	UIImageView* screenshot = (id) [screenshotContainer viewWithTag:kSemiModalScreenshotTag];
	if (screenshot) {
		screenshot.image = image;
	}
	else {
		screenshot = [[UIImageView alloc] initWithImage:image];
		screenshot.tag = kSemiModalScreenshotTag;
		screenshot.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		[screenshotContainer addSubview:screenshot];
	}
	return screenshot;
}

@end

@implementation UIViewController (AxcSemiModal)

-(void)presentSemiViewController:(UIViewController*)vc {
	[self presentSemiViewController:vc withOptions:nil completion:nil dismissBlock:nil];
}
-(void)presentSemiViewController:(UIViewController*)vc
					 withOptions:(NSDictionary*)options {
    [self presentSemiViewController:vc withOptions:options completion:nil dismissBlock:nil];
}
-(void)presentSemiViewController:(UIViewController*)vc
					 withOptions:(NSDictionary*)options
					  completion:(AxcTransitionCompletionBlock)completion
					dismissBlock:(AxcTransitionCompletionBlock)dismissBlock {
    [self Axc_registerDefaultsAndOptions:options]; // re-registering is OK
	UIViewController *targetParentVC = [self Axc_parentTargetViewController];

	// implement view controller containment for the semi-modal view controller
	[targetParentVC addChildViewController:vc];
	if ([vc respondsToSelector:@selector(beginAppearanceTransition:animated:)]) {
		[vc beginAppearanceTransition:YES animated:YES]; // iOS 6
	}
	objc_setAssociatedObject(self, kSemiModalViewController, vc, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	objc_setAssociatedObject(self, kSemiModalDismissBlock, dismissBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
	[self presentSemiView:vc.view withOptions:options completion:^{
		[vc didMoveToParentViewController:targetParentVC];
		if ([vc respondsToSelector:@selector(endAppearanceTransition)]) {
			[vc endAppearanceTransition]; // iOS 6
		}
		if (completion) {
			completion();
		}
	}];
}

-(void)presentSemiView:(UIView*)view {
	[self presentSemiView:view withOptions:nil completion:nil];
}
-(void)presentSemiView:(UIView*)view withOptions:(NSDictionary*)options {
	[self presentSemiView:view withOptions:options completion:nil];
}
-(void)presentSemiView:(UIView*)view
		   withOptions:(NSDictionary*)options
			completion:(AxcTransitionCompletionBlock)completion {
	[self Axc_registerDefaultsAndOptions:options]; // re-registering is OK
	UIView * target = [self parentTarget];
	
    if (![target.subviews containsObject:view]) {
        // Set associative object
        objc_setAssociatedObject(view, kSemiModalPresentingViewController, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        // Register for orientation changes, so we can update the presenting controller screenshot
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(Axc_interfaceOrientationDidChange:)
                                                     name:UIDeviceOrientationDidChangeNotification
                                                   object:nil];
        // Get transition style
        NSUInteger transitionStyle = [[self ym_optionOrDefaultForKey:AxcSemiModalOptionKeys.transitionStyle] unsignedIntegerValue];
        
        // Calulate all frames
        CGFloat semiViewHeight = view.frame.size.height;
        CGRect vf = target.bounds;
        CGRect semiViewFrame;
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
            // We center the view and mantain aspect ration
            semiViewFrame = CGRectMake((vf.size.width - view.frame.size.width) / 2.0, vf.size.height-semiViewHeight, view.frame.size.width, semiViewHeight);
        } else {
            semiViewFrame = CGRectMake(0, vf.size.height-semiViewHeight, vf.size.width, semiViewHeight);
        }
        
        CGRect overlayFrame = CGRectMake(0, 0, vf.size.width, vf.size.height-semiViewHeight);
        
        // Add semi overlay
        UIView *overlay;
        UIView *backgroundView = [self ym_optionOrDefaultForKey:AxcSemiModalOptionKeys.backgroundView];
        if (backgroundView) {
            overlay = backgroundView;
        } else {
            overlay = [[UIView alloc] init];
        }
        
        overlay.frame = target.bounds;
        overlay.backgroundColor = [UIColor blackColor];
        overlay.userInteractionEnabled = YES;
        overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        overlay.tag = kSemiModalOverlayTag;
        
        // Take screenshot and scale
        UIImageView *ss = [self Axc_addOrUpdateParentScreenshotInView:overlay];
        [target addSubview:overlay];
        
        // Dismiss button (if allow)
        if(![[self ym_optionOrDefaultForKey:AxcSemiModalOptionKeys.disableCancel] boolValue]) {
            // Don't use UITapGestureRecognizer to avoid complex handling
            UIButton * dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [dismissButton addTarget:self action:@selector(dismissSemiModalView) forControlEvents:UIControlEventTouchUpInside];
            dismissButton.backgroundColor = [UIColor clearColor];
            dismissButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            dismissButton.frame = overlayFrame;
            dismissButton.tag = kSemiModalDismissButtonTag;
            [overlay addSubview:dismissButton];
        }
        
        // Begin overlay animation
		if ([[self ym_optionOrDefaultForKey:AxcSemiModalOptionKeys.pushParentBack] boolValue]) {
			[ss.layer addAnimation:[self animationGroupForward:YES] forKey:@"pushedBackAnimation"];
		}
		NSTimeInterval duration = [[self ym_optionOrDefaultForKey:AxcSemiModalOptionKeys.animationDuration] doubleValue];
        [UIView animateWithDuration:duration animations:^{
            ss.alpha = [[self ym_optionOrDefaultForKey:AxcSemiModalOptionKeys.parentAlpha] floatValue];
        }];
        
        // Present view animated
        view.frame = (transitionStyle == AxcSemiModalTransitionStyleSlideUp
                      ? CGRectOffset(semiViewFrame, 0, +semiViewHeight)
                      : semiViewFrame);
        if (transitionStyle == AxcSemiModalTransitionStyleFadeIn || transitionStyle == AxcSemiModalTransitionStyleFadeInOut) {
            view.alpha = 0.0;
        }
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
            // Don't resize the view width on rotating
            view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        } else {
            view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
        }
        
        view.tag = kSemiModalModalViewTag;
        [target addSubview:view];
        view.layer.shadowColor = [[UIColor blackColor] CGColor];
        view.layer.shadowOffset = CGSizeMake(0, -2);
        view.layer.shadowRadius = 5.0;
        view.layer.shadowOpacity = [[self ym_optionOrDefaultForKey:AxcSemiModalOptionKeys.shadowOpacity] floatValue];
        view.layer.shouldRasterize = YES;
        view.layer.rasterizationScale = [[UIScreen mainScreen] scale];
        
        [UIView animateWithDuration:duration animations:^{
            if (transitionStyle == AxcSemiModalTransitionStyleSlideUp) {
                view.frame = semiViewFrame;
            } else if (transitionStyle == AxcSemiModalTransitionStyleFadeIn || transitionStyle == AxcSemiModalTransitionStyleFadeInOut) {
                view.alpha = 1.0;
            }
        } completion:^(BOOL finished) {
            if (!finished) return;
            [[NSNotificationCenter defaultCenter] postNotificationName:kSemiModalDidShowNotification
                                                                object:self];
            if (completion) {
                completion();
            }
        }];
    }
}
-(void)updateBackground{
    UIView * target = [self parentTarget];
    UIView * overlay = [target viewWithTag:kSemiModalOverlayTag];
    [self Axc_addOrUpdateParentScreenshotInView:overlay];
}
-(void)dismissSemiModalView {
	[self dismissSemiModalViewWithCompletion:nil];
}

-(void)dismissSemiModalViewWithCompletion:(void (^)(void))completion {
    // Look for presenting controller if available
    UIViewController * prstingTgt = self;
    UIViewController * presentingController = objc_getAssociatedObject(prstingTgt.view, kSemiModalPresentingViewController);
    while (presentingController == nil && prstingTgt.parentViewController != nil) {
        prstingTgt = prstingTgt.parentViewController;
        presentingController = objc_getAssociatedObject(prstingTgt.view, kSemiModalPresentingViewController);
    }
    if (presentingController) {
        objc_setAssociatedObject(presentingController.view, kSemiModalPresentingViewController, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [presentingController dismissSemiModalViewWithCompletion:completion];
        return;
    }

    // Correct target for dismissal
    UIView * target = [self parentTarget];
    UIView * modal = [target viewWithTag:kSemiModalModalViewTag];
    UIView * overlay = [target viewWithTag:kSemiModalOverlayTag];
	NSUInteger transitionStyle = [[self ym_optionOrDefaultForKey:AxcSemiModalOptionKeys.transitionStyle] unsignedIntegerValue];
	NSTimeInterval duration = [[self ym_optionOrDefaultForKey:AxcSemiModalOptionKeys.animationDuration] doubleValue];
	UIViewController *vc = objc_getAssociatedObject(self, kSemiModalViewController);
	AxcTransitionCompletionBlock dismissBlock = objc_getAssociatedObject(self, kSemiModalDismissBlock);
	
	// Child controller containment
	[vc willMoveToParentViewController:nil];
	if ([vc respondsToSelector:@selector(beginAppearanceTransition:animated:)]) {
		[vc beginAppearanceTransition:NO animated:YES]; // iOS 6
	}
	
    [UIView animateWithDuration:duration animations:^{
        if (transitionStyle == AxcSemiModalTransitionStyleSlideUp) {
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
                // As the view is centered, we perform a vertical translation
                modal.frame = CGRectMake((target.bounds.size.width - modal.frame.size.width) / 2.0, target.bounds.size.height, modal.frame.size.width, modal.frame.size.height);
            } else {
                modal.frame = CGRectMake(0, target.bounds.size.height, modal.frame.size.width, modal.frame.size.height);
            }
        } else if (transitionStyle == AxcSemiModalTransitionStyleFadeOut || transitionStyle == AxcSemiModalTransitionStyleFadeInOut) {
            modal.alpha = 0.0;
        }
    } completion:^(BOOL finished) {
        [overlay removeFromSuperview];
        [modal removeFromSuperview];
        
        // Child controller containment
        [vc removeFromParentViewController];
        if ([vc respondsToSelector:@selector(endAppearanceTransition)]) {
            [vc endAppearanceTransition];
        }
        
        if (dismissBlock) {
            dismissBlock();
        }
        
        objc_setAssociatedObject(self, kSemiModalDismissBlock, nil, OBJC_ASSOCIATION_COPY_NONATOMIC);
        objc_setAssociatedObject(self, kSemiModalViewController, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
    }];
    
    // Begin overlay animation
    UIImageView * ss = (UIImageView*)[overlay.subviews objectAtIndex:0];
	if ([[self ym_optionOrDefaultForKey:AxcSemiModalOptionKeys.pushParentBack] boolValue]) {
		[ss.layer addAnimation:[self animationGroupForward:NO] forKey:@"bringForwardAnimation"];
	}
    [UIView animateWithDuration:duration animations:^{
        ss.alpha = 1;
    } completion:^(BOOL finished) {
        if(finished){
            [[NSNotificationCenter defaultCenter] postNotificationName:kSemiModalDidHideNotification
                                                                object:self];
            if (completion) {
                completion();
            }
        }
    }];
}

- (void)resizeSemiView:(CGSize)newSize {
    UIView * target = [self parentTarget];
    UIView * modal = [target viewWithTag:kSemiModalModalViewTag];
    CGRect mf = modal.frame;
    mf.size.width = newSize.width;
    mf.size.height = newSize.height;
    mf.origin.y = target.frame.size.height - mf.size.height;
    UIView * overlay = [target viewWithTag:kSemiModalOverlayTag];
    UIButton * button = (UIButton*)[overlay viewWithTag:kSemiModalDismissButtonTag];
    CGRect bf = button.frame;
    bf.size.height = overlay.frame.size.height - newSize.height;
	NSTimeInterval duration = [[self ym_optionOrDefaultForKey:AxcSemiModalOptionKeys.animationDuration] doubleValue];
	[UIView animateWithDuration:duration animations:^{
        modal.frame = mf;
        button.frame = bf;
    } completion:^(BOOL finished) {
        if(finished){
            [[NSNotificationCenter defaultCenter] postNotificationName:kSemiModalWasResizedNotification
                                                                object:self];
        }
    }];
}

@end



#pragma mark - NSObject (YMOptionsAndDefaults)

//  NSObject+YMOptionsAndDefaults
//  Created by YangMeyer on 08.10.12.
//  Copyright (c) 2012 Yang Meyer. All rights reserved.
#import <objc/runtime.h>

@implementation NSObject (YMOptionsAndDefaults)

static char const * const kYMStandardOptionsTableName = "YMStandardOptionsTableName";
static char const * const kYMStandardDefaultsTableName = "YMStandardDefaultsTableName";

- (void)ym_registerOptions:(NSDictionary *)options
				  defaults:(NSDictionary *)defaults
{
	objc_setAssociatedObject(self, kYMStandardOptionsTableName, options, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	objc_setAssociatedObject(self, kYMStandardDefaultsTableName, defaults, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)ym_optionOrDefaultForKey:(NSString*)optionKey
{
	NSDictionary *options = objc_getAssociatedObject(self, kYMStandardOptionsTableName);
	NSDictionary *defaults = objc_getAssociatedObject(self, kYMStandardDefaultsTableName);
	NSAssert(defaults, @"Defaults must have been set when accessing options.");
	return options[optionKey] ?: defaults[optionKey];
}
@end



#pragma mark - UIView (FindUIViewController)

// Convenient category method to find actual ViewController that contains a view
// Adapted from: http://stackoverflow.com/questions/1340434/get-to-uiviewcontroller-from-uiview-on-iphone

@implementation UIView (FindUIViewController)
- (UIViewController *) containingViewController {
    UIView * target = self.superview ? self.superview : self;
    return (UIViewController *)[target traverseResponderChainForUIViewController];
}

- (id) traverseResponderChainForUIViewController {
    id nextResponder = [self nextResponder];
    BOOL isViewController = [nextResponder isKindOfClass:[UIViewController class]];
    BOOL isTabBarController = [nextResponder isKindOfClass:[UITabBarController class]];
    if (isViewController && !isTabBarController) {
        return nextResponder;
    } else if(isTabBarController){
        UITabBarController *tabBarController = nextResponder;
        return [tabBarController selectedViewController];
    } else if ([nextResponder isKindOfClass:[UIView class]]) {
        return [nextResponder traverseResponderChainForUIViewController];
    } else {
        return nil;
    }
}
@end
