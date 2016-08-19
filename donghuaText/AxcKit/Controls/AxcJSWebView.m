//
//  AxcJSWebView.m
//  AxcKit Text Demo
//
//  Created by Axc_5324 on 16/6/17.
//  Copyright © 2016年 Axc. All rights reserved.
//

#import "AxcJSWebView.h"
#import "UIImageView+WebCache.h"

@interface AxcJSWebView ()<UIWebViewDelegate>{
    
    UIView *bgView;
    UIImageView *imgView;
    UIView *view;
}

@end


@implementation AxcJSWebView

- (instancetype)init{
    if (self == [super init]) {
        self.automaticallyAdjustsAxcWebViewInsets = YES;
        _webView = [[UIWebView alloc]init];
        CGRect frame = self.frame;
        if (frame.size.height == 0 &&frame.size.width == 0&& frame.origin.x == 0&& frame.origin.y == 0) {
            NSLog(@"\n error：检测到未设置 AxcJSWebView 的 frame 值 将默认覆盖全屏！");
            self.frame =CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
        }
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame Url:(NSURL *)url{
    if (self == [super initWithFrame:frame]) {
        self.automaticallyAdjustsAxcWebViewInsets = YES;
        _webView = [[UIWebView alloc]init];
        [self requestDataWithUrl:url];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.automaticallyAdjustsAxcWebViewInsets = YES;
        _webView = [[UIWebView alloc]init];
    }
    return self;
}

- (void)requestDataWithUrl:(NSURL *)url{
    
    if (self.automaticallyAdjustsAxcWebViewInsets) {
        _webView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }else{
        _webView.frame = self.frame;
    }
    _webView.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 3. 请求加载网址
    [_webView loadRequest:request];
    [self addSubview:_webView];
}

- (void)webViewDidFinishLoad:(UIWebView *)WebView {
    
    //调整字号
    NSString *str = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '95%'";
    [_webView stringByEvaluatingJavaScriptFromString:str];
    
    //js方法遍历图片添加点击事件 返回图片个数
    static  NSString * const jsGetImages =
    @"function getImages(){\
    var objs = document.getElementsByTagName(\"img\");\
    for(var i=0;i<objs.length;i++){\
    objs[i].onclick=function(){\
    document.location=\"myweb:imageClick:\"+this.src;\
    };\
    };\
    return objs.length;\
    };";
    
    [_webView stringByEvaluatingJavaScriptFromString:jsGetImages];//注入js方法
    
    NSString *resurlt = [_webView stringByEvaluatingJavaScriptFromString:@"getImages()"];
    
    
    if ([self.delegateAxc respondsToSelector:@selector(axcJSwebViewDidFinishLoad:)]) {
        [self.delegateAxc axcJSwebViewDidFinishLoad:self];
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //将url转换为string
    NSString *requestString = [[request URL] absoluteString];
    //    NSLog(@"requestString is %@",requestString);
    
    //hasPrefix 判断创建的字符串内容是否以pic:字符开始
    if ([requestString hasPrefix:@"myweb:imageClick:"]) {
        NSString *imageUrl = [requestString substringFromIndex:@"myweb:imageClick:".length];
        
        if (bgView) {
            //设置不隐藏，还原放大缩小，显示图片
            bgView.hidden = NO;
            imgView.frame = CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width-40, 220);
            [imgView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
        }
        else{
            [self showBigImage:imageUrl];//创建视图并显示图片

            if ([self.delegateAxc respondsToSelector:@selector(axcJSwebView:shouldStartLoadWithRequest:navigationType:)]) {
                    return  [self.delegateAxc axcJSwebView:self shouldStartLoadWithRequest:request navigationType:navigationType];
            }else{
                return NO;
            }
        }
    }
    return YES;
}

#pragma mark 显示大图片
-(void)showBigImage:(NSString *)imageUrl{
    
    if (![self.delegateAxc respondsToSelector:@selector(axcShowView:imageUrl:)]) {
        NSLog(@"error:AxcJSWebView-<AxcJSWebViewDelegate> axcShowView:imageUrl:未实现！可能无法展示大图。将使用默认展示框，若要自定义请实现\n\t axcShowView：imageUrl\n请设置属性：TheDefaultDisplayBox = YES将开启默认展示框.");
        if (self.TheDefaultDisplayBox) {
            [self TheDefaultDisplayBoxWith:imageUrl];
        }
    }else{
         view =[self.delegateAxc
                       axcShowView:self imageUrl:
                       [NSURL URLWithString:imageUrl]];
        [self addSubview:view];
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapview)];
        [view addGestureRecognizer:tap];    }
}

- (void)tapview{
    [UIView animateWithDuration:0.3 animations:^{
        view.alpha = 0;
    }completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
}

- (void)TheDefaultDisplayBoxWith:(NSString *)imageUrl{
        //创建灰色透明背景，使其背后内容不可操作
        bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        [bgView setBackgroundColor:[UIColor colorWithRed:0.3
                                                   green:0.3
                                                    blue:0.3
                                                   alpha:0.7]];
        [self addSubview:bgView];
    
        //创建边框视图
        UIView *borderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-20, 240)];
        //将图层的边框设置为圆脚
        borderView.layer.cornerRadius = 8;
        borderView.layer.masksToBounds = YES;
        //给图层添加一个有色边框
        borderView.layer.borderWidth = 5;
        borderView.layer.borderColor = [[UIColor blackColor] CGColor];
        [borderView setCenter:bgView.center];
        [bgView addSubview:borderView];
    
        //创建关闭按钮
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //    [closeBtn setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
        closeBtn.backgroundColor = [UIColor lightGrayColor];
        [closeBtn addTarget:self action:@selector(removeBigImage) forControlEvents:UIControlEventTouchUpInside];
        [closeBtn setFrame:CGRectMake(borderView.frame.origin.x+borderView.frame.size.width-20, borderView.frame.origin.y-6, 26, 27)];
        [bgView addSubview:closeBtn];
    
        //创建显示图像视图
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, CGRectGetWidth(borderView.frame)-20, CGRectGetHeight(borderView.frame)-20)];
        imgView.userInteractionEnabled = YES;
        [imgView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
        [borderView addSubview:imgView];
    
        //添加捏合手势
        [imgView addGestureRecognizer:[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinch:)]];
}

//关闭按钮
-(void)removeBigImage
{
    bgView.hidden = YES;
}

- (void) handlePinch:(UIPinchGestureRecognizer*) recognizer
{
    //缩放:设置缩放比例
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    if ([self.delegateAxc respondsToSelector:@selector(axcJSwebViewDidStartLoad:)]) {
        [self.delegateAxc axcJSwebViewDidStartLoad:self];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    if ([self.delegateAxc respondsToSelector:@selector(axcJSwebView:didFailLoadWithError:)]) {
    [self.delegateAxc axcJSwebView:self didFailLoadWithError:error];
    }
}

@end
