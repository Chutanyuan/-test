//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "AxcPushBarToast.h"


#pragma mark - AxcPushBarToast

@interface AxcPushBarToast : NSObject

//Top Level Properties

@property (nonatomic, strong) NSDictionary *options;
@property (nonatomic, copy) void(^completion)(void);

//Views and Layout Data

@property (nonatomic, readonly) UIView *notificationView;
@property (nonatomic, readonly) CGRect notificationViewAnimationFrame1;
@property (nonatomic, readonly) CGRect notificationViewAnimationFrame2;
@property (nonatomic, readonly) UIView *statusBarView;
@property (nonatomic, readonly) CGRect statusBarViewAnimationFrame1;
@property (nonatomic, readonly) CGRect statusBarViewAnimationFrame2;

//Read Only Convinence Properties Providing Default Values or Values from Options

@property (nonatomic, readonly) AxcPushBarToastType notificationType;
@property (nonatomic, readonly) AxcPushBarToastPresentationType presentationType;

@property (nonatomic, readonly) AxcPushBarToastAnimationType inAnimationType;
@property (nonatomic, readonly) AxcPushBarToastAnimationType outAnimationType;
@property (nonatomic, readonly) AxcPushBarToastAnimationDirection inAnimationDirection;
@property (nonatomic, readonly) AxcPushBarToastAnimationDirection outAnimationDirection;
@property (nonatomic, readonly) NSTimeInterval animateInTimeInterval;
@property (nonatomic, readonly) NSTimeInterval timeInterval;
@property (nonatomic, readonly) NSTimeInterval animateOutTimeInterval;

@property (nonatomic, readonly) CGFloat animationSpringDamping;
@property (nonatomic, readonly) CGFloat animationSpringInitialVelocity;
@property (nonatomic, readonly) CGFloat animationGravityMagnitude;

@property (nonatomic, readonly) NSString *text;
@property (nonatomic, readonly) UIFont *font;
@property (nonatomic, readonly) UIColor *textColor;
@property (nonatomic, readonly) NSTextAlignment textAlignment;
@property (nonatomic, readonly) UIColor *textShadowColor;
@property (nonatomic, readonly) CGSize textShadowOffset;
@property (nonatomic, readonly) NSInteger textMaxNumberOfLines;

@property (nonatomic, readonly) UIColor *backgroundColor;
@property (nonatomic, readonly) UIImage *image;

@property (nonatomic, readonly) CGVector inGravityDirection;
@property (nonatomic, readonly) CGVector outGravityDirection;

@property (nonatomic, readonly) CGPoint inCollisionPoint1;
@property (nonatomic, readonly) CGPoint inCollisionPoint2;
@property (nonatomic, readonly) CGPoint outCollisionPoint1;
@property (nonatomic, readonly) CGPoint outCollisionPoint2;


@end

@interface AxcPushBarToastView : UIView
@property (nonatomic, strong) AxcPushBarToast *toast;
@end

#pragma mark - Option Constant Definitions

NSString *const kAxcPushBarToastNotificationTypeKey                 = @"kAxcPushBarToastNotificationTypeKey";
NSString *const kAxcPushBarToastNotificationPresentationTypeKey     = @"kAxcPushBarToastNotificationPresentationTypeKey";

NSString *const kAxcPushBarToastAnimationInTypeKey                  = @"kAxcPushBarToastAnimationInTypeKey";
NSString *const kAxcPushBarToastAnimationOutTypeKey                 = @"kAxcPushBarToastAnimationOutTypeKey";
NSString *const kAxcPushBarToastAnimationInDirectionKey                 = @"kAxcPushBarToastAnimationInDirectionKey";
NSString *const kAxcPushBarToastAnimationOutDirectionKey                = @"kAxcPushBarToastAnimationOutDirectionKey";

NSString *const kAxcPushBarToastAnimationInTimeIntervalKey          = @"kAxcPushBarToastAnimateInTimeInterval";
NSString *const kAxcPushBarToastTimeIntervalKey                     = @"kAxcPushBarToastTimeIntervalKey";
NSString *const kAxcPushBarToastAnimationOutTimeIntervalKey         = @"kAxcPushBarToastAnimateOutTimeInterval";

NSString *const kAxcPushBarToastAnimationSpringDampingKey           = @"kAxcPushBarToastAnimationSpringDampingKey";
NSString *const kAxcPushBarToastAnimationSpringInitialVelocityKey   = @"kAxcPushBarToastAnimateSpringVelocityKey";
NSString *const kAxcPushBarToastAnimationGravityMagnitudeKey        = @"kAxcPushBarToastAnimationGravityMagnitudeKey";

NSString *const kAxcPushBarToastTextKey                             = @"kAxcPushBarToastTextKey";
NSString *const kAxcPushBarToastFontKey                             = @"kAxcPushBarToastFontKey";
NSString *const kAxcPushBarToastTextColorKey                        = @"kAxcPushBarToastTextColorKey";
NSString *const kAxcPushBarToastTextAlignmentKey                    = @"kAxcPushBarToastTextAlignmentKey";
NSString *const kAxcPushBarToastTextShadowColorKey                  = @"kAxcPushBarToastTextShadowColorKey";
NSString *const kAxcPushBarToastTextShadowOffsetKey                 = @"kAxcPushBarToastTextShadowOffsetKey";
NSString *const kAxcPushBarToastTextMaxNumberOfLinesKey             = @"kAxcPushBarToastTextMaxNumberOfLinesKey";

NSString *const kAxcPushBarToastBackgroundColorKey                  = @"kAxcPushBarToastBackgroundColorKey";
NSString *const kAxcPushBarToastImageKey                            = @"kAxcPushBarToastImageKey";

#pragma mark - Option Defaults

static AxcPushBarToastType                  kCRNotificationTypeDefault              = AxcPushBarToastTypeStatusBar;
static AxcPushBarToastPresentationType      kCRNotificationPresentationTypeDefault  = AxcPushBarToastPresentationTypePush;

static AxcPushBarToastAnimationType         kCRAnimationTypeDefaultIn               = AxcPushBarToastAnimationTypeLinear;
static AxcPushBarToastAnimationType         kCRAnimationTypeDefaultOut              = AxcPushBarToastAnimationTypeLinear;
static AxcPushBarToastAnimationDirection    kCRInAnimationDirectionDefault          = AxcPushBarToastAnimationDirectionTop;
static AxcPushBarToastAnimationDirection    kCROutAnimationDirectionDefault         = AxcPushBarToastAnimationDirectionBottom;
static NSTimeInterval               kCRAnimateInTimeIntervalDefault         = 0.4;
static NSTimeInterval               kCRTimeIntervalDefault                  = 2.0f;
static NSTimeInterval               kCRAnimateOutTimeIntervalDefault        = 0.4;

static CGFloat                      kCRSpringDampingDefault                 = 0.6;
static CGFloat                  	kCRSpringInitialVelocityDefault         = 1.0;
static CGFloat                      kCRGravityMagnitudeDefault              = 1.0;

static NSString *                   kCRTextDefault                          = @"";
static UIFont   *                   kCRFontDefault                          = nil;
static UIColor  *               	kCRTextColorDefault                     = nil;
static NSTextAlignment          	kCRTextAlignmentDefault                 = NSTextAlignmentCenter;
static UIColor  *               	kCRTextShadowColorDefault               = nil;
static CGSize                   	kCRTextShadowOffsetDefault;
static NSInteger                    kCRTextMaxNumberOfLinesDefault          = 0;

static UIColor  *                   kCRBackgroundColorDefault               = nil;
static UIImage  *                   kCRImageDefault                         = nil;

#pragma mark - Layout Helper Functions

static CGFloat const CRStatusBarDefaultHeight = 44.0f;
static CGFloat const CRStatusBariPhoneLandscape = 30.0f;

static CGFloat CRGetStatusBarHeight() {
    return (UIDeviceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) ?
    [[UIApplication sharedApplication] statusBarFrame].size.width :
    [[UIApplication sharedApplication] statusBarFrame].size.height;
}

static CGFloat CRGetStatusBarWidth() {
    if (UIDeviceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
        return [UIScreen mainScreen].bounds.size.width;
    }
    return [UIScreen mainScreen].bounds.size.height;
}

static CGFloat CRGetNavigationBarHeight() {
    return (UIDeviceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ||
            UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ?
    CRStatusBarDefaultHeight :
    CRStatusBariPhoneLandscape;
}

static CGFloat CRGetNotificationViewHeight(AxcPushBarToastType type) {
    switch (type) {
        case AxcPushBarToastTypeStatusBar:
            return CRGetStatusBarHeight();
        case AxcPushBarToastTypeNavigationBar:
            return CRGetStatusBarHeight() + CRGetNavigationBarHeight();
    }
}

static CGSize CRNotificationViewSize(AxcPushBarToastType notificationType) {
    return CGSizeMake(CRGetStatusBarWidth(), CRGetNotificationViewHeight(notificationType));
}

static CGRect CRNotificationViewFrame(AxcPushBarToastType type, AxcPushBarToastAnimationDirection direction) {
    return CGRectMake(direction == AxcPushBarToastAnimationDirectionLeft ? -CRGetStatusBarWidth() : direction == AxcPushBarToastAnimationDirectionRight ? CRGetStatusBarWidth() : 0,
                      direction == AxcPushBarToastAnimationDirectionTop ? -CRGetNotificationViewHeight(type) : direction == AxcPushBarToastAnimationDirectionBottom ? CRGetNotificationViewHeight(type) : 0,
                      CRGetStatusBarWidth(),
                      CRGetNotificationViewHeight(type));
}

static CGRect CRStatusBarViewFrame(AxcPushBarToastType type, AxcPushBarToastAnimationDirection direction) {
    return CRNotificationViewFrame(type,direction == AxcPushBarToastAnimationDirectionTop ? AxcPushBarToastAnimationDirectionBottom :
                                   direction == AxcPushBarToastAnimationDirectionBottom ? AxcPushBarToastAnimationDirectionTop :
                                   direction == AxcPushBarToastAnimationDirectionLeft ? AxcPushBarToastAnimationDirectionRight :
                                   AxcPushBarToastAnimationDirectionLeft);
}

@implementation AxcPushBarToast

+ (void)initialize {
    if (self == [AxcPushBarToast class]) {
        kCRFontDefault = [UIFont systemFontOfSize:12];
        kCRTextColorDefault = [UIColor whiteColor];
        kCRBackgroundColorDefault = [[UIApplication sharedApplication] delegate].window.tintColor;
        kCRTextShadowOffsetDefault = CGSizeZero;
    }
}

+ (instancetype)notificationWithOptions:(NSDictionary*)options completionBlock:(void (^)(void))completion {
    AxcPushBarToast *notification = [[self alloc] init];
    notification.options = options;
    notification.completion = completion;
    return notification;
}

+ (id)sharedNotification {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (void)setDefaultOptions:(NSDictionary*)defaultOptions {
    if (defaultOptions[kAxcPushBarToastNotificationTypeKey])                kCRNotificationTypeDefault              = [defaultOptions[kAxcPushBarToastNotificationTypeKey] integerValue];
    if (defaultOptions[kAxcPushBarToastNotificationPresentationTypeKey])    kCRNotificationPresentationTypeDefault  = [defaultOptions[kAxcPushBarToastNotificationPresentationTypeKey] integerValue];
    
    if (defaultOptions[kAxcPushBarToastAnimationInTypeKey])                 kCRAnimationTypeDefaultIn               = [defaultOptions[kAxcPushBarToastAnimationInTypeKey] integerValue];
    if (defaultOptions[kAxcPushBarToastAnimationOutTypeKey])                kCRAnimationTypeDefaultOut              = [defaultOptions[kAxcPushBarToastAnimationOutTypeKey] integerValue];
    if (defaultOptions[kAxcPushBarToastAnimationInDirectionKey])            kCRInAnimationDirectionDefault              = [defaultOptions[kAxcPushBarToastAnimationInDirectionKey] integerValue];
    if (defaultOptions[kAxcPushBarToastAnimationOutDirectionKey])           kCROutAnimationDirectionDefault             = [defaultOptions[kAxcPushBarToastAnimationOutDirectionKey] integerValue];
    
    if (defaultOptions[kAxcPushBarToastAnimationInTimeIntervalKey])         kCRAnimateInTimeIntervalDefault         = [defaultOptions[kAxcPushBarToastAnimationInTimeIntervalKey] doubleValue];
    if (defaultOptions[kAxcPushBarToastTimeIntervalKey])                    kCRTimeIntervalDefault                  = [defaultOptions[kAxcPushBarToastTimeIntervalKey] doubleValue];
    if (defaultOptions[kAxcPushBarToastAnimationOutTimeIntervalKey])        kCRAnimateOutTimeIntervalDefault        = [defaultOptions[kAxcPushBarToastAnimationOutTimeIntervalKey] doubleValue];
    
    if (defaultOptions[kAxcPushBarToastAnimationSpringDampingKey])          kCRSpringDampingDefault                 = [defaultOptions[kAxcPushBarToastAnimationSpringDampingKey] floatValue];
    if (defaultOptions[kAxcPushBarToastAnimationSpringInitialVelocityKey])  kCRSpringInitialVelocityDefault         = [defaultOptions[kAxcPushBarToastAnimationSpringInitialVelocityKey] floatValue];
    if (defaultOptions[kAxcPushBarToastAnimationGravityMagnitudeKey])       kCRGravityMagnitudeDefault              = [defaultOptions[kAxcPushBarToastAnimationGravityMagnitudeKey] floatValue];
    
    if (defaultOptions[kAxcPushBarToastTextKey])                            kCRTextDefault                          = defaultOptions[kAxcPushBarToastTextKey];
    if (defaultOptions[kAxcPushBarToastFontKey])                            kCRFontDefault                          = defaultOptions[kAxcPushBarToastFontKey];
    if (defaultOptions[kAxcPushBarToastTextColorKey])                       kCRTextColorDefault                     = defaultOptions[kAxcPushBarToastTextColorKey];
    if (defaultOptions[kAxcPushBarToastTextAlignmentKey])                   kCRTextAlignmentDefault                 = [defaultOptions[kAxcPushBarToastTextAlignmentKey] integerValue];
    if (defaultOptions[kAxcPushBarToastTextShadowColorKey])                 kCRTextShadowColorDefault               = defaultOptions[kAxcPushBarToastTextShadowColorKey];
    if (defaultOptions[kAxcPushBarToastTextShadowOffsetKey])                kCRTextShadowOffsetDefault              = [defaultOptions[kAxcPushBarToastTextShadowOffsetKey] CGSizeValue];
    if (defaultOptions[kAxcPushBarToastTextMaxNumberOfLinesKey])            kCRTextMaxNumberOfLinesDefault          = [defaultOptions[kAxcPushBarToastTextMaxNumberOfLinesKey] integerValue];
    
    if (defaultOptions[kAxcPushBarToastBackgroundColorKey])                 kCRBackgroundColorDefault               = defaultOptions[kAxcPushBarToastBackgroundColorKey];
    if (defaultOptions[kAxcPushBarToastImageKey])                           kCRImageDefault                         = defaultOptions[kAxcPushBarToastImageKey];
}

#pragma mark - Notification View Helpers

- (UIView*)notificationView {
    CGSize size = CRNotificationViewSize(self.notificationType);
    AxcPushBarToastView *notificationView = [[AxcPushBarToastView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    notificationView.toast = self;
    return notificationView;
}

- (CGRect)notificationViewAnimationFrame1 {
    return CRNotificationViewFrame(self.notificationType, self.inAnimationDirection);
}

- (CGRect)notificationViewAnimationFrame2 {
    return CRNotificationViewFrame(self.notificationType, self.outAnimationDirection);
}

- (UIView*)statusBarView {
    UIView *statusBarView = [[UIView alloc] initWithFrame:self.statusBarViewAnimationFrame1];
    [statusBarView addSubview:[[UIScreen mainScreen] snapshotViewAfterScreenUpdates:YES]];
    statusBarView.clipsToBounds = YES;
    return statusBarView;
}

- (CGRect)statusBarViewAnimationFrame1 {
    return CRStatusBarViewFrame(self.notificationType, self.inAnimationDirection);
}

- (CGRect)statusBarViewAnimationFrame2 {
    return CRStatusBarViewFrame(self.notificationType, self.outAnimationDirection);
}

#pragma mark - Overrides

- (AxcPushBarToastType)notificationType {
    return _options[kAxcPushBarToastNotificationTypeKey] ?
    [self.options[kAxcPushBarToastNotificationTypeKey] integerValue] :
    kCRNotificationTypeDefault;
}

- (AxcPushBarToastPresentationType)presentationType {
    return _options[kAxcPushBarToastNotificationPresentationTypeKey] ?
    [self.options[kAxcPushBarToastNotificationPresentationTypeKey] integerValue] :
    kCRNotificationPresentationTypeDefault;
}

- (AxcPushBarToastAnimationType)inAnimationType {
    return _options[kAxcPushBarToastAnimationInTypeKey] ?
    [_options[kAxcPushBarToastAnimationInTypeKey] integerValue] :
    kCRAnimationTypeDefaultIn;
}

- (AxcPushBarToastAnimationType)outAnimationType {
    return _options[kAxcPushBarToastAnimationOutTypeKey] ?
    [_options[kAxcPushBarToastAnimationOutTypeKey] integerValue] :
    kCRAnimationTypeDefaultOut;
}

- (AxcPushBarToastAnimationDirection)inAnimationDirection {
    return _options[kAxcPushBarToastAnimationInDirectionKey] ?
    [_options[kAxcPushBarToastAnimationInDirectionKey] integerValue] :
    kCRInAnimationDirectionDefault;
}

- (AxcPushBarToastAnimationDirection)outAnimationDirection {
    return _options[kAxcPushBarToastAnimationInDirectionKey] ?
    [_options[kAxcPushBarToastAnimationOutDirectionKey] integerValue] :
    kCROutAnimationDirectionDefault;
}

- (NSTimeInterval)animateInTimeInterval {
    return _options[kAxcPushBarToastAnimationInTimeIntervalKey] ?
    [_options[kAxcPushBarToastAnimationInTimeIntervalKey] doubleValue] :
    kCRAnimateInTimeIntervalDefault;
}

- (NSTimeInterval)timeInterval {
    return _options[kAxcPushBarToastTimeIntervalKey] ?
    [_options[kAxcPushBarToastTimeIntervalKey] doubleValue] :
    kCRTimeIntervalDefault;
}

- (NSTimeInterval)animateOutTimeInterval {
    return _options[kAxcPushBarToastAnimationOutTimeIntervalKey] ?
    [_options[kAxcPushBarToastAnimationOutTimeIntervalKey] doubleValue] :
    kCRAnimateOutTimeIntervalDefault;
}

- (CGFloat)animationSpringInitialVelocity {
    return _options[kAxcPushBarToastAnimationSpringInitialVelocityKey] ?
    [_options[kAxcPushBarToastAnimationSpringInitialVelocityKey] floatValue] :
    kCRSpringInitialVelocityDefault;
}

- (CGFloat)animationSpringDamping {
    return _options[kAxcPushBarToastAnimationSpringDampingKey] ?
    [_options[kAxcPushBarToastAnimationSpringDampingKey] floatValue] :
    kCRSpringDampingDefault;
}

- (CGFloat)animationGravityMagnitude {
    return _options[kAxcPushBarToastAnimationGravityMagnitudeKey] ?
    [_options[kAxcPushBarToastAnimationGravityMagnitudeKey] floatValue] :
    kCRGravityMagnitudeDefault;
}

- (NSString*)text {
    return _options[kAxcPushBarToastTextKey] ?: kCRTextDefault;
}

- (UIFont*)font {
    return _options[kAxcPushBarToastFontKey] ?: kCRFontDefault;
}

- (UIColor*)textColor {
    return _options[kAxcPushBarToastTextColorKey] ?: kCRTextColorDefault;
}

- (NSTextAlignment)textAlignment {
    return _options[kAxcPushBarToastTextAlignmentKey] ? [_options[kAxcPushBarToastTextAlignmentKey] integerValue] : kCRTextAlignmentDefault;
}

- (UIColor*)textShadowColor {
    return _options[kAxcPushBarToastTextShadowColorKey] ?: kCRTextShadowColorDefault;
}

- (CGSize)textShadowOffset {
    return _options[kAxcPushBarToastTextShadowOffsetKey] ?
    [_options[kAxcPushBarToastTextShadowOffsetKey] CGSizeValue]:
    kCRTextShadowOffsetDefault;
}

- (UIColor*)backgroundColor {
    return _options[kAxcPushBarToastBackgroundColorKey] ?: kCRBackgroundColorDefault;
}

- (UIImage*)image {
    return _options[kAxcPushBarToastImageKey] ?: kCRImageDefault;
}

- (NSInteger)maxNumberOfLines {
    return _options[kAxcPushBarToastTextMaxNumberOfLinesKey] ?
    [_options[kAxcPushBarToastTextMaxNumberOfLinesKey] integerValue] :
    kCRTextMaxNumberOfLinesDefault;
}

BOOL AxcPushBarToastAnimationDirectionIsVertical(AxcPushBarToastAnimationDirection animationDirection) {
    return (animationDirection == AxcPushBarToastAnimationDirectionTop || animationDirection == AxcPushBarToastAnimationDirectionBottom);
}

BOOL AxcPushBarToastAnimationDirectionIsHorizontal(AxcPushBarToastAnimationDirection animationDirection) {
    return !AxcPushBarToastAnimationDirectionIsVertical(animationDirection);
}

static CGFloat kCRCollisionTweak = 0.5;

- (CGVector)inGravityDirection {
    CGFloat xVector = AxcPushBarToastAnimationDirectionIsVertical(self.inAnimationDirection) ? 0.0 :
    1.0 * (self.inAnimationDirection == AxcPushBarToastAnimationDirectionLeft ?: -1.0);
    CGFloat yVector = xVector != 0 ? 0.0 :
    1.0 * (self.inAnimationDirection == AxcPushBarToastAnimationDirectionTop ?: -1.0);
    return CGVectorMake(xVector, yVector);
}

- (CGVector)outGravityDirection {
    CGFloat xVector = AxcPushBarToastAnimationDirectionIsVertical(self.outAnimationDirection) ? 0.0 :
    1.0 * (self.outAnimationDirection != AxcPushBarToastAnimationDirectionLeft ?: -1.0);
    CGFloat yVector = xVector != 0 ? 0.0 :
    1.0 * (self.outAnimationDirection != AxcPushBarToastAnimationDirectionTop ?: -1.0);
    return CGVectorMake(xVector, yVector);
}

- (CGPoint)inCollisionPoint1 {
    CGFloat x;
    CGFloat y;
    CGFloat factor = self.presentationType == AxcPushBarToastPresentationTypeCover ?: 2;
    BOOL push = self.presentationType == AxcPushBarToastPresentationTypePush;
    switch (self.inAnimationDirection) {
        case AxcPushBarToastAnimationDirectionTop:
            x = 0;
            y = (factor*CGRectGetHeight(self.notificationViewAnimationFrame1))+(push ? -4*kCRCollisionTweak : kCRCollisionTweak);
            break;
        case AxcPushBarToastAnimationDirectionLeft:
            x = (factor*CGRectGetWidth(self.notificationViewAnimationFrame1))+(push ? -5*kCRCollisionTweak : 2*kCRCollisionTweak);
            y = CGRectGetHeight(self.notificationViewAnimationFrame1);
            break;
        case AxcPushBarToastAnimationDirectionBottom:
            x = CGRectGetWidth(self.notificationViewAnimationFrame1);
            y = -((factor-1)*CGRectGetHeight(self.notificationViewAnimationFrame1))-(push ? -5*kCRCollisionTweak : kCRCollisionTweak);;
            break;
        case AxcPushBarToastAnimationDirectionRight:
            x = -((factor-1)*CGRectGetWidth(self.notificationViewAnimationFrame1))-(push ? -5*kCRCollisionTweak : 2*kCRCollisionTweak);;
            y = 0;
            break;
    }
    return (CGPoint){x, y};
}

- (CGPoint)inCollisionPoint2 {
    CGFloat x;
    CGFloat y;
    CGFloat factor = self.presentationType == AxcPushBarToastPresentationTypeCover ?: 2;
    BOOL push = self.presentationType == AxcPushBarToastPresentationTypePush;
    switch (self.inAnimationDirection) {
        case AxcPushBarToastAnimationDirectionTop:
            x = CGRectGetWidth(self.notificationViewAnimationFrame1);
            y = (factor*CGRectGetHeight(self.notificationViewAnimationFrame1))+(push ? -4*kCRCollisionTweak : kCRCollisionTweak);
            break;
        case AxcPushBarToastAnimationDirectionLeft:
            x = (factor*CGRectGetWidth(self.notificationViewAnimationFrame1))+(push ? -5*kCRCollisionTweak : 2*kCRCollisionTweak);
            y = 0;
            break;
        case AxcPushBarToastAnimationDirectionBottom:
            x = 0;
            y = -((factor-1)*CGRectGetHeight(self.notificationViewAnimationFrame1))-(push ? -5*kCRCollisionTweak : kCRCollisionTweak);
            break;
        case AxcPushBarToastAnimationDirectionRight:
            x = -((factor-1)*CGRectGetWidth(self.notificationViewAnimationFrame1))-(push ? -5*kCRCollisionTweak : 2*kCRCollisionTweak);
            y = CGRectGetHeight(self.notificationViewAnimationFrame1);
            break;
    }
    return (CGPoint){x, y};
}

- (CGPoint)outCollisionPoint1 {
    CGFloat x;
    CGFloat y;
    CGFloat factor = self.presentationType == AxcPushBarToastPresentationTypeCover ?: 2;
    switch (self.outAnimationDirection) {
        case AxcPushBarToastAnimationDirectionTop:
            x = CGRectGetWidth(self.notificationViewAnimationFrame1);
            y = -CGRectGetHeight(self.notificationViewAnimationFrame1)-kCRCollisionTweak;
            break;
        case AxcPushBarToastAnimationDirectionLeft:
            x = -CGRectGetWidth(self.notificationViewAnimationFrame1)-kCRCollisionTweak;
            y = 0;
            break;
        case AxcPushBarToastAnimationDirectionBottom:
            x = 0;
            y = 2*CGRectGetHeight(self.notificationViewAnimationFrame1)+kCRCollisionTweak;
            break;
        case AxcPushBarToastAnimationDirectionRight:
            x = 2*CGRectGetWidth(self.notificationViewAnimationFrame1)+2*kCRCollisionTweak;
            y = CGRectGetHeight(self.notificationViewAnimationFrame1);
            break;
    }
    return (CGPoint){x, y};
}

- (CGPoint)outCollisionPoint2 {
    CGFloat x;
    CGFloat y;
    CGFloat factor = self.presentationType == AxcPushBarToastPresentationTypeCover ?: 2;
    switch (self.outAnimationDirection) {
        case AxcPushBarToastAnimationDirectionTop:
            x = 0;
            y = -CGRectGetHeight(self.notificationViewAnimationFrame1)-kCRCollisionTweak;
            break;
        case AxcPushBarToastAnimationDirectionLeft:
            x = -CGRectGetWidth(self.notificationViewAnimationFrame1)-kCRCollisionTweak;
            y = CGRectGetHeight(self.notificationViewAnimationFrame1);
            break;
        case AxcPushBarToastAnimationDirectionBottom:
            x = CGRectGetWidth(self.notificationViewAnimationFrame1);
            y = 2*CGRectGetHeight(self.notificationViewAnimationFrame1)+kCRCollisionTweak;
            break;
        case AxcPushBarToastAnimationDirectionRight:
            x = 2*CGRectGetWidth(self.notificationViewAnimationFrame1)+2*kCRCollisionTweak;
            y = 0;
            break;
    }
    return (CGPoint){x, y};
}

@end

#pragma mark - AxcPushBarToastView

@interface AxcPushBarToastView ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@end

static CGFloat const kCRStatusBarViewNoImageLeftContentInset = 10;
static CGFloat const kCRStatusBarViewNoImageRightContentInset = 10;

@implementation AxcPushBarToastView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.contentMode = UIViewContentModeCenter;
        [self addSubview:imageView];
        self.imageView = imageView;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:label];
        self.label = label;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.bounds;
    CGSize imageSize = self.imageView.image.size;
    self.imageView.frame = CGRectMake(0,
                                      0,
                                      imageSize.width == 0 ?
                                        0 :
                                        CGRectGetHeight(bounds),
                                      imageSize.height == 0 ?
                                        0 :
                                        CGRectGetHeight(bounds));
    CGFloat x = imageSize.width == 0 ? kCRStatusBarViewNoImageLeftContentInset : CGRectGetMaxX(_imageView.frame);
    self.label.frame = CGRectMake(x,
                                  0,
                                  CGRectGetWidth(bounds)-x-kCRStatusBarViewNoImageRightContentInset,
                                  CGRectGetHeight(bounds));
}

#pragma mark - Overrides

- (void)setToast:(AxcPushBarToast *)toast {
    _toast = toast;
    _label.text = toast.text;
    _label.font = toast.font;
    _label.textColor = toast.textColor;
    _label.textAlignment = toast.textAlignment;
    _label.numberOfLines = toast.textMaxNumberOfLines;
    _imageView.image = toast.image;
    self.backgroundColor = toast.backgroundColor;
}

@end

#pragma mark - AxcPushBarToastManager

@interface AxcPushBarToastManager () <UICollisionBehaviorDelegate>
@property (nonatomic, readonly) BOOL showingNotification;
@property (nonatomic, strong) UIWindow *notificationWindow;
@property (nonatomic, strong) NSMutableArray *notifications;
@property (nonatomic, retain) UIDynamicAnimator *animator;
@property (nonatomic, copy) void (^gravityAnimationCompletionBlock)(BOOL finished);
@end

static NSString *const kAxcPushBarToastManagerCollisionBoundryIdentifier = @"kAxcPushBarToastManagerCollisionBoundryIdentifier";

@implementation AxcPushBarToastManager

+ (void)setDefaultOptions:(NSDictionary*)defaultOptions {
    [AxcPushBarToast setDefaultOptions:defaultOptions];
}

+ (void)showNotificationWithOptions:(NSDictionary*)options completionBlock:(void (^)(void))completion {
    [[AxcPushBarToastManager manager] addNotification:[AxcPushBarToast notificationWithOptions:options
                                                               completionBlock:completion]];
}

+ (void)showNotificationWithMessage:(NSString*)message completionBlock:(void (^)(void))completion {
    [self showNotificationWithOptions:@{kAxcPushBarToastTextKey : message}
                      completionBlock:completion];
}

+ (instancetype)manager {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        UIWindow *notificationWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        notificationWindow.backgroundColor = [UIColor clearColor];
        notificationWindow.userInteractionEnabled = NO;
        notificationWindow.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        notificationWindow.windowLevel = UIWindowLevelStatusBar;
        notificationWindow.rootViewController = [UIViewController new];
        notificationWindow.rootViewController.view.clipsToBounds = YES;
        self.notificationWindow = notificationWindow;
        
        self.notifications = [@[] mutableCopy];
        
        UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:notificationWindow.rootViewController.view];
        self.animator = animator;
    }
    return self;
}

#pragma mark - Notification Management

- (void)addNotification:(AxcPushBarToast*)notification {
    BOOL showingNotification = self.showingNotification;
    [_notifications addObject:notification];
    if (!showingNotification) {
        [self displayNotification:notification];
    }
}

- (void)displayNotification:(AxcPushBarToast*)notification {
    _notificationWindow.hidden = NO;
    CGSize notificationSize = CRNotificationViewSize(notification.notificationType);
    _notificationWindow.rootViewController.view.frame = CGRectMake(0, 0, notificationSize.width, notificationSize.height);

    UIView *statusBarView = notification.statusBarView;
    statusBarView.frame = _notificationWindow.rootViewController.view.bounds;
    [_notificationWindow.rootViewController.view addSubview:statusBarView];
    statusBarView.hidden = notification.presentationType == AxcPushBarToastPresentationTypeCover;
    
    UIView *notificationView = notification.notificationView;
    notificationView.frame = notification.notificationViewAnimationFrame1;
    [_notificationWindow.rootViewController.view addSubview:notificationView];
    __weak __block typeof(self) weakSelf = self;
    
    void (^inwardAnimationsBlock)(void) = ^void(void) {
        notificationView.frame = _notificationWindow.rootViewController.view.bounds;
        statusBarView.frame = notification.statusBarViewAnimationFrame1;
    };
    
    __weak __block typeof(self) blockSelf = self;
    void (^outwardAnimationsBlock)(void) = ^void(void) {
        [blockSelf.animator removeAllBehaviors];
        notificationView.frame = notification.notificationViewAnimationFrame2;
        statusBarView.frame = _notificationWindow.rootViewController.view.bounds;
    };
    
    void (^outwardAnimationsCompletionBlock)(BOOL) = ^void(BOOL finished) {
        if (notification.completion) notification.completion();
        [weakSelf.notifications removeObject:notification];
        [notificationView removeFromSuperview];
        [statusBarView removeFromSuperview];
        if (weakSelf.notifications.count > 0) {
            AxcPushBarToast *notification = weakSelf.notifications.firstObject;
            [weakSelf displayNotification:notification];
        } else {
            weakSelf.notificationWindow.hidden = YES;
        }
    };
    
    void (^inwardAnimationsCompletionBlock)(BOOL) = ^void(BOOL finished) {
        switch (notification.outAnimationType) {
            case AxcPushBarToastAnimationTypeLinear: {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((notification.inAnimationType == AxcPushBarToastAnimationTypeGravity ? notification.timeInterval : 0) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    statusBarView.frame = notification.statusBarViewAnimationFrame2;
                    [UIView animateWithDuration:notification.animateOutTimeInterval
                                          delay:notification.timeInterval
                                        options:0
                                     animations:outwardAnimationsBlock
                                     completion:outwardAnimationsCompletionBlock];
                });
            } break;
            case AxcPushBarToastAnimationTypeSpring: {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((notification.inAnimationType == AxcPushBarToastAnimationTypeGravity ? notification.timeInterval : 0) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    statusBarView.frame = notification.statusBarViewAnimationFrame2;
                    [UIView animateWithDuration:notification.animateOutTimeInterval
                                          delay:notification.timeInterval
                         usingSpringWithDamping:notification.animationSpringDamping
                          initialSpringVelocity:notification.animationSpringInitialVelocity
                                        options:0
                                     animations:outwardAnimationsBlock
                                     completion:outwardAnimationsCompletionBlock];
                });
            } break;
            case AxcPushBarToastAnimationTypeGravity: {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(notification.timeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    statusBarView.frame = notification.statusBarViewAnimationFrame2;
                    [_animator removeAllBehaviors];
                    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[notificationView, statusBarView]];
                    gravity.gravityDirection = notification.outGravityDirection;
                    gravity.magnitude = notification.animationGravityMagnitude;
                    NSMutableArray *collisionItems = [@[notificationView] mutableCopy];
                    if (notification.presentationType == AxcPushBarToastPresentationTypePush) [collisionItems addObject:statusBarView];
                    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:collisionItems];
                    collision.collisionDelegate = self;
                    [collision addBoundaryWithIdentifier:kAxcPushBarToastManagerCollisionBoundryIdentifier
                                               fromPoint:notification.outCollisionPoint1
                                                 toPoint:notification.outCollisionPoint2];
                    [_animator addBehavior:gravity];
                    [_animator addBehavior:collision];
                    
                    self.gravityAnimationCompletionBlock = outwardAnimationsCompletionBlock;
                });
            } break;
        }
    };
    
    switch (notification.inAnimationType) {
        case AxcPushBarToastAnimationTypeLinear: {
            [UIView animateWithDuration:notification.animateInTimeInterval
                             animations:inwardAnimationsBlock
                             completion:inwardAnimationsCompletionBlock];
        }
            break;
        case AxcPushBarToastAnimationTypeSpring: {
            [UIView animateWithDuration:notification.animateInTimeInterval
                                  delay:0.0
                 usingSpringWithDamping:notification.animationSpringDamping
                  initialSpringVelocity:notification.animationSpringInitialVelocity
                                options:0
                             animations:inwardAnimationsBlock
                             completion:inwardAnimationsCompletionBlock];
        }
            break;
        case AxcPushBarToastAnimationTypeGravity: {
            [_animator removeAllBehaviors];
            UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[notificationView, statusBarView]];
            gravity.gravityDirection = notification.inGravityDirection;
            gravity.magnitude = notification.animationGravityMagnitude;
            NSMutableArray *collisionItems = [@[notificationView] mutableCopy];
            if (notification.presentationType == AxcPushBarToastPresentationTypePush) [collisionItems addObject:statusBarView];
            UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:collisionItems];
            collision.collisionDelegate = self;
            [collision addBoundaryWithIdentifier:kAxcPushBarToastManagerCollisionBoundryIdentifier
                                       fromPoint:notification.inCollisionPoint1
                                         toPoint:notification.inCollisionPoint2];
            [_animator addBehavior:gravity];
            [_animator addBehavior:collision];
            self.gravityAnimationCompletionBlock = inwardAnimationsCompletionBlock;
        }
            break;
    }
}

#pragma mark - Overrides

- (BOOL)showingNotification {;
    return self.notifications.count > 0;
}

#pragma mark - UICollisionBehaviorDelegate

- (void)collisionBehavior:(UICollisionBehavior*)behavior
      endedContactForItem:(id <UIDynamicItem>)item
   withBoundaryIdentifier:(id <NSCopying>)identifier {
    if (self.gravityAnimationCompletionBlock) {
        self.gravityAnimationCompletionBlock(YES);
        self.gravityAnimationCompletionBlock = NULL;
    }
}

- (void)collisionBehavior:(UICollisionBehavior*)behavior
      endedContactForItem:(id <UIDynamicItem>)item1
                 withItem:(id <UIDynamicItem>)item2 {
    if (self.gravityAnimationCompletionBlock) {
        self.gravityAnimationCompletionBlock(YES);
        self.gravityAnimationCompletionBlock = NULL;
    }
}

@end