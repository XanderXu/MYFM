//
//  MYSegmentBarVC.m
//  MYSegmentBar
//
//  Created by CoderXu on 2017/4/23.
//  Copyright © 2017年 517807635@qq.com. All rights reserved.
//

#import "MYSegmentBarVC.h"
#import "UIView+MYSegmentBar.h"
@interface MYSegmentBarVC ()<MYSegmentBarDelegate, UIScrollViewDelegate>
@property (nonatomic, weak) UIScrollView *contentView;
@end

@implementation MYSegmentBarVC
- (MYSegmentBar *)segmentBar {
    if (!_segmentBar) {
        MYSegmentBar *segmentBar = [MYSegmentBar segmentBarWithFrame:CGRectZero];
        segmentBar.delegate = self;
        segmentBar.backgroundColor = [UIColor brownColor];
        [self.view addSubview:segmentBar];
        _segmentBar = segmentBar;
        
    }
    return _segmentBar;
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        
        UIScrollView *contentView = [[UIScrollView alloc] init];
        contentView.delegate = self;
        contentView.pagingEnabled = YES;
        [self.view addSubview:contentView];
        _contentView = contentView;
    }
    return _contentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs {
    
    
    NSAssert(items.count != 0 || items.count == childVCs.count, @"个数不一致, 请自己检查");
    
    self.segmentBar.items = items;
    
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    
    // 添加几个自控制器
    // 在contentView, 展示子控制器的视图内容
    for (UIViewController *vc in childVCs) {
        [self addChildViewController:vc];
    }
    
    //
    self.contentView.contentSize = CGSizeMake(items.count * self.view.width, 0);
    
    self.segmentBar.selectIndex = 0;
    
    
    
}

- (void)showChildVCViewsAtIndex: (NSInteger)index {
    
    if (self.childViewControllers.count == 0 || index < 0 || index > self.childViewControllers.count - 1) {
        return;
    }
    
    UIViewController *vc = self.childViewControllers[index];
    vc.view.frame = CGRectMake(index * self.contentView.width, 0, self.contentView.width, self.contentView.height);
    [self.contentView addSubview:vc.view];
    
    // 滚动到对应的位置
    [self.contentView setContentOffset:CGPointMake(index * self.contentView.width, 0) animated:YES];
    
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    if (self.segmentBar.superview == self.view) {
        self.segmentBar.frame = CGRectMake(0, 60, self.view.width, 35);
        
        CGFloat contentViewY = self.segmentBar.y + self.segmentBar.height;
        CGRect contentFrame = CGRectMake(0, contentViewY, self.view.width, self.view.height - contentViewY);
        self.contentView.frame = contentFrame;
        self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.width, 0);
        
        return;
    }
    
    
    CGRect contentFrame = CGRectMake(0, 0,self.view.width,self.view.height);
    self.contentView.frame = contentFrame;
    self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.width, 0);
    
    
    // 其他的控制器视图, 大小
    // 遍历所有的视图, 重新添加, 重新进行布局
    // 注意: 1个视图
    //
    
    self.segmentBar.selectIndex = self.segmentBar.selectIndex;
    
}

#pragma mark - 选项卡代理方法
- (void)segmentBar:(MYSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex
{
    NSLog(@"%zd----%zd", fromIndex, toIndex);
    [self showChildVCViewsAtIndex:toIndex];
}


#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // 计算最后的索引
    NSInteger index = self.contentView.contentOffset.x / self.contentView.width;
    
    //    [self showChildVCViewsAtIndex:index];
    self.segmentBar.selectIndex = index;
    
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
