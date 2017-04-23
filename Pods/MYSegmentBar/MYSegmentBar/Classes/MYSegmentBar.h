//
//  MYSegmentBar.h
//  MYSegmentBar
//
//  Created by CoderXu on 2017/4/23.
//  Copyright © 2017年 517807635@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYSegmentBarConfig.h"

@class MYSegmentBar;
@protocol MYSegmentBarDelegate <NSObject>

/**
 代理方法,告诉外界,内部的点击数据

 @param segmentBar segmentBar
 @param toIndex 选中的索引(从0开始)
 @param fromIndex 上一个索引
 */
- (void)segmentBar:(MYSegmentBar *)segmentBar didSelectIndex: (NSInteger)toIndex fromIndex: (NSInteger)fromIndex;
@end
@interface MYSegmentBar : UIView

/**
 快速创建一个选项卡控件

 @param frame frame
 @return selectIndex
 */
+ (instancetype)segmentBarWithFrame:(CGRect)frame;

/**
 代理
 */
@property(nonatomic,weak) id<MYSegmentBarDelegate> delegate;

/**
 数据源,标题数组
 */
@property (nonatomic, strong) NSArray<NSString *>* items;

/**
 当前选中的索引,双向设置
 */
@property (nonatomic, assign) NSInteger selectIndex;

- (void)updateWithConfig:(void(^)(MYSegmentBarConfig *config))configBlock;
@end
