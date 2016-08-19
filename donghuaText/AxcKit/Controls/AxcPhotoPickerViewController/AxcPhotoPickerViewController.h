//
//  XZQPhotoPickerViewController.h
//  XZQPhotoPickerView
//
//  Created by Guen on 16/6/2.
//  Copyright © 2016年 Gemall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

#import "PhotoCell.h"

#import "BrowserPhotoViewController.h"

#import "AxcPhotoPickModel.h"
//第一种回调传值
typedef void(^finishToSelectPhotoBlock)(NSArray *photoArray);

//第二种代理传值
@protocol AxcPhotoPickerViewControllerDelegate <NSObject>

- (void)axcFinishToSelectPhotoWithPhotoArray:(NSArray *)selectedPhotoArray;

@end

@interface AxcPhotoPickerViewController : UIViewController

@property(nonatomic,weak) id <AxcPhotoPickerViewControllerDelegate> delegate;


@property(nonatomic,assign) finishToSelectPhotoBlock finishBlock;

@end
