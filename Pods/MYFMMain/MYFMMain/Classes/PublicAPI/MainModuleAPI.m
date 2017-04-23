//
//  MainModuleAPI.m
//  Pods
//
//  Created by CoderXu on 2017/4/23.
//
//

#import "MainModuleAPI.h"
#import "MYTabBarController.h"
#import "MYNavigationController.h"
#import "MYTabBar.h"
#import "MYNavigationBar.h"
#import "MYMiddleView.h"
#import "UIImage+MYImage.h"
#import "UIView+MYLayout.h"
#import "Base.h"
@implementation MainModuleAPI

+ (UITabBarController *)rootTabBarController {
    return [MYTabBarController shareInstance];
}

+ (void)addChildVC: (UIViewController *)childVC normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired {
    [[MYTabBarController shareInstance] addChildVC:childVC normalImageName:normalImageName selectedImageName:selectedImageName isRequiredNavController:isRequired];
}

+ (void)setGlobalBackGroundImage: (UIImage *)glbalImage {
    [MYNavigationBar setGlobalBackGroundImage:glbalImage];
}

+ (void)setGlobalTextColor: (UIColor *)globalColor andFontSize: (CGFloat)fontSize {
    [MYNavigationBar setGlobalTextColor:globalColor andFontSize:fontSize];
}


+ (void)setTabbarMiddleBtnClickBlock:(void (^)(BOOL))middleClickBlock {
    MYTabBar *tabBar = (MYTabBar *)[MYTabBarController shareInstance].tabBar;
    tabBar.middleClickBlock = middleClickBlock;
}
@end
