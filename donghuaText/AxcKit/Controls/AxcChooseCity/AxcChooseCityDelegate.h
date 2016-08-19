//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

@class AxcCity;
@class AxcChooseCityController;

@protocol AxcChooseCityDelegate <NSObject>

/**
 *  选中TableView时候会调用这个方法
 *
 *  @param chooseCityController 城市选择器控制器
 *  @param city                 返回城市信息
 */
- (void) axcCityPickerController:(AxcChooseCityController *)chooseCityController
                didSelectCity:(AxcCity *)city;


/**
 *  点击取消按钮会调用
 *
 *  @param chooseCityController 城市选择器控制器
 */
- (void) axcCityPickerControllerDidCancel:(AxcChooseCityController *)chooseCityController;

@end

@protocol AxcCityGroupCellDelegate <NSObject>

- (void) cityGroupCellDidSelectCity:(AxcCity *)city;

@end
