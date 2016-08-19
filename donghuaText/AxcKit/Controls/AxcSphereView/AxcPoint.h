//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#ifndef XLPoint_h
#define XLPoint_h

struct XLPoint {
    CGFloat x;
    CGFloat y;
    CGFloat z;
};

typedef struct XLPoint XLPoint;


XLPoint XLPointMake(CGFloat x, CGFloat y, CGFloat z) {
    XLPoint point;
    point.x = x;
    point.y = y;
    point.z = z;
    return point;
}


#endif /* XLPoint_h */
