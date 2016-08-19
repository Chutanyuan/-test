//
//  AxcFloatLabeledTextFieldViewController.h
//  AxcKit Text Demo
//
//  Created by Axc_5324 on 16/6/20.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "AxcFloatLabeledTextField.h"

@interface AxcFloatLabeledTextField ()
@end

@implementation AxcFloatLabeledTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
	    [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder 
{
    self = [super initWithCoder:aDecoder];
    if(self) 
    {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _floatingLabel = [UILabel new];
    _floatingLabel.alpha = 0.0f;
    [self addSubview:_floatingLabel];
	
    // some basic default fonts/colors
    _floatingLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    self.floatingLabelTextColor = [UIColor grayColor];
    
    // If we're in a nib / storyboard we want to use the default placeholder as our placeholder
    if (self.placeholder) {
        self.placeholder = self.placeholder;
    }
}

- (void)setPlaceholder:(NSString *)placeholder
{
    [super setPlaceholder:placeholder];
    _floatingLabel.text = placeholder;
    [_floatingLabel sizeToFit];
    CGFloat originX = 0.f;
    if (self.textAlignment == NSTextAlignmentCenter)
        originX = (self.frame.size.width/2) - (_floatingLabel.frame.size.width/2);
    else if (self.textAlignment == NSTextAlignmentRight)
        originX = self.frame.size.width - _floatingLabel.frame.size.width;
    _floatingLabel.frame = CGRectMake(originX, _floatingLabel.font.lineHeight, _floatingLabel.frame.size.width, _floatingLabel.frame.size.height);
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
	return UIEdgeInsetsInsetRect([super textRectForBounds:bounds], UIEdgeInsetsMake(_floatingLabel.font.lineHeight, 0.0f, 0.0f, 0.0f));
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return UIEdgeInsetsInsetRect([super editingRectForBounds:bounds], UIEdgeInsetsMake(_floatingLabel.font.lineHeight, 0.0f, 0.0f, 0.0f));
}

- (CGRect)clearButtonRectForBounds:(CGRect)bounds
{
	CGRect rect = [super clearButtonRectForBounds:bounds];
	rect = CGRectMake(rect.origin.x, rect.origin.y + _floatingLabel.font.lineHeight / 2.0f, rect.size.width, rect.size.height);
	return rect;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.isFirstResponder) {
        if (!self.text || 0 == [self.text length]) {
            [self hideFloatingLabel];
        }
        else {
            if (self.floatingLabelActiveTextColor) {
                _floatingLabel.textColor = self.floatingLabelActiveTextColor;
            }
            else {
                _floatingLabel.textColor = self.tintColor;
            }
            [self showFloatingLabel];
        }
    }
    else {
        _floatingLabel.textColor = self.floatingLabelTextColor;
        if (!self.text || 0 == [self.text length]) {
            [self hideFloatingLabel];
        }
    }
}

- (void)showFloatingLabel
{
    [self setLabelOriginForTextAlignment];
    
    [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionCurveEaseOut animations:^{
        _floatingLabel.alpha = 1.0f;
            
        _floatingLabel.frame = CGRectMake(_floatingLabel.frame.origin.x, 2.0f,
                                          _floatingLabel.frame.size.width, _floatingLabel.frame.size.height);
    } completion:nil];
}

- (void)hideFloatingLabel
{
    [self setLabelOriginForTextAlignment];
    
    [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionCurveEaseIn animations:^{
        _floatingLabel.alpha = 0.0f;
    } completion:^(BOOL finished) {
        _floatingLabel.frame = CGRectMake(_floatingLabel.frame.origin.x, _floatingLabel.font.lineHeight,
                                          _floatingLabel.frame.size.width, _floatingLabel.frame.size.height);
    }];
}

- (void)setLabelOriginForTextAlignment
{
    CGFloat originX = _floatingLabel.frame.origin.x;
    if (self.textAlignment == NSTextAlignmentCenter) {
        originX = (self.frame.size.width/2) - (_floatingLabel.frame.size.width/2);
    }
    else if (self.textAlignment == NSTextAlignmentRight) {
        originX = self.frame.size.width - _floatingLabel.frame.size.width;
    }
    _floatingLabel.frame = CGRectMake(originX, _floatingLabel.frame.origin.y,
                                      _floatingLabel.frame.size.width, _floatingLabel.frame.size.height);
}

@end
