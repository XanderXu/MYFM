//
//  MYNavigationController.m
//  MYFM
//
//  Created by Mac on 17/1/7.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import "MYNavigationController.h"
#import "MYNavigationBar.h"
#import "MYMiddleView.h"
#import "UIView+MYLayout.h"

@interface MYNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation MYNavigationController
-(instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        [self setValue:[[MYNavigationBar alloc]init] forKey:@"navigationBar"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //取出系统识别到的滑动返回手势
    UIGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
    //延迟识别点按手势
    gesture.delaysTouchesBegan = YES;
    //手动创建新手势,执行原手势的返回方法,执行对象为原手势的代理
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:gesture.delegate action:NSSelectorFromString(@"handleNavigationTransition:")];
    //添加到原手势作用的view上
    [gesture.view addGestureRecognizer:panGesture];
    panGesture.delegate = self;
}
- (void)back {
    [self popViewControllerAnimated:YES];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //拦截第一个push的控制器,进行统一设置
    //过滤第一个根控制器
    if (self.childViewControllers.count > 0) {
        //统一设置返回按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_back_n"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //千万不要忘记写
    [super pushViewController:viewController animated:animated];
    //判断哪些界面需要显示底部播放按钮
    if (viewController.view.tag == 666) {
        viewController.view.tag = 888;
        //创建一个新的中间按钮
        MYMiddleView *middleView = [MYMiddleView middleView];
        //各属性和首页的按钮保持一致
        middleView.middleClickBlock = [MYMiddleView shareInstance].middleClickBlock;
        middleView.isPlaying = [MYMiddleView shareInstance].isPlaying;
        middleView.middleImage = [MYMiddleView shareInstance].middleImage;
        //中间按钮大小位置,x方向居中,y方向底部对齐屏幕
        CGFloat width = 65;
        CGFloat height = 65;
        middleView.frame = CGRectMake((kScreenWidth - width) * 0.5, (kScreenHeight - height), width, height);
        [viewController.view addSubview:middleView];
    }
}
#pragma mark - 手势代理
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    //如果导航控制器的根控制器也要返回手势有效,就会千万假死,所以需要过滤根控制器
    if (self.childViewControllers.count == 1) {
        return NO;
    }
    return YES;
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
