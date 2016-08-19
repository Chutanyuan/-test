//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AxcRoundStringViewDelegate <NSObject>

@optional
-(void)RoundViewClickTheTitleWithNumber:(NSInteger)number;

@end

@interface AxcRoundStringView : UIView

@property(strong,nonatomic)NSArray* titles;

@property(weak,atomic)id<AxcRoundStringViewDelegate>delegate;

-(void)setLableFont:(UIFont*)font;

-(void)setLableColor:(UIColor*)color;

@end
