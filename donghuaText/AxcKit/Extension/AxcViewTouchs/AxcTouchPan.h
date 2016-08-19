//
//  LNTouchPan.h
//  LNViewTouchsExample
//
//  Created by 林洁 on 16/1/27.
//  Copyright © 2016年 onlylin. All rights reserved.
//

#import "AxcTouchComponent.h"
#import <UIKit/UIKit.h>

typedef void (^AxcTouchPanBlock)(id sender, CGPoint point);

@interface AxcTouchPan : AxcTouchComponent

@property (nonatomic,assign) CGPoint point;

@property (nonatomic, copy) AxcTouchPanBlock touchPanBlock;

+ (instancetype)panWithTouchBlock:(AxcTouchPanBlock)touchPanBlock;

- (void)executeTouchBlock:(id)sender;

@end
