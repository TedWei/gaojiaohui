//
//  MainViewController.m
//  gaojiaohui
//
//  Created by Ted on 21/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import "MainViewController.h"
#import "ServeViewController.h"
#import "ProjectViewController.h"
#import "Constants.h"


static NSUInteger kNumberOfPages = 6;
static NSUInteger insert = 25;
static NSUInteger imagewidth = 58;



@interface MainViewController ()
- (void)setupViews;
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
	// Do any additional setup after loading the view.
  
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainPageBackground"]];
    backgroundImageView.frame=CGRectMake(0,-44, 320,  self.view.frame.size.height);
    
    [self.view addSubview:backgroundImageView];

    
    [self setupViews];

    
    button1=[UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setBackgroundImage:[UIImage imageNamed:@"mainVisit"] forState:UIControlStateNormal];
    button1.backgroundColor=[UIColor clearColor];
    button1.frame=CGRectMake(45, self.view.bounds.size.height*0.45, 58, 56);
    [button1 addTarget:self action:@selector(projectButtonPressend:) forControlEvents:UIControlEventTouchDown];

    
    UIImageView *visitCharView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"visitChar"]];
    visitCharView.frame=CGRectMake(45,self.view.bounds.size.height*0.6, 61, 14);
    
    
    button2=[UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setBackgroundImage:[UIImage imageNamed:@"mainTrade"] forState:UIControlStateNormal];
    button2.backgroundColor=[UIColor clearColor];
    button2.frame=CGRectMake(45+imagewidth+insert, self.view.bounds.size.height*0.45, 58, 56);
    [button2 addTarget:self action:@selector(projectButtonPressend:) forControlEvents:UIControlEventTouchDown];

    
    UIImageView *tradeCharView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tradeChar"]];
    tradeCharView.frame=CGRectMake(45+imagewidth+insert, self.view.bounds.size.height*0.6, 61, 14);
    
    button3=[UIButton buttonWithType:UIButtonTypeCustom];
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

- (void)setupViews
{
    SGFocusImageItem *item1 = [[SGFocusImageItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"overview1"] tag:0] ;
    SGFocusImageItem *item2 = [[SGFocusImageItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"overview2"] tag:1] ;
    SGFocusImageItem *item3 = [[SGFocusImageItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"overview3"] tag:2] ;
    SGFocusImageItem *item4 = [[SGFocusImageItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"overview4"] tag:4] ;
    SGFocusImageItem *item5 = [[SGFocusImageItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"overview5"] tag:5] ;
    SGFocusImageItem *item6 = [[SGFocusImageItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"overview6"] tag:6] ;

    SGFocusImageFrame *imageFrame = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 198.0)
                                                                    delegate:self
                                                             focusImageItems:item1, item2, item3, item4,item5,item6, nil];
    imageFrame.backgroundColor=[UIColor blackColor];
    [self.view addSubview:imageFrame];
    
}

-(void)projectButtonPressend:(UIButton *)sender
{
    ProjectViewController *projectViewController=[[ProjectViewController alloc]init];
    if (sender == button1) {
        projectViewController.urlString =kVisitURL;
        projectViewController.TopItemText=@"参展项目";
    }else if (sender == button2)
    {
        projectViewController.urlString =kTradeURL;
        projectViewController.TopItemText=@"交易项目";
    }
    [[self navigationController]pushViewController:projectViewController animated:YES];
}


-(void)button3Pressend
{
    ServeViewController *serveViewController=[[ServeViewController alloc]init];
    [[self navigationController]pushViewController:serveViewController animated:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBar.topItem.title=@"首页";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
