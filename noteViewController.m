//
//  noteView.m
//  gaojiaohui
//
//  Created by Ted on 28/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import "noteViewController.h"

@implementation noteViewController

-(id)init{
    self=[super init];
    if (self) {
        self.view.backgroundColor=[UIColor brownColor];
        
        UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 30, 105, 30)];
        nameLabel.text=@"＊您的姓名：";
        nameLabel.backgroundColor=[UIColor clearColor];
        nameLabel.textAlignment=UITextLayoutDirectionRight;

        
        UILabel *emailLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 65, 105, 30)];
        emailLabel.text=@"＊您的邮箱：";
        emailLabel.backgroundColor=[UIColor clearColor];
        emailLabel.textAlignment=UITextLayoutDirectionRight;

        
        UILabel *phoneNumber=[[UILabel alloc]initWithFrame:CGRectMake(5, 100, 105, 30)];
        phoneNumber.text=@"联系电话：";
        phoneNumber.backgroundColor=[UIColor clearColor];
        phoneNumber.textAlignment=UITextLayoutDirectionRight;

        
        phoneNumber.textAlignment=UITextLayoutDirectionRight;
        UILabel *mobilePhone=[[UILabel alloc]initWithFrame:CGRectMake(5, 135, 105, 30)];
        mobilePhone.text=@"移动电话：";
        mobilePhone.backgroundColor=[UIColor clearColor];
        mobilePhone.textAlignment=UITextLayoutDirectionRight;

        UITextField *nameField=[[UITextField alloc]initWithFrame:CGRectMake(115, 30, 195, 30)];
        nameField.borderStyle=UITextBorderStyleRoundedRect;
        
        UITextField *emailField=[[UITextField alloc]initWithFrame:CGRectMake(115, 65, 195, 30)];
        emailField.borderStyle=UITextBorderStyleRoundedRect;

        UITextField *phoneField1=[[UITextField alloc]initWithFrame:CGRectMake(115, 100, 60, 30)];
        phoneField1.borderStyle=UITextBorderStyleRoundedRect;

        UITextField *phoneField2=[[UITextField alloc]initWithFrame:CGRectMake(180, 100, 130, 30)];
        phoneField2.borderStyle=UITextBorderStyleRoundedRect;


        UITextField *mobileField=[[UITextField alloc]initWithFrame:CGRectMake(115, 135, 195, 30)];
        mobileField.borderStyle=UITextBorderStyleRoundedRect;

        
        UILabel *messageLabel=[[UILabel alloc]initWithFrame:CGRectMake(85, 190, 140, 20)];
        messageLabel.text=@"＊您的留言信息";
        messageLabel.backgroundColor=[UIColor clearColor];
        
        UITextView *messageView=[[UITextView alloc]initWithFrame:CGRectMake(10, 215, 300, self.view.bounds.size.height-350)];
        
        UIButton *messageSenderButton=[[UIButton alloc]initWithFrame:CGRectMake(100, self.view.bounds.size.height-50, 80, 30)];
        [messageSenderButton setBackgroundImage:[UIImage imageNamed:@"generalButton"] forState:UIControlStateNormal];
        
        [self.view addSubview:nameLabel];
        [self.view addSubview:emailLabel];
        [self.view addSubview:phoneNumber];
        [self.view addSubview:mobilePhone];
        [self.view addSubview:nameField];
        [self.view addSubview:emailField];
        [self.view addSubview:phoneField1];
        [self.view addSubview:phoneField2];
        [self.view addSubview:mobileField];
        [self.view addSubview:messageLabel];
        [self.view addSubview:messageView];
        [self.view addSubview:messageSenderButton];
    }
    return self;
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
