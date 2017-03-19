//
//  MYNoticeLocal.h
//  喜马拉雅FM
//
//  Created by 许 on 16/8/22.
//  Copyright © 2016年 许. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYNoticeLocal : NSObject
+(UILocalNotification*)RegisterLocalNotificationWithFireDate:(NSDate *)firedate //后台运行的本地通知
                                                  repeatType:(NSCalendarUnit)repeatInterval
                                                    keepSleep:(BOOL)isKeepSleep;




+(void)cancelAllLocalNotifications;
+(void)cancelKeepSleepNotice;
+(void)cancleAlarmNotifications;

@end
