//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AxcMovie.h"

#define kMovieBrowserHeight 125.0

@class AxcMovieBrowser;
@protocol AxcMovieBrowserDelegate <NSObject>

@optional
- (void)movieBrowser:(AxcMovieBrowser *)movieBrowser didSelectItemAtIndex:(NSInteger)index;
- (void)movieBrowser:(AxcMovieBrowser *)movieBrowser didEndScrollingAtIndex:(NSInteger)index;
- (void)movieBrowser:(AxcMovieBrowser *)movieBrowser didChangeItemAtIndex:(NSInteger)index;

@end

@interface AxcMovieBrowser : UIView

@property (nonatomic, assign, readwrite) id<AxcMovieBrowserDelegate> delegate;
@property (nonatomic, assign, readonly)  NSInteger currentIndex;

- (instancetype)initWithFrame:(CGRect)frame movies:(NSArray *)movies;
- (instancetype)initWithFrame:(CGRect)frame movies:(NSArray *)movies currentIndex:(NSInteger)index;
- (void)setCurrentMovieIndex:(NSInteger)index;

@end
