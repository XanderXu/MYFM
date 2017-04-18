//
//  MYDeviceMessage.h
//  喜马拉雅FM
//
//  Created by 许 on 16/8/24.
//  Copyright © 2016年 许. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYDeviceMessage : NSObject

/**
 *  设备剩余存储空间
 *
 *  @return 剩余存储空间
 */
+ (NSString *)freeDiskSpaceInBytes;

@end
