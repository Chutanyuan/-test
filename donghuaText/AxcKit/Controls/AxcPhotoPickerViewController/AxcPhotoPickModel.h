//
//  XZQPhotoPickModel.h
//  XZQPhotoPickerView
//
//  Created by Guen on 16/6/3.
//  Copyright © 2016年 Gemall. All rights reserved.
//


//用来解决复用问题

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AxcPhotoPickModel : NSObject

@property(nonatomic,strong) UIImage *image;
@property(nonatomic,assign) BOOL isSelected;

@end
