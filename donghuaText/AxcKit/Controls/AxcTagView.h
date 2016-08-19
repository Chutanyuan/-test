//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//


#import <UIKit/UIKit.h>

/**
 *  使用
 *  1.在使用的时候直接创建TagView控件，自定义控件的frame (origin,width)高度随着传入的数组的变量变化自适应
 *  2.保留了几个属性 方便使用者定义控件的的背景颜色JCbackgroundColor，JCSignalTagColor
 *  3.在定义好JCTagView控件后，一定要调用 “标签文本这个方法”
 *
 *
 */

@class AxcTagView;

@protocol AxcTagViewDelegate <NSObject>

- (void)axcTagView:(AxcTagView *)axcTagView didSelectAtIndex:(NSInteger )index;

@end


@interface AxcTagView : UIView


///设置整个View的背景颜色
@property (nonatomic, retain) UIColor *AxcbackgroundColor;

/**
 *  代理
 */
@property(nonatomic,strong)id <AxcTagViewDelegate> delegate;

/**
 *  设置单一颜色
 */
@property (nonatomic) UIColor *TagColor;


/**
 *  标签 文本赋值
 */
- (void)setArrayTagWithLabelArray:(NSArray *)array;

@end
