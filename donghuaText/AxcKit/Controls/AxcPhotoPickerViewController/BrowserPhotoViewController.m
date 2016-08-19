//
//  BrowserPhotoViewController.m
//  XZQPhotoPickerView
//
//  Created by Guen on 16/6/2.
//  Copyright © 2016年 Gemall. All rights reserved.
//

#import "BrowserPhotoViewController.h"

#import "AxcPhotoPickModel.h"

#define KSCREEN_W [UIScreen mainScreen].bounds.size.width
#define KSCREEN_H [UIScreen mainScreen].bounds.size.height
#define RGB(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

@interface BrowserPhotoViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong) UIView *naviView;
@property(nonatomic,strong) UIButton *selectBtn;
@property(nonatomic,strong) NSMutableArray *mPhotoArray;
@property(nonatomic,strong) NSMutableArray *hasSelectArray;
//当前下标
@property(nonatomic,assign) int currentIndex;

@end

@implementation BrowserPhotoViewController

#pragma mark - lazyLoad
- (NSMutableArray *)mPhotoArray{
    if (_mPhotoArray == nil) {
        _mPhotoArray = [NSMutableArray arrayWithArray:self.allPhotoArray];
    }
    return _mPhotoArray;
}

- (NSMutableArray *)hasSelectArray{
    if (_hasSelectArray == nil) {
        _hasSelectArray = [NSMutableArray arrayWithArray:self.selectedPhotoArray];
    }
    return _hasSelectArray;
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initScrollView];

    [self initNaviBar];
}

#pragma mark - ActionMethod
- (void)tapAction:(UITapGestureRecognizer *)tap{
    [UIView animateWithDuration:0.5f animations:^{
        _naviView.frame = _naviView.frame.origin.y == -64 ? CGRectMake(0, 0, KSCREEN_W, 64) : CGRectMake(0, -64, KSCREEN_W, 64);
    }];
}

- (void)backAction:(UIButton *)btn{
    if (self.selectBlock) {
        self.selectBlock(self.allPhotoArray);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)selectBtnAction:(UIButton *)btn{
    
    btn.selected = !btn.selected;
    AxcPhotoPickModel *picModel = self.mPhotoArray[_currentIndex];
    if (btn.selected) {
        if (self.hasSelectArray.count >= 9) {
            btn.selected = NO;
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:nil message:@"不能选中超过9张图片" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alertC addAction:action];
            [self presentViewController:alertC animated:YES completion:nil];
            return;
        }
        [self.hasSelectArray addObject:picModel];
    }else{
        
        [self.hasSelectArray removeObject:picModel];
    }
    picModel.isSelected = btn.selected;
    self.allPhotoArray = self.mPhotoArray;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [UIView animateWithDuration:0.5f animations:^{
        _naviView.frame = CGRectMake(0, 0, KSCREEN_W, 64);
    }];
    int offX = scrollView.contentOffset.x/KSCREEN_W;
    _currentIndex = offX;
    AxcPhotoPickModel *picModel = self.allPhotoArray[offX];
    _selectBtn.selected = picModel.isSelected;
}


#pragma mark - UI

- (void)initScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_W, KSCREEN_H)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor blackColor];
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(KSCREEN_W * self.allPhotoArray.count, KSCREEN_H);
    for (int i = 0; i < self.allPhotoArray.count; i++) {
        AxcPhotoPickModel *picModel = self.allPhotoArray[i];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(KSCREEN_W * i, 0, KSCREEN_W, KSCREEN_H)];
        imageView.backgroundColor = [UIColor blackColor];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [scrollView addSubview:imageView];
        UIImage *image = picModel.image;
        imageView.image = image;
        
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [imageView addGestureRecognizer:tap];
    }
    [self.view addSubview:scrollView];
    scrollView.contentOffset = CGPointMake(KSCREEN_W * self.picIndex, 0);
    _currentIndex = self.picIndex;
}


- (void)initNaviBar{
    UIView *naviView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_W, 64)];
    naviView.backgroundColor = RGB(0, 0, 0, 0.5);
    [self.view addSubview:naviView];
    _naviView = naviView;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(5, 20 + 7, 30, 30);
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn setImage:[UIImage imageNamed:@"navigator_btn_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [naviView addSubview:backBtn];
    
    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    selectBtn.frame = CGRectMake(KSCREEN_W - 5 - 40, 20 + 7, 30, 30);
    selectBtn.backgroundColor = [UIColor clearColor];
    [selectBtn setBackgroundImage:[UIImage imageNamed:@"ico_check_nomal@2X"] forState:UIControlStateNormal];
    [selectBtn setBackgroundImage:[UIImage imageNamed:@"ico_check_red@2X"] forState:UIControlStateSelected];
    [selectBtn addTarget:self action:@selector(selectBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [naviView addSubview:selectBtn];
    _selectBtn = selectBtn;
    //标注第一张是否被选中
    _selectBtn.selected = _isFirstSelect;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
