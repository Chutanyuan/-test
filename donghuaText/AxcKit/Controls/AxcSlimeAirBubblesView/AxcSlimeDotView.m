//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "AxcSlimeDotView.h"
#import "CommonHeader.h"

@implementation AxcSlimeDotView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        self.backgroundColor = DGThemeColor;
        self.clipsToBounds = YES;
    }
    return self;
}


- (void) setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.layer.cornerRadius = CGRectGetWidth(frame) / 2.f;
}
@end
