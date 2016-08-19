//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BtnHightLightPic @"sliderWifiOn.png"
#define BtnNormalPic @"sliderWifiOff.png"

@interface AxcFilterControl : UIControl
-(id) initWithFrame:(CGRect) frame Titles:(NSArray *) titles;
-(void) setSelectedIndex:(int)index;
-(void) setTitlesFont:(UIFont *)font;

@property(nonatomic, strong) UIButton *handler;
@property(nonatomic, strong) UIColor *progressColor;
@property(nonatomic, strong) UIColor *TopTitlesColor;
@property(nonatomic, readonly) int SelectedIndex;
@end
