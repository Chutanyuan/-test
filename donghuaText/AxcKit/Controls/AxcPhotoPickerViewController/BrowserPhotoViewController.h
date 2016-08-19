//
//  BrowserPhotoViewController.h
//  XZQPhotoPickerView
//
//  Created by Guen on 16/6/2.
//  Copyright © 2016年 Gemall. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectPhotoBlock)(NSArray *photoArray);

@interface BrowserPhotoViewController : UIViewController

@property(nonatomic,strong) NSArray *allPhotoArray;
@property(nonatomic,strong) NSArray *selectedPhotoArray;
@property(nonatomic,assign) int picIndex;
//第一张是否已经被选中
@property(nonatomic,assign) BOOL isFirstSelect;

@property(nonatomic,strong) selectPhotoBlock selectBlock;

@end
