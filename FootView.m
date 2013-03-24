//
//  FootView.m
//  gaojiaohui
//
//  Created by Ted on 23/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import "FootView.h"

@implementation FootView

@synthesize button;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(id)init
{
    self =[super init];
    if (self) {
        button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setBackgroundImage:[UIImage imageNamed:@"nextButton"] forState:UIControlStateNormal];
        [button setTitle:@"显示更多" forState:UIControlStateNormal];
        [self addSubview:button];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    button.frame=CGRectMake(10, 5, self.bounds.size.width-20, self.bounds.size.height-10);
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
