//
//  UIImageView+MYExtension.h
//
//
//  Created by 许 on 16/6/16.
//  Copyright © 2016年 许. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+MYImage.h"

@interface UIImageView (MYExtension)

- (void)setURLImageWithURL: (NSURL *)url progress:(void(^)(CGFloat progress))progress complete: (void(^)())complete;

- (void)setURLImageWithURL: (NSURL *)url placeHoldImage:(UIImage *)placeHoldImage isCircle:(BOOL)isCircle;

@end
