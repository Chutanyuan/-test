//
//  AxcJSWebView.h
//  AxcKit Text Demo
//
//  Created by Axc_5324 on 16/6/17.
//  Copyright © 2016年 Axc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AxcJSWebView;

@protocol AxcJSWebViewDelegate <NSObject>

#pragma mark - 设置展示框View代理,若要点击展开自定义View展示大图必须实现该方法
/**
 *  设值展示框View代理,若要点击展开自定义View展示大图必须实现该方法
 *
 *  @param axcJSWebView 回调axcJSwebView
 *  @param url          回调点击图片的URL
 *
 *  @return 返回展示View
 */
- (UIView *)axcShowView:(AxcJSWebView *)axcJSWebView imageUrl:(NSURL *)url;


@optional
#pragma mark - 嫁接WebView代理 （一般情况不会用到）
- (void)axcJSwebViewDidStartLoad:(AxcJSWebView *)axcJSWebView;

- (void)axcJSwebView:(AxcJSWebView *)axcJSwebView didFailLoadWithError:(NSError *)error;

- (void)axcJSwebViewDidFinishLoad:(AxcJSWebView *)axcJSWebView;

/**
 *  返回NO,已经集成JS方法  可到内部去修改
 *
 *  @param axcJSwebView   axcJSwebView
 *  @param request        request
 *  @param navigationType navigationType
 *
 *  @return NO
 */
- (BOOL)axcJSwebView:(AxcJSWebView *)axcJSwebView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
#pragma mark -
@end


@interface AxcJSWebView : UIWebView

/**
 *  附带的WEBVIEW
 */
@property(nonatomic,strong) UIWebView *webView;

/**
 *  是否启用默认展示框  默认 NO
 */
@property(nonatomic,assign)BOOL TheDefaultDisplayBox;

/**
 *  自适应64高度      默认 YES
 */
@property(nonatomic,assign)BOOL automaticallyAdjustsAxcWebViewInsets;

/**
 *  实例化并且加入URL
 *
 *  @param frame 大小
 *  @param url   url
 *
 *  @return init
 */
- (instancetype)initWithFrame:(CGRect)frame Url:(NSURL *)url;

/**
 *  添加url后加载
 *
 *  @param url url
 */
- (void)requestDataWithUrl:(NSURL *)url;


/**
 *  只有这个代理才能自定义放大图View效果
 */
@property(nonatomic,weak)id <AxcJSWebViewDelegate> delegateAxc;

@end
