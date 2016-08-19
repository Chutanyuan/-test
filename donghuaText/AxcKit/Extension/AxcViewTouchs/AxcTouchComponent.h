//
//  LNTouchComponent.h
//  LNViewTouchsExample
//
//  Created by 林洁 on 16/1/25.
//  Copyright © 2016年 onlylin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AxcTouchBlock)(id sender);

@interface AxcTouchComponent : NSObject

@property (nonatomic, copy)  AxcTouchBlock touchBlock;

- (void)executeTouchBlock:(id)sender;

@end
