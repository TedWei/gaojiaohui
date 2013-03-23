//
//  footView.m
//  gaojiaohui
//
//  Created by Ted on 23/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import "HeadView.h"
#import "PopoverViewController.h"

@interface HeadView()
{
    UIButton *selectionButton1;
    UIButton *selectionButton2;
    UIButton *searchButton;
}

#define insert  10

@end

@implementation HeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)init{
    self=[super init];
    if (self) {
        self.backgroundColor=[UIColor grayColor];

        UIButton *button1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        button1=[[UIButton alloc]initWithFrame:CGRectZero];
        [button1 setBackgroundImage:[UIImage imageNamed:@"popoverButton"] forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(popSealectionView:) forControlEvents:UIControlEventTouchDown];
        [button1 setTitle:@"选择" forState:UIControlStateNormal];
        selectionButton1=button1;
        [self addSubview:selectionButton1];
        
        UIButton *button2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        button2=[[UIButton alloc]initWithFrame:CGRectZero];
        [button2 setBackgroundImage:[UIImage imageNamed:@"popoverButton"] forState:UIControlStateNormal];
        [button2 addTarget:self action:@selector(popSealectionView:) forControlEvents:UIControlEventTouchDown];
        [button2 setTitle:@"选择" forState:UIControlStateNormal];
        selectionButton2=button2;
        [self addSubview:selectionButton2];
        
        UIButton *button3=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        button3=[[UIButton alloc]initWithFrame:CGRectZero];
        [button3 setBackgroundImage:[UIImage imageNamed:@"generalSearchButton"] forState:UIControlStateNormal];
        [button3 setTitle:@"搜索" forState:UIControlStateNormal];
        searchButton=button3;
        [self addSubview:searchButton];
        
    }
    return self;
}

-(void)popSealectionView:(UIButton *)sender
{
    if (sender == selectionButton1){

    }else if (sender == selectionButton2){
        
    }
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    selectionButton1.frame=CGRectMake(5, insert, 80, self.bounds.size.height-insert*2);
    selectionButton2.frame=CGRectMake(5+80+insert,insert,120,self.bounds.size.height-insert*2);
    searchButton.frame=CGRectMake(5+80+insert*2+120,insert,60,self.bounds.size.height-insert*2);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


@end
