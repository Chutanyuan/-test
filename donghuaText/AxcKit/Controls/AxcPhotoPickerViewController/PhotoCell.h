//
//  PhotoCell.h
//  XZQPhotoPickerView
//
//  Created by Guen on 16/6/2.
//  Copyright © 2016年 Gemall. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PhotoCellDelegate <NSObject>

- (void)selectPhotoWithButton:(UIButton *)btn;

@end

@interface PhotoCell : UICollectionViewCell

@property(nonatomic,strong) UIImageView *pic;
@property(nonatomic,strong) UIButton *selectedBtn;

@property(nonatomic,weak) id <PhotoCellDelegate> delegate;


@end
