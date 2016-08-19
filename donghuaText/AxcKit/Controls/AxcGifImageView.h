//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>

@interface AxcGifImageView : UIView
{
    CGImageSourceRef gif;          // 保存gif动画
    NSDictionary *gifProperties;
    size_t index;
    size_t count;
    NSTimer *timer;
}
- (id)initWithFrame:(CGRect)frame filePath:(NSString *)filePath;

- (id)initWithFrame:(CGRect)frame data:(NSData *)data;

- (void)stopGif;

@end
