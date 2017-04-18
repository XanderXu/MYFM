//
//  MYNavigationBar.h
//  MYFM
//
//  Created by Mac on 17/1/7.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYNavigationBar : UINavigationBar
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
@end
