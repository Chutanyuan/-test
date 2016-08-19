//
//  XZQPhotoPickerViewController.m
//  XZQPhotoPickerView
//
//  Created by Guen on 16/6/2.
//  Copyright © 2016年 Gemall. All rights reserved.
//

#import "AxcPhotoPickerViewController.h"



#define KSCREEN_W [UIScreen mainScreen].bounds.size.width
#define KSCREEN_H [UIScreen mainScreen].bounds.size.height
#define RGB(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
//间隔
const CGFloat margin = 2;
static NSString *cellId = @"photo";

@interface AxcPhotoPickerViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,PhotoCellDelegate>

@property(nonatomic,strong) NSMutableArray *photoArray;
@property(nonatomic,strong) UICollectionView *collectionView;
//被选中的照片
@property(nonatomic,strong) NSMutableArray *selectedPhotoArray;
//被选中的下标
@property(nonatomic,strong) NSMutableArray *indexArray;

@end

@implementation AxcPhotoPickerViewController


#pragma mark - lazyLoad
- (NSMutableArray *)photoArray{
    if (_photoArray == nil) {
        _photoArray = [NSMutableArray array];
    }
    return _photoArray;
}

- (NSMutableArray *)selectedPhotoArray{
    if (_selectedPhotoArray == nil) {
        _selectedPhotoArray = [NSMutableArray array];
    }
    return _selectedPhotoArray;
}


- (NSMutableArray *)indexArray{
    if (_indexArray == nil) {
        _indexArray = [NSMutableArray array];
    }
    return _indexArray;
}


- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        CGFloat itemW = (KSCREEN_W - margin * 4)/3;
        CGFloat itemH = itemW;
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.itemSize = CGSizeMake(itemW, itemH);
        flowLayout.minimumInteritemSpacing = margin;
        flowLayout.minimumLineSpacing = margin;
        flowLayout.sectionInset = UIEdgeInsetsMake(0.f, margin, margin, margin);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, KSCREEN_W, KSCREEN_H - 64) collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        
        [_collectionView registerClass:[PhotoCell class] forCellWithReuseIdentifier:cellId];
    }
    return _collectionView;
}


#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.photoArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.delegate = self;
    AxcPhotoPickModel *picModel = self.photoArray[indexPath.row];
    cell.pic.image = picModel.image;
    cell.selectedBtn.selected = picModel.isSelected;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoCell *cell = (PhotoCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    BrowserPhotoViewController *browserVC = [[BrowserPhotoViewController alloc]init];
    browserVC.allPhotoArray = self.photoArray;
    browserVC.selectedPhotoArray = self.selectedPhotoArray;
    browserVC.picIndex = (int)indexPath.row;
    browserVC.isFirstSelect = cell.selectedBtn.selected;
    //回调
    __weak typeof(self) weakSelf = self;
    browserVC.selectBlock = ^(NSArray *photoBlockArray){
        weakSelf.photoArray = [NSMutableArray arrayWithArray:photoBlockArray];
        [weakSelf filterSelectPhotoWithPhotoArray:weakSelf.photoArray];
        [weakSelf.collectionView reloadData];
    };
    [self presentViewController:browserVC animated:YES completion:^{
    }];
}

//BLOCK筛选出被选中的照片
- (void)filterSelectPhotoWithPhotoArray:(NSArray *)photoArray{
    NSMutableArray *mArr = [NSMutableArray array];
    for (AxcPhotoPickModel *picModel in photoArray) {
        if (picModel.isSelected) {
            [mArr addObject:picModel];
        }
    }
    
    [self.selectedPhotoArray removeAllObjects];
    [self.selectedPhotoArray addObjectsFromArray:mArr];
}


#pragma mark - PhotoCellDelegate
- (void)selectPhotoWithButton:(UIButton *)btn{
    
    [self shakeAnimationForView:btn];
    PhotoCell *cell = (PhotoCell *)btn.superview.superview;
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    AxcPhotoPickModel *picModel = self.photoArray[indexPath.row];
    
    if (self.selectedPhotoArray.count == 9 && cell.selectedBtn.selected == NO) {
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:nil message:@"不能选中超过9张图片" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertC addAction:action];
        [self presentViewController:alertC animated:YES completion:nil];
        return;
    }else if (self.selectedPhotoArray.count == 9 && cell.selectedBtn.selected == YES){
        cell.selectedBtn.selected = NO;
        picModel.isSelected = NO;
        [self.selectedPhotoArray removeObject:self.photoArray[indexPath.row]];
        NSLog(@"已选%ld张",(unsigned long)self.selectedPhotoArray.count);
        return;
    }
    
    
    cell.selectedBtn.selected = !cell.selectedBtn.selected;
    picModel.isSelected = !picModel.isSelected;
    
    if (cell.selectedBtn.selected) {
        if (![self.selectedPhotoArray containsObject:self.photoArray[indexPath.row]]) {
            [self.selectedPhotoArray addObject:self.photoArray[indexPath.row]];
            [self.indexArray addObject:@(indexPath.row)];
        }
    }else{
        if ([self.selectedPhotoArray containsObject:self.photoArray[indexPath.row]]) {
            [self.selectedPhotoArray removeObject:self.photoArray[indexPath.row]];
            [self.indexArray removeObject:@(indexPath.row)];
        }
    }
//    NSLog(@"已选%ld张",(unsigned long)self.selectedPhotoArray.count);
}


#pragma mark 抖动动画
- (void)shakeAnimationForView:(UIView *) view{
    
    // 获取到当前的View
    CALayer *viewLayer = view.layer;
    // 获取当前View的位置
    CGPoint position = viewLayer.position;
    // 移动的两个终点位置
    CGPoint x = CGPointMake(position.x + 1, position.y);
    CGPoint y = CGPointMake(position.x - 1, position.y);
    // 设置动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    // 设置运动形式
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    // 设置开始位置
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    // 设置结束位置
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    // 设置自动反转
    [animation setAutoreverses:YES];
    // 设置时间
    [animation setDuration:.06];
    // 设置次数
    [animation setRepeatCount:3];
    // 添加上动画
    [viewLayer addAnimation:animation forKey:nil];
    
    
    
}

#pragma mark - 获取所有照片
- (void)getAllPhotos{
    dispatch_async(dispatch_get_main_queue(), ^{
        // 获得所有的自定义相簿
        PHFetchResult<PHAssetCollection *> *assetCollections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
        // 遍历所有的自定义相簿
        for (PHAssetCollection *assetCollection in assetCollections) {
            [self enumerateAssetsInAssetCollection:assetCollection original:YES];
        }
        
        // 获得相机胶卷
        PHAssetCollection *cameraRoll = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil].lastObject;
        // 遍历相机胶卷,获取大图
        [self enumerateAssetsInAssetCollection:cameraRoll original:YES];
    });
    [self.collectionView reloadData];
}


/**
 *  遍历相簿中的所有图片
 *  @param assetCollection 相簿
 *  @param original        是否要原图
 */
- (void)enumerateAssetsInAssetCollection:(PHAssetCollection *)assetCollection original:(BOOL)original
{
    NSLog(@"相簿名:%@", assetCollection.localizedTitle);
    
    
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    // 同步获得图片, 只会返回1张图片
    options.synchronous = YES;
    options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    
    // 获得某个相簿中的所有PHAsset对象
    __weak typeof(self) weakSelf = self;
    PHFetchResult<PHAsset *> *assets = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
    for (PHAsset *asset in assets) {
        // 是否要原图
//        CGSize size = CGSizeMake(asset.pixelWidth, asset.pixelHeight);
        //如果设置size过大的话会出现crash，还有个问题，浏览图片的时候图片模糊的情况
        CGSize size = CGSizeMake(220, 220);

        // 从asset中获得图片
        [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:size contentMode:PHImageContentModeAspectFit options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            //数据处理
            AxcPhotoPickModel *picModel = [[AxcPhotoPickModel alloc]init];
            picModel.image = result;
            picModel.isSelected = NO;
            [weakSelf.photoArray addObject:picModel];
        }];
    }
    [self.collectionView reloadData];
}


#pragma mark - UI
- (void)initNaviBar{
    UIView *naviView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_W, 64)];
    naviView.backgroundColor = RGB(2, 144, 235, 1);
    [self.view addSubview:naviView];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(5, 20 + 2, 50, 40);
    cancelBtn.backgroundColor = [UIColor clearColor];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [naviView addSubview:cancelBtn];
    
    UIButton *finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    finishBtn.frame = CGRectMake(KSCREEN_W - 5 - 50, 20 + 2, 50, 40);
    finishBtn.backgroundColor = [UIColor clearColor];
    [finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [finishBtn addTarget:self action:@selector(finishBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [naviView addSubview:finishBtn];
}

- (void)initCollectionView{
    [self.view addSubview:self.collectionView];
}


#pragma mark - ActionMethod
- (void)finishBtnAction:(UIButton *)btn{
    //筛选出image，放置数组中
    NSMutableArray *selectMImgArr = [NSMutableArray array];
    for (AxcPhotoPickModel *picModel in self.selectedPhotoArray) {
        [selectMImgArr addObject:picModel.image];
    }
    
    
    //block回调
    if (self.finishBlock) {
        self.finishBlock(selectMImgArr);
    }
    //代理传值
    if ([self.delegate respondsToSelector:@selector(axcFinishToSelectPhotoWithPhotoArray:)]) {
        [self.delegate axcFinishToSelectPhotoWithPhotoArray:selectMImgArr];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)cancelAction:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 试图生命周期
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNaviBar];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initCollectionView];
    
    [self getAllPhotos];
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
