//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AxcUI.h"
#import "UIImage+ST.h"
#import "UIView+Extension.h"
#import "UIImagePickerController+ST.h"

NS_ASSUME_NONNULL_BEGIN

@class AxcPhotoKitController;

@protocol AxcPhotoKitControllerDelegate <NSObject>
- (void)photoKitController:(AxcPhotoKitController *)photoKitController
               resultImage:(UIImage *)resultImage;

@end

@interface AxcPhotoKitController : UIViewController

/** 1.原始图片, 必须设置*/
@property (nonatomic, strong) UIImage *imageOriginal;
/** 2.图片的尺寸,剪切框，最好是需求图片的2x, 默认是CGSizeMake(ScreenWidth, ScreenWidth); */
@property (nonatomic, assign) CGSize sizeClip;

@property (nullable, nonatomic, weak)id <AxcPhotoKitControllerDelegate>delegate ;

@end

NS_ASSUME_NONNULL_END