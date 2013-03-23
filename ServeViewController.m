//
//  ServeViewController.m
//  gaojiaohui
//
//  Created by Ted on 22/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import "ServeViewController.h"
#import "WebViewController.h"
#import "Constants.h"
static NSUInteger insert = 30;


@interface ServeViewController ()
{
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
    UIButton *button4;
    UIButton *button5;
    UIButton *button6;
    UIButton *button7;
    UIButton *button8;
}

@end

@implementation ServeViewController

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
    
    
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainPageBackground"]];
    backgroundImageView.frame=CGRectMake(0,-44, 320,  self.view.frame.size.height);
    
    [self.view addSubview:backgroundImageView];
    
	// Do any additional setup after loading the view.
    
    button1=[UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *button1Image=[UIImage imageNamed:@"about"];
    [button1 setBackgroundImage:button1Image forState:UIControlStateNormal];
    button1.backgroundColor=[UIColor clearColor];

    button1.frame=CGRectMake(45, self.view.bounds.size.height*0.05, button1Image.size.width, button1Image.size.height);

    [button1 addTarget:self action:@selector(webbuttonPressend:) forControlEvents:UIControlEventTouchDown];
    
    
    button2=[UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *button2Image=[UIImage imageNamed:@"guide"] ;
    [button2 setBackgroundImage:button2Image forState:UIControlStateNormal];
    button2.backgroundColor=[UIColor clearColor];
    button2.frame=CGRectMake(45+button1Image.size.width+insert, self.view.bounds.size.height*0.05, button2Image.size.width, button2Image.size.height);
    [button2 addTarget:self action:@selector(webbuttonPressend:) forControlEvents:UIControlEventTouchDown];

    button3=[UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *button3Image=[UIImage imageNamed:@"client"];
    [button3 setBackgroundImage:button3Image forState:UIControlStateNormal];
    button3.backgroundColor=[UIColor clearColor];
    button3.frame=CGRectMake(45+button1Image.size.width+button2Image.size.width+insert*2, self.view.bounds.size.height*0.05, button3Image.size.width, button3Image.size.height);
    [button3 addTarget:self action:@selector(webbuttonPressend:) forControlEvents:UIControlEventTouchDown];

    
    
    button4=[UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *button4Image=[UIImage imageNamed:@"schedule"];
    [button4 setBackgroundImage:button4Image forState:UIControlStateNormal];
    button4.backgroundColor=[UIColor clearColor];
    
    button4.frame=CGRectMake(48, self.view.bounds.size.height*0.3, button4Image.size.width, button4Image.size.height);
    
    [button4 addTarget:self action:@selector(webbuttonPressend:) forControlEvents:UIControlEventTouchDown];
    
    
    
    button5=[UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *button5Image=[UIImage imageNamed:@"traffic"];
    [button5 setBackgroundImage:button5Image forState:UIControlStateNormal];
    button5.backgroundColor=[UIColor clearColor];
    
    button5.frame=CGRectMake(48+button4Image.size.width+insert+8, self.view.bounds.size.height*0.3, button5Image.size.width, button5Image.size.height);
    
    [button5 addTarget:self action:@selector(webbuttonPressend:) forControlEvents:UIControlEventTouchDown];
    
    
    button6=[UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *button6Image=[UIImage imageNamed:@"notice"];
    [button6 setBackgroundImage:button6Image forState:UIControlStateNormal];
    button6.backgroundColor=[UIColor clearColor];
    
    button6.frame=CGRectMake(48+button4Image.size.width+button5Image.size.width+insert*2+8, self.view.bounds.size.height*0.3, button6Image.size.width, button6Image.size.height);
    
    [button6 addTarget:self action:@selector(webbuttonPressend:) forControlEvents:UIControlEventTouchDown];
    
    button7=[UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *button7Image=[UIImage imageNamed:@"spread"];
    [button7 setBackgroundImage:button7Image forState:UIControlStateNormal];
    button7.backgroundColor=[UIColor clearColor];
    
    button7.frame=CGRectMake(45, self.view.bounds.size.height*0.55, button7Image.size.width, button7Image.size.height);
    
    [button7 addTarget:self action:@selector(webbuttonPressend:) forControlEvents:UIControlEventTouchDown];
    
    button8=[UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *button8Image=[UIImage imageNamed:@"fire"];
    [button8 setBackgroundImage:button8Image forState:UIControlStateNormal];
    button8.backgroundColor=[UIColor clearColor];
    
    button8.frame=CGRectMake(45+button7Image.size.width+insert, self.view.bounds.size.height*0.55, button8Image.size.width, button8Image.size.height);
    
    [button8 addTarget:self action:@selector(webbuttonPressend:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *button9=[UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *button9Image=[UIImage imageNamed:@"back"];
    [button9 setBackgroundImage:button9Image forState:UIControlStateNormal];
    button9.backgroundColor=[UIColor clearColor];
    
    button9.frame=CGRectMake(45+button7Image.size.width+button8Image.size.width+insert*2, self.view.bounds.size.height*0.55, button9Image.size.width, button9Image.size.height);
    
    [button9 addTarget:self action:@selector(button9Pressend) forControlEvents:UIControlEventTouchDown];
    
    
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    [self.view addSubview:button4];
    [self.view addSubview:button5];
    [self.view addSubview:button6];
    [self.view addSubview:button7];
    [self.view addSubview:button8];
    [self.view addSubview:button9];
    
}

-(void)webbuttonPressend:(UIButton *)sender{
    WebViewController *webViewController=[[WebViewController alloc]init];
    if (sender == button1) {
        [webViewController loadWebPageWithString:kAboutURL];
        webViewController.TopItemTitle=@"关于高交会";
    }else if (sender == button2){
        [webViewController loadWebPageWithString:kGuideURL];
        webViewController.TopItemTitle=@"展位分布";
    }else if (sender == button3){
        [webViewController loadWebPageWithString:kWarmTipURL];
        webViewController.TopItemTitle=@"温馨提示";
    }else if (sender == button4){
        [webViewController loadWebPageWithString:kActivityURL];
        webViewController.TopItemTitle=@"活动公告";
    }else if (sender == button5){
        [webViewController loadWebPageWithString:kTrafficURL];
        webViewController.TopItemTitle=@"交通路线";
    }else if (sender == button6){
        [webViewController loadWebPageWithString:kNewsURL];
        webViewController.TopItemTitle=@"新闻动态";
    }else if (sender == button7){
        [webViewController loadWebPageWithString:kMeetingURL];
        webViewController.TopItemTitle=@"会议室分布";
    }else if (sender == button8){
        [webViewController loadWebPageWithString:kFireURL];
        webViewController.TopItemTitle=@"消防疏散图";
    }

    [self.navigationController pushViewController:webViewController animated:YES];
    
}
-(void)viewDidAppear:(BOOL)animated{
        self.navigationController.navigationBar.topItem.title=@"服务查询";
}


-(void)button9Pressend{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
