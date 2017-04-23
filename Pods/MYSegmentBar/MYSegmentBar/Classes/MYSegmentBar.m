//
//  MYSegmentBar.m
//  MYSegmentBar
//
//  Created by CoderXu on 2017/4/23.
//  Copyright © 2017年 517807635@qq.com. All rights reserved.
//

#import "MYSegmentBar.h"
#import "UIView+MYSegmentBar.h"

#define kMinMargin 30

@interface MYSegmentBar ()
{
    // 记录最后一次点击的按钮
    UIButton *_lastBtn;
}
/** 内容承载视图 */
@property (nonatomic, weak) UIScrollView *contentView;

/** 添加的按钮数据 */
@property (nonatomic, strong) NSMutableArray <UIButton *>*itemBtns;

/** 指示器 */
@property (nonatomic, weak) UIView *indicatorView;

@property (nonatomic, strong) MYSegmentBarConfig *config;
@end
@implementation MYSegmentBar
#pragma mark - 懒加载
-(MYSegmentBarConfig *)config {
    if (_config == nil) {
        _config = [MYSegmentBarConfig defaultConfig];
    }
    return _config;
}
-(UIScrollView *)contentView {
    if (_contentView == nil) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:scrollView];
        _contentView = scrollView;
    }
    return _contentView;
}
-(UIView *)indicatorView {
    if (_indicatorView == nil) {
        CGFloat indicatorH = self.config.indicatorHeight;
        UIView *indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - indicatorH, 0, indicatorH)];
        indicatorView.backgroundColor = self.config.segmentBarBackColor;
        [self.contentView addSubview:indicatorView];
        _indicatorView = indicatorView;
    }
    return _indicatorView;
}
-(NSMutableArray<UIButton *> *)itemBtns {
    if (_itemBtns == nil) {
        _itemBtns = [NSMutableArray array];
    }
    return _itemBtns;
}
#pragma mark - 接口
+ (instancetype)segmentBarWithFrame:(CGRect)frame {
    return [[self alloc] initWithFrame:frame];
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = self.config.segmentBarBackColor;
    }
    return self;
}
- (void)updateWithConfig:(void (^)(MYSegmentBarConfig *))configBlock {
    if (configBlock) {
        configBlock(self.config);
    }
    // 按照当前的 self.config 进行刷新
    self.backgroundColor = self.config.segmentBarBackColor;
    for (UIButton *btn in self.itemBtns) {
        [btn setTitleColor:self.config.itemNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.config.itemSelectColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.itemFont;
    }
    self.indicatorView.backgroundColor = self.config.indicatorColor;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
-(void)setSelectIndex:(NSInteger)selectIndex {
    if (self.itemBtns.count == 0 || selectIndex < 0 || selectIndex > self.itemBtns.count - 1) {
        return;
    }
    _selectIndex = selectIndex;
    UIButton *btn = self.itemBtns[selectIndex];
    [self btnClick:btn];
}
-(void)setItems:(NSArray<NSString *> *)items {
    _items = items;
    //先删除再添加
    [self.itemBtns makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.itemBtns = nil;
    
    for (NSString *item in items) {
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = self.itemBtns.count;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [btn setTitleColor:self.config.itemNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.config.itemSelectColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.itemFont;
        [btn setTitle:item forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
        [self.itemBtns addObject:btn];
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
#pragma mark 私有方法
- (void)btnClick:(UIButton *)btn {
    //调用代理
    if ([self.delegate respondsToSelector:@selector(segmentBar:didSelectIndex:fromIndex:)]) {
        [self.delegate segmentBar:self didSelectIndex:btn.tag fromIndex:_lastBtn.tag];
    }
    _selectIndex = btn.tag;
    _lastBtn.selected = NO;
    btn.selected = YES;
    _lastBtn = btn;
    
    [UIView animateWithDuration:0.1 animations:^{
        self.indicatorView.width = btn.width + self.config.indicatorExtraW * 2;
        self.indicatorView.centerX = btn.centerX;
    } completion:nil];
    //处理滚动
    CGFloat scrollX = btn.centerX - self.contentView.width * 0.5;//离中间多远
    if (scrollX < 0) {
        scrollX = 0;
    }
    if (scrollX > self.contentView.contentSize.width - self.contentView.width) {//总滚动长度
        scrollX = self.contentView.contentSize.width - self.contentView.width;
    }
    [self.contentView setContentOffset:CGPointMake(scrollX, 0) animated:YES];
}
#pragma mark 布局
-(void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
    // 计算margin
    CGFloat totalBtnWidth = 0;
    for (UIButton *btn in self.itemBtns) {
        [btn sizeToFit];
        totalBtnWidth += btn.width;
    }

    CGFloat caculateMargin = (self.width - totalBtnWidth) / (self.items.count + 1);
    if (caculateMargin < kMinMargin) {
        caculateMargin = kMinMargin;
    }
    CGFloat lastX = caculateMargin;
    for (UIButton *btn in self.itemBtns) {
        // w, h
        [btn sizeToFit];
        // y 0
        // x, y,
        btn.y = 0;
        
        btn.x = lastX;
        
        lastX += btn.width + caculateMargin;
        
    }
    
    self.contentView.contentSize = CGSizeMake(lastX, 0);
    
    if (self.itemBtns.count == 0) {
        return;
    }
    UIButton *btn = self.itemBtns[self.selectIndex];
    self.indicatorView.width = btn.width + self.config.indicatorExtraW * 2;
    self.indicatorView.centerX = btn.centerX;
    self.indicatorView.height = self.config.indicatorHeight;
    self.indicatorView.y = self.height - self.indicatorView.height;
}
@end