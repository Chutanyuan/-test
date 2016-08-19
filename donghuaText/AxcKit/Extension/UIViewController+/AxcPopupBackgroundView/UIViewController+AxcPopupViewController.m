//
//  UIViewController+AxcPopupViewController.m
//  AxcModalViewController
//
//  Created by Martin Juhasz on 11.05.12.
//  Copyright (c) 2012 martinjuhasz.de. All rights reserved.
//

#import "UIViewController+AxcPopupViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AxcPopupBackgroundView.h"
#import <objc/runtime.h>

#define kPopupModalAnimationDuration 0.35
#define kAxcPopupViewController @"kAxcPopupViewController"
#define kAxcPopupBackgroundView @"kAxcPopupBackgroundView"
#define kAxcSourceViewTag 23941
#define kAxcPopupViewTag 23942
#define kAxcOverlayViewTag 23945

@interface UIViewController (AxcPopupViewControllerPrivate)
- (UIView*)topView;
- (void)presentPopupView:(UIView*)popupView;
@end


////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public

@implementation UIViewController (AxcPopupViewController)

static void * const keypath = (void*)&keypath;

- (UIViewController*)Axc_popupViewController {
    return objc_getAssociatedObject(self, kAxcPopupViewController);
}

- (void)setAxc_popupViewController:(UIViewController *)Axc_popupViewController {
    objc_setAssociatedObject(self, kAxcPopupViewController, Axc_popupViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (AxcPopupBackgroundView*)Axc_popupBackgroundView {
    return objc_getAssociatedObject(self, kAxcPopupBackgroundView);
}

- (void)setAxc_popupBackgroundView:(AxcPopupBackgroundView *)Axc_popupBackgroundView {
    objc_setAssociatedObject(self, kAxcPopupBackgroundView, Axc_popupBackgroundView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (void)presentPopupViewController:(UIViewController*)popupViewController animationType:(AxcPopupViewAnimation)animationType
{
    self.Axc_popupViewController = popupViewController;
    [self presentPopupView:popupViewController.view animationType:animationType];
}

- (void)dismissPopupViewControllerWithanimationType:(AxcPopupViewAnimation)animationType
{
    UIView *sourceView = [self topView];
    UIView *popupView = [sourceView viewWithTag:kAxcPopupViewTag];
    UIView *overlayView = [sourceView viewWithTag:kAxcOverlayViewTag];
    
    switch (animationType) {
        case AxcPopupViewAnimationSlideBottomTop:
        case AxcPopupViewAnimationSlideBottomBottom:
        case AxcPopupViewAnimationSlideTopTop:
        case AxcPopupViewAnimationSlideTopBottom:
        case AxcPopupViewAnimationSlideLeftLeft:
        case AxcPopupViewAnimationSlideLeftRight:
        case AxcPopupViewAnimationSlideRightLeft:
        case AxcPopupViewAnimationSlideRightRight:
            [self slideViewOut:popupView sourceView:sourceView overlayView:overlayView withAnimationType:animationType];
            break;
            
        default:
            [self fadeViewOut:popupView sourceView:sourceView overlayView:overlayView];
            break;
    }
    self.Axc_popupViewController = nil;
}



////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark View Handling

- (void)presentPopupView:(UIView*)popupView animationType:(AxcPopupViewAnimation)animationType
{
    UIView *sourceView = [self topView];
    sourceView.tag = kAxcSourceViewTag;
    popupView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
    popupView.tag = kAxcPopupViewTag;
    
    // check if source view controller is not in destination
    if ([sourceView.subviews containsObject:popupView]) return;
    
    // customize popupView
    popupView.layer.shadowPath = [UIBezierPath bezierPathWithRect:popupView.bounds].CGPath;
    popupView.layer.masksToBounds = NO;
    popupView.layer.shadowOffset = CGSizeMake(5, 5);
    popupView.layer.shadowRadius = 5;
    popupView.layer.shadowOpacity = 0.5;
    
    // Add semi overlay
    UIView *overlayView = [[UIView alloc] initWithFrame:sourceView.bounds];
    overlayView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    overlayView.tag = kAxcOverlayViewTag;
    overlayView.backgroundColor = [UIColor clearColor];
    
    // BackgroundView
    self.Axc_popupBackgroundView = [[AxcPopupBackgroundView alloc] initWithFrame:sourceView.bounds];
    self.Axc_popupBackgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.Axc_popupBackgroundView.backgroundColor = [UIColor clearColor];
    self.Axc_popupBackgroundView.alpha = 0.0f;
    [overlayView addSubview:self.Axc_popupBackgroundView];
    
    // Make the Background Clickable
    UIButton * dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    dismissButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    dismissButton.backgroundColor = [UIColor clearColor];
    dismissButton.frame = sourceView.bounds;
    [overlayView addSubview:dismissButton];
    
    popupView.alpha = 0.0f;
    [overlayView addSubview:popupView];
    [sourceView addSubview:overlayView];
    
    [dismissButton addTarget:self action:@selector(dismissPopupViewControllerWithanimation:) forControlEvents:UIControlEventTouchUpInside];
    switch (animationType) {
        case AxcPopupViewAnimationSlideBottomTop:
        case AxcPopupViewAnimationSlideBottomBottom:
        case AxcPopupViewAnimationSlideTopTop:
        case AxcPopupViewAnimationSlideTopBottom:
        case AxcPopupViewAnimationSlideLeftLeft:
        case AxcPopupViewAnimationSlideLeftRight:
        case AxcPopupViewAnimationSlideRightLeft:
        case AxcPopupViewAnimationSlideRightRight:
            dismissButton.tag = animationType;
            [self slideViewIn:popupView sourceView:sourceView overlayView:overlayView withAnimationType:animationType];
            break;
        default:
            dismissButton.tag = AxcPopupViewAnimationFade;
            [self fadeViewIn:popupView sourceView:sourceView overlayView:overlayView];
            break;
    }
}

-(UIView*)topView {
    UIViewController *recentView = self;
    
    while (recentView.parentViewController != nil) {
        recentView = recentView.parentViewController;
    }
    return recentView.view;
}

- (void)dismissPopupViewControllerWithanimation:(id)sender
{
    if ([sender isKindOfClass:[UIButton class]]) {
        UIButton* dismissButton = sender;
        switch (dismissButton.tag) {
            case AxcPopupViewAnimationSlideBottomTop:
            case AxcPopupViewAnimationSlideBottomBottom:
            case AxcPopupViewAnimationSlideTopTop:
            case AxcPopupViewAnimationSlideTopBottom:
            case AxcPopupViewAnimationSlideLeftLeft:
            case AxcPopupViewAnimationSlideLeftRight:
            case AxcPopupViewAnimationSlideRightLeft:
            case AxcPopupViewAnimationSlideRightRight:
                [self dismissPopupViewControllerWithanimationType:dismissButton.tag];
                break;
            default:
                [self dismissPopupViewControllerWithanimationType:AxcPopupViewAnimationFade];
                break;
        }
    } else {
        [self dismissPopupViewControllerWithanimationType:AxcPopupViewAnimationFade];
    }
}

//////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Animations

#pragma mark --- Slide

- (void)slideViewIn:(UIView*)popupView sourceView:(UIView*)sourceView overlayView:(UIView*)overlayView withAnimationType:(AxcPopupViewAnimation)animationType
{
    // Generating Start and Stop Positions
    CGSize sourceSize = sourceView.bounds.size;
    CGSize popupSize = popupView.bounds.size;
    CGRect popupStartRect;
    switch (animationType) {
        case AxcPopupViewAnimationSlideBottomTop:
        case AxcPopupViewAnimationSlideBottomBottom:
            popupStartRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                        sourceSize.height,
                                        popupSize.width,
                                        popupSize.height);
            
            break;
        case AxcPopupViewAnimationSlideLeftLeft:
        case AxcPopupViewAnimationSlideLeftRight:
            popupStartRect = CGRectMake(-sourceSize.width,
                                        (sourceSize.height - popupSize.height) / 2,
                                        popupSize.width,
                                        popupSize.height);
            break;
            
        case AxcPopupViewAnimationSlideTopTop:
        case AxcPopupViewAnimationSlideTopBottom:
            popupStartRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                        -popupSize.height,
                                        popupSize.width,
                                        popupSize.height);
            break;
            
        default:
            popupStartRect = CGRectMake(sourceSize.width,
                                        (sourceSize.height - popupSize.height) / 2,
                                        popupSize.width,
                                        popupSize.height);
            break;
    }
    CGRect popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                     (sourceSize.height - popupSize.height) / 2,
                                     popupSize.width,
                                     popupSize.height);
    
    // Set starting properties
    popupView.frame = popupStartRect;
    popupView.alpha = 1.0f;
    [UIView animateWithDuration:kPopupModalAnimationDuration delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self.Axc_popupViewController viewWillAppear:NO];
        self.Axc_popupBackgroundView.alpha = 1.0f;
        popupView.frame = popupEndRect;
    } completion:^(BOOL finished) {
        [self.Axc_popupViewController viewDidAppear:NO];
    }];
}

- (void)slideViewOut:(UIView*)popupView sourceView:(UIView*)sourceView overlayView:(UIView*)overlayView withAnimationType:(AxcPopupViewAnimation)animationType
{
    // Generating Start and Stop Positions
    CGSize sourceSize = sourceView.bounds.size;
    CGSize popupSize = popupView.bounds.size;
    CGRect popupEndRect;
    switch (animationType) {
        case AxcPopupViewAnimationSlideBottomTop:
        case AxcPopupViewAnimationSlideTopTop:
            popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                      -popupSize.height,
                                      popupSize.width,
                                      popupSize.height);
            break;
        case AxcPopupViewAnimationSlideBottomBottom:
        case AxcPopupViewAnimationSlideTopBottom:
            popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                      sourceSize.height,
                                      popupSize.width,
                                      popupSize.height);
            break;
        case AxcPopupViewAnimationSlideLeftRight:
        case AxcPopupViewAnimationSlideRightRight:
            popupEndRect = CGRectMake(sourceSize.width,
                                      popupView.frame.origin.y,
                                      popupSize.width,
                                      popupSize.height);
            break;
        default:
            popupEndRect = CGRectMake(-popupSize.width,
                                      popupView.frame.origin.y,
                                      popupSize.width,
                                      popupSize.height);
            break;
    }
    
    [UIView animateWithDuration:kPopupModalAnimationDuration delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.Axc_popupViewController viewWillDisappear:NO];
        popupView.frame = popupEndRect;
        self.Axc_popupBackgroundView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [popupView removeFromSuperview];
        [overlayView removeFromSuperview];
        [self.Axc_popupViewController viewDidDisappear:NO];
        self.Axc_popupViewController = nil;
    }];
}

#pragma mark --- Fade

- (void)fadeViewIn:(UIView*)popupView sourceView:(UIView*)sourceView overlayView:(UIView*)overlayView
{
    // Generating Start and Stop Positions
    CGSize sourceSize = sourceView.bounds.size;
    CGSize popupSize = popupView.bounds.size;
    CGRect popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                     (sourceSize.height - popupSize.height) / 2,
                                     popupSize.width,
                                     popupSize.height);
    
    // Set starting properties
    popupView.frame = popupEndRect;
    popupView.alpha = 0.0f;
    
    [UIView animateWithDuration:kPopupModalAnimationDuration animations:^{
        [self.Axc_popupViewController viewWillAppear:NO];
        self.Axc_popupBackgroundView.alpha = 0.5f;
        popupView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        [self.Axc_popupViewController viewDidAppear:NO];
    }];
}

- (void)fadeViewOut:(UIView*)popupView sourceView:(UIView*)sourceView overlayView:(UIView*)overlayView
{
    [UIView animateWithDuration:kPopupModalAnimationDuration animations:^{
        [self.Axc_popupViewController viewWillDisappear:NO];
        self.Axc_popupBackgroundView.alpha = 0.0f;
        popupView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [popupView removeFromSuperview];
        [overlayView removeFromSuperview];
        [self.Axc_popupViewController viewDidDisappear:NO];
        self.Axc_popupViewController = nil;
    }];
}


@end
