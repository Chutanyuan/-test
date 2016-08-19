//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AxcAlterItemButton.h"

typedef NS_ENUM(NSInteger, DirectionType)
{
    DirectionTypeRight = 0,
    DirectionTypeLeft,
    DirectionTypeDown,
    DirectionTypeUp
};

@class AxcAlterButton;

@protocol AxcAlterButtonDelegate <NSObject>

- (void)AlterButton:(AxcAlterButton *)button clickItemButtonAtIndex:(NSUInteger)index;

@end

@interface AxcAlterButton : UIView

@property (nonatomic, weak) id <AxcAlterButtonDelegate> delegate;

@property (nonatomic, assign) DirectionType directionType;

@property (nonatomic, assign) CGPoint  buttonCenter;

@property (nonatomic, assign) CGSize buttonSize;

@property (nonatomic, assign) float animationDuration;

/**
 *  initMethod
 *
 *  @param centerImage     buttonImage
 *  @param higheLightImage higheLightImage
 *  @param type            DirectionType
 *
 *  @return 
 */
- (instancetype)initWithImage :(UIImage *)centerImage
                highLightImage:(UIImage *)higheLightImage
                     Direction:(DirectionType )type;

- (void)addButtonItems:(NSArray *)itemButton;

@end
