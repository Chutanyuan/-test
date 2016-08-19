//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  使用说明
 *1、使用的时候直接创建AxcTagListView控件，自定义控件的origin、width、高度随传入数组变量变化自适应
 *2、保留几个属性接口方便使用者自定义控件GBbackgroundColor、signalTagColor
 *3、设置控件属性要放在-(void)setTagWithTagArray:(NSArray*)arr;之后才会有效
 *4、设置过单一标签颜色后，多样色失效单一标签颜色优先级要高于多样色属性
 *
 *
 */
@class AxcTagListView;

@protocol AxcTagListViewDelegate <NSObject>

- (void)axcTagListView:(AxcTagListView *)axcTagListView didAllArray:(NSArray *)array;

@end


@interface AxcTagListView : UIView{
    CGRect previousFrame ;
    int totalHeight ;
    NSMutableArray*_tagArr;
    
}
/**
 * 整个view的背景色
 */
@property(nonatomic,retain)UIColor*GBbackgroundColor;
/**
 *  设置单一颜色
 */
@property(nonatomic)UIColor*signalTagColor;
/**
 *  回调统计选中tag
 */
@property(nonatomic,copy)void (^didselectItemBlock)(NSArray*arr);
@property(nonatomic) BOOL canTouch;
/**
 *  标签文本赋值
 */
-(void)setTagWithTagArray:(NSArray*)arr;

@property(nonatomic,weak)id <AxcTagListViewDelegate> delegate;

@end
