//
//  LNTouchTap.m
//  LNViewTouchsExample
//
//  Created by 林洁 on 16/1/25.
//  Copyright © 2016年 onlylin. All rights reserved.
//

#import "AxcTouchTap.h"

@implementation AxcTouchTap

+ (instancetype)tapWithTouchBlock:(AxcTouchBlock)touchBlock{
    AxcTouchTap *touch = [[self alloc] init];
    touch.touchBlock = touchBlock;
    return touch;
}

@end
