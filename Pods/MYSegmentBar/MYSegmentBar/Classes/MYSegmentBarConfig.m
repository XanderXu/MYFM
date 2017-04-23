//
//  MYSegmentBarConfig.m
//  MYSegmentBar
//
//  Created by CoderXu on 2017/4/23.
//  Copyright © 2017年 517807635@qq.com. All rights reserved.
//

#import "MYSegmentBarConfig.h"

@implementation MYSegmentBarConfig
+ (instancetype)defaultConfig {
    
    MYSegmentBarConfig *config = [[MYSegmentBarConfig alloc] init];
    config.segmentBarBackColor = [UIColor clearColor];
    config.itemFont = [UIFont systemFontOfSize:15];
    config.itemNormalColor = [UIColor lightGrayColor];
    config.itemSelectColor = [UIColor redColor];
    
    config.indicatorColor = [UIColor redColor];
    config.indicatorHeight = 2;
    config.indicatorExtraW = 10;
    
    return config;
    
}
-(MYSegmentBarConfig *(^)(UIColor *))chainSegmentBarBackColor {
    return ^(UIColor *color){
        self.segmentBarBackColor = color;
        return self;
    };
}

-(MYSegmentBarConfig *(^)(UIColor *))chainItemNormalColor {
    return ^(UIColor *color){
        self.itemNormalColor = color;
        return self;
    };
}
-(MYSegmentBarConfig *(^)(UIColor *))chainItemSelectColor {
    return ^(UIColor *color){
        self.itemSelectColor = color;
        return self;
    };
}
-(MYSegmentBarConfig *(^)(UIFont *))chainItemFont {
    return ^(UIFont *font){
        self.itemFont = font;
        return self;
    };
}
-(MYSegmentBarConfig *(^)(UIColor *))chainIndicatorColor {
    return ^(UIColor *color){
        self.indicatorColor = color;
        return self;
    };
}
-(MYSegmentBarConfig *(^)(CGFloat))chainIndicatorHeight {
    return ^(CGFloat height) {
        self.indicatorHeight = height;
        return self;
    };
}
-(MYSegmentBarConfig *(^)(CGFloat))chainIndicatorExtraW {
    return ^(CGFloat extraW) {
        self.indicatorExtraW = extraW;
        return self;
    };
}
@end
