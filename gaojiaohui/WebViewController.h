//
//  WebViewController.h
//  gaojiaohui
//
//  Created by Ted on 22/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>
{
    UIWebView *webview;
}

@property (nonatomic,strong) NSString *TopItemTitle;

-(void)loadWebPageWithString:(NSString*)urlString;

@end
