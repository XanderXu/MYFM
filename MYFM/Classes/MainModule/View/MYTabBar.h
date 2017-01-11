//
//  MYTabBar.h
//  MYFM
//
//  Created by Mac on 17/1/7.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYTabBar : UITabBar

/**
 点击中间按钮执行的代码块
 */
@property (copy, nonatomic) void(^middleClickBlock)(BOOL isPlaying);
@end
