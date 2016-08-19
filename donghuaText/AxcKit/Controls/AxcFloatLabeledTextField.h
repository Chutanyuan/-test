//
//  AxcFloatLabeledTextFieldViewController.h
//  AxcKit Text Demo
//
//  Created by Axc_5324 on 16/6/20.
//  Copyright © 2016年 qianfeng. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface AxcFloatLabeledTextField : UITextField

@property (nonatomic, strong, readonly) UILabel * floatingLabel;
@property (nonatomic, strong) UIColor * floatingLabelTextColor;
@property (nonatomic, strong) UIColor * floatingLabelActiveTextColor; // tint color is used by default if not provided

@end
