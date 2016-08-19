//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#define BUTTON_SIZE CGSizeMake(30, 30)
#import <UIKit/UIKit.h>
@protocol AxcDoubleButtonTextFieldDelegate <NSObject>

//左边按钮index为0，右边为1
- (void)axcTextFiledButton:(UITextField *)textFiled atIndex:(NSInteger)index;

@end

@interface AxcDoubleButtonTextField : UITextField

@property (nonatomic,weak)id<AxcDoubleButtonTextFieldDelegate> delegate;

@property (nonatomic,strong)UIButton *leftImageButton;

@property (nonatomic,strong)UIButton *rightImageButton;
//占位符的偏移量
@property (nonatomic,assign)CGFloat placehoderOffset;
//编辑的时候光标的偏移量
@property (nonatomic,assign)CGFloat editingCursorOffset;
//文字显示的偏移量
@property (nonatomic,assign)CGFloat textOffset;
//placehoder字体大小,默认17.0
@property (nonatomic,assign)CGFloat placehoderFont;


//确认按钮的样式
//UIReturnKeyType *returnKeyType;

/**
 *  创建一个两边都有button的按钮
 *
 *  @param frame      frame description
 *  @param leftImage  leftImage description
 *  @param rightImage rightImage description
 *
 *  @return 左右都有button的按钮的textFiled
 */
- (id)initWithLeftButton:(NSString *)leftImage rightButton:(NSString *)rightImage;


@end

