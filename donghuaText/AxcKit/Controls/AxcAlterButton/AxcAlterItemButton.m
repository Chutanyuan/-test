//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "AxcAlterItemButton.h"

@implementation AxcAlterItemButton



- (instancetype)initWithImage :(UIImage *)image;
{
    if (self = [super init]) {
        
        self.frame = CGRectMake(0, 0, 35, 35);
                
        [self setBackgroundImage:image forState:UIControlStateNormal];
        [self addTarget:_delegate action:@selector(itemButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

@end
