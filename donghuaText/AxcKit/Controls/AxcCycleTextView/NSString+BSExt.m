//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "NSString+BSExt.h"

@implementation NSString (BSExt)

- (CGSize)sizeWithFont:(UIFont *)font constraintSize:(CGSize)constraintSize {
    CGSize size;
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;
    NSDictionary *attributes = @{ NSFontAttributeName: font };
    CGRect bounds = [self boundingRectWithSize:constraintSize options:options attributes:attributes context:nil];
    size = bounds.size;
#else
    size = [self sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:NSLineBreakByCharWrapping];
#endif
    return size;
}

@end
