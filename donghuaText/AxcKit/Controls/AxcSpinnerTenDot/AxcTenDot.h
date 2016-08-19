//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AxcTenDot : UIView
@property (assign, nonatomic) CATransform3D originalTransform3D;
-(id) initDotAtMainView:(UIView *) mainView atIndex:(NSInteger) index;

-(void) start;
-(void) stop;
-(void) reset;
@end
