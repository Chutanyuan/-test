//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AxcAlterItemButton;

@protocol AxcAlterItemButtonDelegate <NSObject>

- (void)itemButtonClicked:(AxcAlterItemButton *)itemButton;

@end

@interface AxcAlterItemButton : UIButton

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, weak) id <AxcAlterItemButtonDelegate> delegate;

- (instancetype)initWithImage :(UIImage *)image;

@end