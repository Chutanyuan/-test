//
//  PhotoCell.m
//  XZQPhotoPickerView
//
//  Created by Guen on 16/6/2.
//  Copyright © 2016年 Gemall. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _pic = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width)];
        [self.contentView addSubview:_pic];
        
        _selectedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectedBtn.frame = CGRectMake(frame.size.width - 20 - 2, 2, 20, 20);
        _selectedBtn.selected = NO;
        [_selectedBtn setImage:[UIImage imageNamed:@"ico_check_nomal"] forState:UIControlStateNormal];
        [_selectedBtn setImage:[UIImage imageNamed:@"ico_check_red"] forState:UIControlStateSelected];
        [_selectedBtn addTarget:self action:@selector(selectedBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_selectedBtn];
    }
    return self;
}


- (void)selectedBtnAction:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(selectPhotoWithButton:)]) {
        [self.delegate selectPhotoWithButton:btn];
    }
}

@end
