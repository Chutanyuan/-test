//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AxcPickerView;

@protocol AxcPickerViewDelegate <NSObject>
@required


/**
 *  设置按钮的个数
 *
 *  @param pickerView pickerView
 *
 *  @return 设置按钮个数
 */
- (NSUInteger)numberOfItemsInPickerView:(AxcPickerView *)pickerView;

/**
 *  每个按钮的title
 *
 *  @param pickerView pickerView
 *  @param item       item
 *
 *  @return 返回按钮的文字
 */
- (NSString *)pickerView:(AxcPickerView *)pickerView titleForItem:(NSInteger)item;

@optional

/**
 *  点击事件
 *
 *  @param pickerView pickerView
 *  @param item       点击按钮的下标
 */
- (void)pickerView:(AxcPickerView *)pickerView didSelectItem:(NSInteger)item;

@end

@interface AxcPickerView : UIView

@property (nonatomic, weak) id <AxcPickerViewDelegate> delegate;

// 大小
@property (nonatomic, strong) UIFont *font;

// 文字颜色
@property (nonatomic, strong) UIColor *textColor;

// 选中状态的item文字颜色
@property (nonatomic, strong) UIColor *highlightedTextColor;

// 每个item的间距
@property (nonatomic, assign) CGFloat interitemSpacing;

// 刷新数据
- (void)reloadData;

// 跳转到第几个item
- (void)scrollToItem:(NSUInteger)item animated:(BOOL)animated;

// 选中第几个item
- (void)selectItem:(NSUInteger)item animated:(BOOL)animated;

@end
