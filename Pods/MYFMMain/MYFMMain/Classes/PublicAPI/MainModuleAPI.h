//
//  MainModuleAPI.h
//  Pods
//
//  Created by CoderXu on 2017/4/23.
//
//

#import <Foundation/Foundation.h>

@interface MainModuleAPI : NSObject

/**
 获取根控制器

 @return rootTabBarController
 */
+ (UITabBarController *)rootTabBarController;
/**
 添加子控制器的方法
 
 @param childVC 子控制器
 @param normalImageName 普通状态图片
 @param selectedImageName 选中状态图片
 @param isRequired 是否需要包装导航控制器
 */
+ (void)addChildVC: (UIViewController *)childVC normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired;
/**
 设置全局的导航栏背景图片
 
 @param glbalImage 全局导航栏背景图片
 */
+ (void)setGlobalBackGroundImage: (UIImage *)glbalImage;
/**
 设置全局导航栏标题颜色
 
 @param globalColor 全局导航栏标题颜色
 @param fontSize 全局导航标题文字大小
 */
+ (void)setGlobalTextColor: (UIColor *)globalColor andFontSize: (CGFloat)fontSize;

/**
 设置tabbar中间控件的点击代码块

 @param middleClickBlock 设置tabbar中间控件的点击代码块
 */
+ (void)setTabbarMiddleBtnClickBlock:(void (^)(BOOL))middleClickBlock;
@end
