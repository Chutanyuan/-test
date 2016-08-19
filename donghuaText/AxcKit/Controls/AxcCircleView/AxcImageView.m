//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "AxcImageView.h"

@implementation AxcImageView

@synthesize current_radian;
@synthesize current_animation_radian;
@synthesize animation_radian;
@synthesize radian;
@synthesize view_point;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

@end
