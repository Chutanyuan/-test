//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AxcPopButtonType) {
    plusType,
    minusType,
    closeType,
    menuType,
    backType,
    forwardType
};

@interface AxcPopButton : UIButton

@property (nonatomic) AxcPopButtonType currentType;

@property (nonatomic, strong) UIColor *lineColor;

-(void) animateToType:(AxcPopButtonType) type;

@end
