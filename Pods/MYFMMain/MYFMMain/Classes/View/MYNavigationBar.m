//
//  MYNavigationBar.m
//  MYFM
//
//  Created by Mac on 17/1/7.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import "MYNavigationBar.h"

@implementation MYNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/**
 设置全局的导航栏背景图片

 @param glbalImage 全局导航栏背景图片
 */
+ (void)setGlobalBackGroundImage: (UIImage *)glbalImage {
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[NSClassFromString(@"MYNavigationController")]];
    [navBar setBackgroundImage:glbalImage forBarMetrics:UIBarMetricsDefault];
    
}

/**
 设置全局导航栏标题颜色

 @param globalColor 全局导航栏标题颜色
 @param fontSize 全局导航标题文字大小
 */
+ (void)setGlobalTextColor: (UIColor *)globalColor andFontSize: (CGFloat)fontSize {
    if (globalColor == nil) {
        return;
    }
    if (fontSize < 6 || fontSize > 40) {
        fontSize = 16;
    }
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[NSClassFromString(@"MYNavigationController")]];
    //设置导航栏颜色
    NSDictionary *titleDict = @{
                                NSForegroundColorAttributeName:globalColor,
                                NSFontAttributeName:[UIFont systemFontOfSize:fontSize]
                                };
    [navBar setTitleTextAttributes:titleDict];
}
@end
