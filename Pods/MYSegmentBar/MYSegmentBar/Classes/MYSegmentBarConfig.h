//
//  MYSegmentBarConfig.h
//  MYSegmentBar
//
//  Created by CoderXu on 2017/4/23.
//  Copyright © 2017年 517807635@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYSegmentBarConfig : NSObject
/** 默认配置 */
+ (instancetype)defaultConfig;

/** 背景颜色 */
@property (nonatomic, strong) UIColor *segmentBarBackColor;
/** 普通颜色 */
@property (nonatomic, strong) UIColor *itemNormalColor;
/** 选中颜色 */
@property (nonatomic, strong) UIColor *itemSelectColor;
@property (nonatomic, strong) UIFont *itemFont;
/** 下划线颜色 */
@property (nonatomic, strong) UIColor *indicatorColor;
/** 下划线高 */
@property (nonatomic, assign) CGFloat indicatorHeight;
/** 下划线比btn多出的宽 */
@property (nonatomic, assign) CGFloat indicatorExtraW;

/**************链式设置**************/
@property (nonatomic, copy, readonly) MYSegmentBarConfig *(^chainSegmentBarBackColor)(UIColor *color);
@property (nonatomic, copy, readonly) MYSegmentBarConfig *(^chainItemNormalColor)(UIColor *color);
@property (nonatomic, copy, readonly) MYSegmentBarConfig *(^chainItemSelectColor)(UIColor *color);
@property (nonatomic, copy, readonly) MYSegmentBarConfig *(^chainItemFont)(UIFont *font);
@property (nonatomic, copy, readonly) MYSegmentBarConfig *(^chainIndicatorColor)(UIColor *color);
@property (nonatomic, copy, readonly) MYSegmentBarConfig *(^chainIndicatorHeight)(CGFloat height);
@property (nonatomic, copy, readonly) MYSegmentBarConfig *(^chainIndicatorExtraW)(CGFloat extraW);
@end
