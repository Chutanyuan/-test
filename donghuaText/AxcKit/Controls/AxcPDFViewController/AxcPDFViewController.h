//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AxcPDFView.h"

@protocol AxcPDFViewControllerDelegate<NSObject>

/**
 *  关闭时返回当前已经阅读页数
 *
 *  @param currentPage 页数
 */
-(void)axcClosePDFViewWithCurrentPage:(NSInteger)currentPage;

@optional
/**
 *  阅读到最后一页时
 */
- (void)axcReadThePDFToTheEnd;

@end

@interface AxcPDFViewController : UIViewController

@property(nonatomic,weak) id<AxcPDFViewControllerDelegate> Delegate;

@property (strong, nonatomic) AxcPDFView *curView;  // 当前PDF页面视图

@property (strong, nonatomic) AxcPDFView *addView;  // 新的PDF页面视图

@property (strong, nonatomic) AxcPDFView *backView; // 用于制造翻页效果的视图

@property (strong, nonatomic) UIScrollView *scrollView; // 滚动视图，用于显示完整的PDF页面

@property (retain, nonatomic) CAGradientLayer *shadow;  // 用于制造阴影效果的Layer

@property (retain, nonatomic) CAGradientLayer *margin;  // 用于制造页边效果的Layer



-(id)initWithPDFName:(NSString *)name andLastPage:(NSInteger)lastPage; // 通过PDF文件名初始化

@end
