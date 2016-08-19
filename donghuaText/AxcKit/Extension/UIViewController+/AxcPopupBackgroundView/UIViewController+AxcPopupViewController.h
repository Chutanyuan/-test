//
//  UIViewController+AxcPopupViewController.h
//  AxcModalViewController
//
//  Created by Martin Juhasz on 11.05.12.
//  Copyright (c) 2012 martinjuhasz.de. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AxcPopupBackgroundView;

typedef enum {
    /**
     *  渐入
     */
    AxcPopupViewAnimationFade = 0,
    /**
     *  从下往上
     */
    AxcPopupViewAnimationSlideBottomTop = 1,
    /**
     *  从下往上
     */
    AxcPopupViewAnimationSlideBottomBottom,
    /**
     *  从上往下
     */
    AxcPopupViewAnimationSlideTopTop,
    /**
     *  从上往下
     */
    AxcPopupViewAnimationSlideTopBottom,
    /**
     *  从左往右
     */
    AxcPopupViewAnimationSlideLeftLeft,
    /**
     *  从左往右
     */
    AxcPopupViewAnimationSlideLeftRight,
    /**
     *  从右往左
     */
    AxcPopupViewAnimationSlideRightLeft,
    /**
     *  从右往左
     */
    AxcPopupViewAnimationSlideRightRight,     //
} AxcPopupViewAnimation;

@interface UIViewController (AxcPopupViewController)

@property (nonatomic, retain) UIViewController *Axc_popupViewController;
@property (nonatomic, retain) AxcPopupBackgroundView *Axc_popupBackgroundView;

- (void)presentPopupViewController:(UIViewController*)popupViewController animationType:(AxcPopupViewAnimation)animationType;
- (void)dismissPopupViewControllerWithanimationType:(AxcPopupViewAnimation)animationType;

@end
