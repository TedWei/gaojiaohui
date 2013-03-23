//
//  WebViewController.m
//  gaojiaohui
//
//  Created by Ted on 22/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void)loadWebPageWithString:(NSString *)urlString{
    NSURL *url =[NSURL URLWithString:urlString];
    NSLog(@"%@",urlString);
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
    webview.delegate=self;
    webview.backgroundColor=[UIColor blackColor];
    webview.scalesPageToFit=YES;
    [self.view addSubview:webview];
    [webview loadRequest:request];
    
}

-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBar.topItem.title=_TopItemTitle;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
