//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "AxcRoundStringView.h"

@interface AxcRoundStringView ()
@property(strong,nonatomic)UIButton* button;
@property(strong,nonatomic)UIButton* Tempbutton;

@property(assign,nonatomic)NSInteger titleCount;

@property(assign,nonatomic)NSInteger currentCount;
@property(strong,nonatomic)NSTimer* timer;
@end


@implementation AxcRoundStringView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self addSubViewS];
        _timer=[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(ChangeView) userInfo:nil repeats:YES];
    }
    [self setClipsToBounds:YES];
    return self;
}
-(void)addSubViewS
{
    _currentCount=0;
    UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setFrame:self.bounds];
    
    [button addTarget:self action:@selector(ButtonHadClick) forControlEvents:UIControlEventTouchUpInside];
    _button=button;
    
    UIButton* Tempbutton=[[UIButton alloc]initWithFrame:button.frame];
    [Tempbutton setCenter:CGPointMake(button.center.x+button.bounds.size.width, button.center.y)];
    [Tempbutton addTarget:self action:@selector(ButtonHadClick) forControlEvents:UIControlEventTouchUpInside];
    _Tempbutton=Tempbutton;
    
    [self addSubview:_button];
    [self addSubview:_Tempbutton];
    
}
-(void)setTitles:(NSArray *)titles
{
    _titles=titles;
    [_button setTitle:_titles[0] forState:UIControlStateNormal];
    [_Tempbutton setTitle:_titles[1] forState:UIControlStateNormal];
    _titleCount=titles.count;
    
}


-(void)setLableFont:(UIFont *)font
{
    [_button.titleLabel setFont:font];
    [_Tempbutton.titleLabel setFont:font];
}
-(void)setLableColor:(UIColor *)color
{
    [_button setTitleColor:color forState:UIControlStateNormal];
    [_Tempbutton setTitleColor:color forState:UIControlStateNormal];
}
-(void)ChangeView
{
    [UIView animateWithDuration:1.0 animations:^{
        
        [_Tempbutton setCenter:_button.center];
        [_button setCenter:CGPointMake(-_button.bounds.size.width/2, _button.center.y)];
    } completion:^(BOOL finished) {
        
        [self ViewChangeWithButton:_Tempbutton];
    }];
}
-(void)ViewChangeWithButton:(UIButton*)button
{
    _Tempbutton=_button;
    _button=button;
    [_Tempbutton setCenter:CGPointMake(_button.center.x+_button.bounds.size.width, _Tempbutton.center.y)];
    if (_currentCount==_titleCount-1) {
        _currentCount=0;
    }else
    {
        _currentCount++;
    }
    NSLog(@"%ld",(long)_currentCount);
//    [_button setTitle:_titles[_currentCount] forState:UIControlStateNormal];
    [_Tempbutton setTitle:_titles[_currentCount] forState:UIControlStateNormal];
}
-(void)ButtonHadClick
{
    [self.delegate RoundViewClickTheTitleWithNumber:_currentCount];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
