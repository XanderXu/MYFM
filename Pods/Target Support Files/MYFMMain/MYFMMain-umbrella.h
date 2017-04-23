#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MYNavigationController.h"
#import "MYTabBarController.h"
#import "MainModuleAPI.h"
#import "MYMiddleView.h"
#import "MYNavigationBar.h"
#import "MYTabBar.h"

FOUNDATION_EXPORT double MYFMMainVersionNumber;
FOUNDATION_EXPORT const unsigned char MYFMMainVersionString[];

