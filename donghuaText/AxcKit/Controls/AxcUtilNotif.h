//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface AxcUtilNotif : NSObject



+(AxcUtilNotif *)sharesInstance;


+(void)registAction;

+(void)sendMess:(NSInteger)alertTime body:(NSString *)alertBody noticeStr:(NSString *)str;

+ (void)cancelLocalNotificationWithKey:(NSString *)key;


@end
