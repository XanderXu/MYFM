//
//  MYTabBarController.m
//  MYFM
//
//  Created by Mac on 17/1/7.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import "MYTabBarController.h"
#import "MYNavigationController.h"
#import "MYTabBar.h"
#import "MYNavigationBar.h"
#import "MYMiddleView.h"
#import "UIImage+MYImage.h"
#import "UIView+MYLayout.h"

@interface MYTabBarController ()

@end

@implementation MYTabBarController
+(instancetype)shareInstance {
    static MYTabBarController *tabBarVC;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        tabBarVC = [[MYTabBarController alloc] init];
    });
    return tabBarVC;
}
+(instancetype)tabBarControllerWithAddChildVCsBlock:(void (^)(MYTabBarController *))addVCsBlock {
    MYTabBarController *tabBarVC = [[MYTabBarController alloc] init];
    if (addVCsBlock) {
        addVCsBlock(tabBarVC);
    }
    return tabBarVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tabBar
    [self setupTabBar];
}
- (void)setupTabBar {
    [self setValue:[[MYTabBar alloc] init] forKey:@"tabBar"];
}

-(void)addChildVC:(UIViewController *)childVC normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController:(BOOL)isRequired {
    if (isRequired) {
        MYNavigationController *nav = [[MYNavigationController alloc] initWithRootViewController:childVC];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage originImageWithName:normalImageName] selectedImage:[UIImage originImageWithName:selectedImageName]];
        [self addChildViewController:nav];
    }else {
        [self addChildViewController:childVC];
    }
}
-(void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    UIViewController *vc = self.childViewControllers[selectedIndex];
    //判断哪些tabBarController的子界面(一般是导航控制器)需要显示新的中间按钮
    if (vc.view.tag == 666) {
        vc.view.tag = 888;
        //创建一个新的中间按钮
        MYMiddleView *middleView = [MYMiddleView middleView];
        //各属性和首页的单例按钮保持一致
        middleView.middleClickBlock = [MYMiddleView shareInstance].middleClickBlock;
        middleView.isPlaying = [MYMiddleView shareInstance].isPlaying;
        middleView.middleImage = [MYMiddleView shareInstance].middleImage;
        //中间按钮大小位置,x方向居中,y方向底部对齐
        CGFloat width = 65;
        CGFloat height = 65;
        middleView.frame = CGRectMake((kScreenWidth - width) * 0.5, (kScreenHeight - height), width, height);
        [vc.view addSubview:middleView];
    }
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
