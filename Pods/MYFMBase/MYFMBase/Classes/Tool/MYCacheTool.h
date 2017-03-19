//
//  MYCacheTool.h
//  喜马拉雅FM
//
//  Created by 许 on 16/8/2.
//  Copyright © 2016年 许. All rights reserved.
//
//

#import <Foundation/Foundation.h>

@interface MYCacheTool : NSObject

+ (NSString *)getSizeWithPath: (NSString *)path;

+ (void)clearCacheWithPath: (NSString *)path;

@end
