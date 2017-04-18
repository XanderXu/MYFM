//
//  MYDeviceMessage.m
//  喜马拉雅FM
//
//  Created by 许 on 16/8/24.
//  Copyright © 2016年 许. All rights reserved.
//

#import "MYDeviceMessage.h"
#include <sys/param.h>
#include <sys/mount.h>

@implementation MYDeviceMessage

+ (NSString *)freeDiskSpaceInBytes {
    struct statfs buf;
    float freespace = -1;
    if(statfs("/var", &buf) >= 0){
        freespace = (long long)(buf.f_bsize * buf.f_bfree);
    }

    // 处理单位
    NSArray *units = @[@"B", @"KB", @"MB", @"GB", @"TB"];
    NSInteger count = 1000;
    NSInteger index = 0;
    while (freespace > count) {
        freespace = freespace / count;
        index ++;
    }

    NSString *formatStr = [NSString stringWithFormat:@"%.1f%@", freespace, units[index]];

    return formatStr;
}

@end
