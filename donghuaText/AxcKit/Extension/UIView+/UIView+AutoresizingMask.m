//
//  UIView+AutoresizingMask.m
//  AxcKit Text Demo
//
//  Created by Axc_5324 on 16/6/20.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "UIView+AutoresizingMask.h"

@implementation UIView (AutoresizingMask)

- (void)axcAutoresizingMaskLeftAndRight{
    self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin;
}

- (void)axcAutoresizingMaskTopAndBottom{
    self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
}

- (void)axcAutoresizingMaskComprehensive{
    self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin|
                            UIViewAutoresizingFlexibleTopMargin  |
                            UIViewAutoresizingFlexibleBottomMargin;
}

- (void)axcAutoresizingMaskWideAndHigh{
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                            UIViewAutoresizingFlexibleHeight;
}
@end
