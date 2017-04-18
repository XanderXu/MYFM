//
//  MYMiddleView.h
//  MYFM
//
//  Created by Mac on 17/1/7.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYMiddleView : UIView

/**
 拿到中间视图

 @return 中间的视图
 */
+ (instancetype)shareInstance;

/**
 快速创建新的中间视图

 @return 新的中间视图
 */
+ (instancetype)middleView;

/**
 是否正在播放
 */
@property (assign, nonatomic) BOOL isPlaying;

/**
 中间的图片
 */
@property (strong, nonatomic) UIImage *middleImage;

/**
 点击中间按钮执行的代码块
 */
@property (copy, nonatomic) void(^middleClickBlock)(BOOL isPlaying);
@end
