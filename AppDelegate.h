//
//  AppDelegate.h
//  gaojiaohui
//
//  Created by Ted on 21/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kAppKey             @"29894543"
#define kAppSecret          @"8cb17358d7ddc0f88ff556a4a7a5e387"
#define kAppRedirectURI     @"http://www.weibo.com"

#ifndef kAppKey
#error
#endif

#ifndef kAppSecret
#error
#endif

#ifndef kAppRedirectURI
#error
#endif

@class SinaWeibo;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    SinaWeibo *sinaweibo;
}

@property (readonly, nonatomic) SinaWeibo *sinaweibo;

@property (strong, nonatomic) UIWindow *window;

@end
