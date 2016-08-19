//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import "AxcCustomShareView.h"

#define UIBounds [[UIScreen mainScreen] bounds] //window外框大小
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]

@interface AxcCustomShareView ()
{
    
}


@end

@implementation AxcCustomShareView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        _huiseControl=[[UIControl alloc]initWithFrame:CGRectMake(0, 0, UIBounds.size.width, UIBounds.size.height)];
        _huiseControl.backgroundColor=RGBACOLOR(0, 0, 0, 0.4);
        [_huiseControl addTarget:self action:@selector(huiseControlClick) forControlEvents:UIControlEventTouchUpInside];
        _huiseControl.alpha=0;
        self.backgroundColor = [UIColor whiteColor];
        
     
        
        _shareListView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UIBounds.size.width, 191)];
        _shareListView.backgroundColor = RGBACOLOR(255, 255, 255, 1);
        [self addSubview:_shareListView];
        
        
        
        _title = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, UIBounds.size.width, 20)];
        _title.textColor = RGBACOLOR(0, 0, 0,1);
        _title.font = [UIFont boldSystemFontOfSize:20];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.text = @"title:分享";
        [_shareListView addSubview:_title];
        
        
        _remind = [[UILabel alloc]initWithFrame:CGRectMake(16, _title.frame.origin.y+_title.frame.size.height+16, UIBounds.size.width-16*2, 17)];
        _remind.textColor = RGBACOLOR(0, 0, 0,0.8);
        _remind.font = [UIFont systemFontOfSize:14];
        _remind.textAlignment = NSTextAlignmentLeft;
        _remind.text = @"remind:分享给好友，和大家一起happy！";
        [_shareListView addSubview:_remind];
        
 
        
        
    }
    return self;
}

- (void)setButtonImageArray:(NSArray *)array buttonTitleArray:(NSArray *)titleArray{
    
    CGFloat leftPading = 24;
    CGFloat space = (UIBounds.size.width-24*2-48*4)/3;
    CGFloat width = 48;
    //        _titleArray = @[@"微信好友",@"朋友圈",@"QQ",@"QQ空间"];
    
    for (int i=0; i<titleArray.count; i++) {
        
        UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        shareButton.frame = CGRectMake(leftPading+(width+space)*i, _remind.frame.origin.y+_remind.frame.size.height+24, width, width);
        NSString *imageName = [NSString stringWithFormat:@"%@",array[i]];
        [shareButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [_shareListView addSubview:shareButton];
        
        
        
        UILabel *shareLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftPading+(width+space)*i, shareButton.frame.origin.y+shareButton.frame.size.height+8, width, 14)];
        shareLabel.textColor = RGBACOLOR(0, 0, 0, 1);
        shareLabel.font = [UIFont systemFontOfSize:12];
        shareLabel.text = [titleArray objectAtIndex:i];
        shareLabel.textAlignment = NSTextAlignmentCenter;
        [_shareListView addSubview:shareLabel];
        
        
        CGFloat shareControlWidth = 90;
        if (i==0 || i==3) {
            
            shareControlWidth = leftPading+width+space/2;
            
        }else
        {
            shareControlWidth = width+space;
        }
        
        UIControl *shareControl = [[UIControl alloc]initWithFrame:CGRectMake(0+(leftPading+width+space/2)*i, shareButton.frame.origin.y-12, shareControlWidth, 12+48+8+14+12)];
        shareControl.tag = i+1;
        [_shareListView addSubview:shareControl];
        [shareControl addTarget:self action:@selector(shareControl:) forControlEvents:UIControlEventTouchUpInside];
        
    }
}

- (void)showInView:(UIView *) view {
    if (self.isHidden) {
        self.hidden = NO;
        if (_huiseControl.superview==nil) {
            [view addSubview:_huiseControl];
        }
        [UIView animateWithDuration:0.2 animations:^{
            _huiseControl.alpha=1;
        }];
        CATransition *animation = [CATransition  animation];
        animation.delegate = self;
        animation.duration = 0.2f;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.type = kCATransitionPush;
        animation.subtype = kCATransitionFromTop;
        [self.layer addAnimation:animation forKey:@"animation1"];
        self.frame = CGRectMake(0,view.frame.size.height - 191, UIBounds.size.width, 191);
        [view addSubview:self];
    }
}


- (void)hideInView {
    if (!self.isHidden) {
        self.hidden = YES;
        CATransition *animation = [CATransition  animation];
        animation.delegate = self;
        animation.duration = 0.2f;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.type = kCATransitionPush;
        animation.subtype = kCATransitionFromBottom;
        [self.layer addAnimation:animation forKey:@"animtion2"];
        [UIView animateWithDuration:0.2 animations:^{
            _huiseControl.alpha=0;
        }completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
}

- (void)shareControl:(UIControl *)sender{
    [_delegate AxcCustomShareView:self didSelectAtIndex:sender.tag - 1];
}

-(void)huiseControlClick{
    [self hideInView];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

