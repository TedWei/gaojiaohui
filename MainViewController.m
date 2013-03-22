//
//  MainViewController.m
//  gaojiaohui
//
//  Created by Ted on 21/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import "MainViewController.h"
#import "ServeViewController.h"

static NSUInteger kNumberOfPages = 6;
static NSUInteger insert = 25;
static NSUInteger imagewidth = 58;



@interface MainViewController ()

@property (nonatomic,strong)  UIPageControl *pageControl;
@property (nonatomic,strong)  UIScrollView  *scrollView;

- (void)loadScrollViewWithPage:(int)page;
- (void)scrollViewDidScroll:(UIScrollView *)sender;
@end

@implementation MainViewController

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
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"upFrame"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.topItem.title=@"首页";
	// Do any additional setup after loading the view.
    
    UIImageView *overview1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"overview1"]];
    UIImageView *overview2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iverview2"]];
    UIImageView *overview3=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iverview3"]];
    UIImageView *overview4=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iverview4"]];
    UIImageView *overview5=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iverview5"]];
    UIImageView *overview6=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iverview6"]];

    
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 199)];
    scrollView.backgroundColor=[UIColor blackColor];
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * kNumberOfPages, scrollView.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;
    scrollView.delegate = self;
    overview2.frame=CGRectMake(320*1, 0, 320, 199);
    overview3.frame=CGRectMake(320*2, 0, 320, 199);
    overview4.frame=CGRectMake(320*3, 0, 320, 199);
    overview5.frame=CGRectMake(320*4, 0, 320, 199);
    overview6.frame=CGRectMake(320*5, 0, 320, 199);
    [scrollView addSubview:overview1];
    [scrollView addSubview:overview2];
    [scrollView addSubview:overview3];
    [scrollView addSubview:overview4];
    [scrollView addSubview:overview5];
    [scrollView addSubview:overview6];
    
    

    
   // self.scrollView=scrollView;
   // [self.view addSubview:self.scrollView];
    
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainPageBackground"]];
    backgroundImageView.frame=CGRectMake(0,-44, 320,  self.view.frame.size.height);
    
    [self.view addSubview:backgroundImageView];
    [self.view addSubview:scrollView];
    
    UIButton *button1=[UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setBackgroundImage:[UIImage imageNamed:@"mainVisit"] forState:UIControlStateNormal];
    button1.backgroundColor=[UIColor clearColor];
    button1.frame=CGRectMake(45, self.view.bounds.size.height*0.45, 58, 56);
    [button1 addTarget:self action:@selector(button1Pressend) forControlEvents:UIControlEventTouchDown];

    
    UIImageView *visitCharView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"visitChar"]];
    visitCharView.frame=CGRectMake(45,self.view.bounds.size.height*0.6, 61, 14);
    
    
    UIButton *button2=[UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setBackgroundImage:[UIImage imageNamed:@"mainTrade"] forState:UIControlStateNormal];
    button2.backgroundColor=[UIColor clearColor];
    button2.frame=CGRectMake(45+imagewidth+insert, self.view.bounds.size.height*0.45, 58, 56);
    [button2 addTarget:self action:@selector(button2Pressend) forControlEvents:UIControlEventTouchDown];

    
    UIImageView *tradeCharView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tradeChar"]];
    tradeCharView.frame=CGRectMake(45+imagewidth+insert, self.view.bounds.size.height*0.6, 61, 14);
    
    UIButton *button3=[UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setBackgroundImage:[UIImage imageNamed:@"mainSearch"] forState:UIControlStateNormal];
    button3.backgroundColor=[UIColor clearColor];
    button3.frame=CGRectMake(45+imagewidth*2+insert*2, self.view.bounds.size.height*0.45, 58, 56);
    [button3 addTarget:self action:@selector(button3Pressend) forControlEvents:UIControlEventTouchDown];
    
    UIImageView *serveCharView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"serveChar"]];
    serveCharView.frame=CGRectMake(45+imagewidth*2+insert*2, self.view.bounds.size.height*0.6, 61, 14);
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    [self.view addSubview:visitCharView];
    [self.view addSubview:tradeCharView];
    [self.view addSubview:serveCharView];
    
}

-(void)button1Pressend{
    
}

-(void)button2Pressend{
    
}

-(void)button3Pressend
{
    ServeViewController *serveViewController=[[ServeViewController alloc]init];
    [[self navigationController]pushViewController:serveViewController animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
