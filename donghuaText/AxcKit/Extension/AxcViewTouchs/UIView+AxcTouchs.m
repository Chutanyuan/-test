//
//  UIView+LNTouchs.m
//  LNViewTouchsExample
//
//  Created by 林洁 on 16/1/25.
//  Copyright © 2016年 onlylin. All rights reserved.
//

#import "UIView+AxcTouchs.h"
#import <objc/runtime.h>

@implementation UIView (LNTouchs)

//*********************************点击事件*********************************//
static const char LNTouchsTapKey = '\0';

- (void)setTap:(AxcTouchTap *)tap{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchTap:)];
    [recognizer setNumberOfTapsRequired:1];
    [self addGestureRecognizer:recognizer];
    objc_setAssociatedObject(self, &LNTouchsTapKey, tap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AxcTouchTap *)tap{
    return objc_getAssociatedObject(self, &LNTouchsTapKey);
}

- (void)touchTap:(UITapGestureRecognizer*)recognizer{
    [self.tap executeTouchBlock:self];
}

//*********************************长按事件*********************************//
static const char LNTouchsLongPressKey = '\1';

- (void)setLongPress:(AxcTouchLongPress *)longPress{
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(touchLongPress:)];
    [self addGestureRecognizer:recognizer];
    objc_setAssociatedObject(self, &LNTouchsLongPressKey, longPress, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AxcTouchLongPress *)longPress{
    return objc_getAssociatedObject(self, &LNTouchsLongPressKey);
}

- (void)touchLongPress:(UILongPressGestureRecognizer*)recognizer{
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [self.longPress executeTouchBlock:self];
    }
}

//*********************************滑动事件*********************************//
static const char LNTouchsSwipeLeftKey = '\2';

- (void)setSwipeLeft:(AxcTouchSwipe *)swipeLeft{
    self.userInteractionEnabled = YES;
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchSwipe:)];
    [recognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self addGestureRecognizer:recognizer];
    objc_setAssociatedObject(self, &LNTouchsSwipeLeftKey, swipeLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (AxcTouchSwipe*)swipeLeft{
    return objc_getAssociatedObject(self, &LNTouchsSwipeLeftKey);
}

static const char LNTouchsSwipeRightKey = '\3';

- (void)setSwipeRight:(AxcTouchSwipe *)swipeRight{
    self.userInteractionEnabled = YES;
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchSwipe:)];
    [recognizer setDirection:UISwipeGestureRecognizerDirectionRight];
    [self addGestureRecognizer:recognizer];
    objc_setAssociatedObject(self, &LNTouchsSwipeRightKey, swipeRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AxcTouchSwipe*)swipeRight{
   return objc_getAssociatedObject(self, &LNTouchsSwipeRightKey);
}

static const char LNTouchsSwipeUpKey = '\4';

- (void)setSwipeUp:(AxcTouchSwipe *)swipeUp{
    self.userInteractionEnabled = YES;
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchSwipe:)];
    [recognizer setDirection:UISwipeGestureRecognizerDirectionUp];
    [self addGestureRecognizer:recognizer];
    objc_setAssociatedObject(self, &LNTouchsSwipeUpKey, swipeUp, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AxcTouchSwipe*)swipeUp{
    return objc_getAssociatedObject(self, &LNTouchsSwipeUpKey);
}

static const char LNTouchsSwipeDownKey = '\5';

- (void)setSwipeDown:(AxcTouchSwipe *)swipeDown{
    self.userInteractionEnabled = YES;
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchSwipe:)];
    [recognizer setDirection:UISwipeGestureRecognizerDirectionDown];
    [self addGestureRecognizer:recognizer];
    objc_setAssociatedObject(self, &LNTouchsSwipeDownKey, swipeDown, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AxcTouchSwipe *)swipeDown{
    return objc_getAssociatedObject(self, &LNTouchsSwipeDownKey);
}

- (void)touchSwipe:(UISwipeGestureRecognizer*)recognizer{
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            [self.swipeLeft executeTouchBlock:self];
            break;
        case UISwipeGestureRecognizerDirectionRight:
            [self.swipeRight executeTouchBlock:self];
            break;
        case UISwipeGestureRecognizerDirectionUp:
            [self.swipeUp executeTouchBlock:self];
            break;
        case UISwipeGestureRecognizerDirectionDown:
            [self.swipeDown executeTouchBlock:self];
            break;
        default:
            break;
    }
}

//*********************************拖动事件*********************************//

static const char LNTouchsPanKey = '\6';

- (void)setPan:(AxcTouchPan *)pan{
    self.userInteractionEnabled = YES;
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(touchPan:)];
    recognizer.minimumNumberOfTouches = 1;
    recognizer.maximumNumberOfTouches = 1;
    [self addGestureRecognizer:recognizer];
    objc_setAssociatedObject(self, &LNTouchsPanKey, pan, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AxcTouchPan *)pan{
    return objc_getAssociatedObject(self, &LNTouchsPanKey);
}


- (void)touchPan:(UIPanGestureRecognizer*)recognizer{
    if (recognizer.state != UIGestureRecognizerStateEnded && recognizer.state != UIGestureRecognizerStateFailed) {
        self.pan.point = [recognizer locationInView:recognizer.view.superview];
        [self.pan executeTouchBlock:self];
    }
}


@end
