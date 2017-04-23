//
//  MYSegmentBarVC.h
//  MYSegmentBar
//
//  Created by CoderXu on 2017/4/23.
//  Copyright © 2017年 517807635@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYSegmentBar.h"
@interface MYSegmentBarVC : UIViewController
@property (nonatomic, weak) MYSegmentBar *segmentBar;


- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs;

@end
