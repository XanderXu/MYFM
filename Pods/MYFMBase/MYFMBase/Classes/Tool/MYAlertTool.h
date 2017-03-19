//
//  MYAlertTool.h
//  喜马拉雅FM
//
//  Created by 许 on 16/8/27.
//  Copyright © 2016年 许. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MYAlertTool : NSObject


+ (void)alertTitle:(NSString *)titile type:(UIAlertControllerStyle)alertType message:(NSString *)message didTask:(void(^)())task;

@end
