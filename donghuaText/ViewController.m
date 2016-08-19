//
//  ViewController.m
//  donghuaText
//
//  Created by Axc_5324 on 16/6/28.
//  Copyright © 2016年 赵新. All rights reserved.
//

#import "ViewController.h"

#import "AxcKit.h"
#import "axc.h"
@interface ViewController ()
{
    UIColor *lineColor;
    
    int angle;
    UIImageView *imageView;
    
    BOOL bol;
    axc *a;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    lineColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor AxcWetAsphaltColor];
    
    [self star];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(star) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)star{
    if (!bol) {
        a = [[axc alloc]initWithFrame:self.view.frame];
        [self.view addSubview:a];
        [a star];
        bol = YES;
    }else{
        [a removeFromSuperview];
        bol = NO;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
