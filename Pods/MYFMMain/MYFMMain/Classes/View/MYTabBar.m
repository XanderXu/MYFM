//
//  MYTabBar.m
//  MYFM
//
//  Created by Mac on 17/1/7.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import "MYTabBar.h"
#import "MYNavigationController.h"
#import "MYMiddleView.h"
#import "UIView+MYLayout.h"


@interface MYTabBar()
@property (nonatomic, weak) MYMiddleView *middleView;
@end
@implementation MYTabBar
- (MYMiddleView *)middleView {
    if (_middleView == nil) {
        MYMiddleView *middleView = [MYMiddleView middleView];
        [self addSubview:middleView];
        _middleView = middleView;
    }
    return _middleView;
}
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupInit];
    }
    return self;
}
- (void)setupInit {
    //设置样式,去除tabBar上面的黑线
    self.barStyle = UIBarStyleBlack;
    //设置背景图片
    NSString *imagePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"tabbar_bg@2x.png" ofType:nil inDirectory:@"MYFMMain.bundle"];
    self.backgroundImage = [UIImage imageWithContentsOfFile:imagePath];
    //[UIImage imageNamed:@"tabbar_bg"];
    
//    //添加一个按钮,先放在中间
//    CGFloat width = 65;
//    CGFloat height = 65;
//    self.middleView.frame = CGRectMake((kScreenWidth - width) * 0.5, (kScreenHeight - height), width, height);
}
- (void)setMiddleClickBlock:(void (^)(BOOL))middleClickBlock {
    self.middleView.middleClickBlock = middleClickBlock;//调用中间按钮懒加载
}

-(void)layoutSubviews {
    [super layoutSubviews];
    NSInteger count = self.items.count;
    //遍历所有的子控件
    NSArray *subViews = self.subviews;
    //确定单个控件的大小
    CGFloat btnW = self.width / (count + 1);
    CGFloat btnH = self.height;
    CGFloat btnY = 5;
    NSInteger index = 0;
    for (UIView *subView in subViews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (index == count / 2) {
                index ++;
            }
            CGFloat btnX = index * btnW;
            subView.frame = CGRectMake(btnX, btnY, btnW, btnH);
            index ++;
        }
    }
    self.middleView.centerX = self.frame.size.width * 0.5;
    self.middleView.y = self.height - self.middleView.height;//下边平齐
}
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    //设置允许交互的区域(整个tabBar的矩形区域可以响应,中间按钮比tabBar高出18,中间按钮距离中心33以内也响应)
    
    //1.转换点击的坐标点,从tabbar上,到中间按钮上
    CGPoint pointInMiddleBtn = [self convertPoint:point toView:self.middleView];
    //2.确定中间按钮的圆心
    CGPoint middleBtnCenter = CGPointMake(33, 33);
    //3.计算点击的位置距离圆心的距离
    CGFloat distance = sqrt(pow(pointInMiddleBtn.x - middleBtnCenter.x, 2) + pow(pointInMiddleBtn.y - middleBtnCenter.y, 2));
    //4.判定中间按钮区域之外,距离中心超过33并且点击的是上边18以内,不响应
    if (distance > 33 && pointInMiddleBtn.y < 18) {
        return NO;
    }
    return YES;
}
@end
