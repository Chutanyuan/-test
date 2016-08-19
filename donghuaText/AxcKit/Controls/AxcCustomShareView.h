//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AxcCustomShareView;

@protocol AxcCustomShareViewDelegate <NSObject>

/**
 *  代理回调
 *
 *  @param axcCustomShareView <#axcCustomShareView description#>
 *  @param index              <#index description#>
 */
- (void)AxcCustomShareView:(AxcCustomShareView *)axcCustomShareView didSelectAtIndex:(NSInteger )index;

@end



@interface AxcCustomShareView : UIView

/**
 *  <#Description#>
 *
 *  @param array <#array description#>
 *  @param array <#array description#>
 */
- (void)setButtonImageArray:(NSArray *)array buttonTitleArray:(NSArray *)titleArray;

/**
 *  头标题
 */
@property(nonatomic,strong)UILabel *title;
/**
 *  副标题
 */
@property(nonatomic,strong)UILabel *remind;

/**
 *  代理
 */
@property(nonatomic,strong)id <AxcCustomShareViewDelegate> delegate;
/**
 *  展示在哪个View上
 *
 *  @param view View
 */
- (void)showInView:(UIView *) view;
/**
 *  隐藏/收回
 */
- (void)hideInView;


@property(nonatomic,strong)UIView           *shareListView;
@property(nonatomic,strong)UIControl        *huiseControl;

@end
