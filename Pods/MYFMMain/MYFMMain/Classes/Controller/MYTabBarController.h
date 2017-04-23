//
//  MYTabBarController.h
//  MYFM
//
//  Created by Mac on 17/1/7.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYTabBarController : UITabBarController


/**
 获取单例对象

 @return MYTabBarController
 */
+ (instancetype)shareInstance;

/**
 创建一个新的tabBarVC并添加子控制器

 @param addVCsBlock 添加子控制器代码
 @return MYTabBarController
 */
+ (instancetype)tabBarControllerWithAddChildVCsBlock:(void(^)(MYTabBarController *tabBarVC))addVCsBlock;

/**
 添加子控制器的方法

 @param childVC 子控制器
 @param normalImageName 普通状态图片
 @param selectedImageName 选中状态图片
 @param isRequired 是否需要包装导航控制器
 */
- (void)addChildVC: (UIViewController *)childVC normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired;
@end
