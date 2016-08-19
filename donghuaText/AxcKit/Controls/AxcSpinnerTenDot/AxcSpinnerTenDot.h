//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "AxcBlurView.h"
#import "UIColor+AxcColor.h"
#import "AxcTenDot.h"
#import <UIKit/UIKit.h>
@protocol AxcSpinnerTenDotDelegate;

@interface AxcSpinnerTenDot : UIView

// Init Fe Spinner View Ten Dot
-(id) initWithView:(UIView *) view withBlur:(BOOL) blur;

// Delegate
@property (weak, nonatomic) id<AxcSpinnerTenDotDelegate> delegate;

// Title
@property (strong, nonatomic) NSString *titleLabelText;
@property (strong, nonatomic) UIFont *fontTitleLabel;


-(void) show;

-(void) showWhileExecutingBlock:(dispatch_block_t) block;

-(void) showWhileExecutingBlock:(dispatch_block_t)block completion:(dispatch_block_t) completion;

-(void) showWhileExecutingSelector:(SEL) selector onTarget:(id) target withObject:(id) object;

-(void) showWhileExecutingSelector:(SEL)selector onTarget:(id)target withObject:(id)object completion:(dispatch_block_t) completion;

-(void) dismiss;
@end

@protocol AxcSpinnerTenDotDelegate <NSObject>
@optional
-(void) AxcSpinnerTenDotWillShow:(AxcSpinnerTenDot *) sender;
-(void) AxcSpinnerTenDotDidShow:(AxcSpinnerTenDot *) sender;
-(void) AxcSpinnerTenDotDidDismiss:(AxcSpinnerTenDot *)sender;
@end