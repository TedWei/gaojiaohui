//
//  ProJectDetailViewController.h
//  gaojiaohui
//
//  Created by Ted on 27/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MFMessageComposeViewController.h>
#import "impProjectData.h"
#import "SinaWeibo.h"
#import "SinaWeiboRequest.h"

@interface ProJectDetailViewController : UITableViewController<NSXMLParserDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate,UIActionSheetDelegate,SinaWeiboDelegate,SinaWeiboRequestDelegate>
{
    NSURLConnection *connection;
    NSMutableData *xmlData;
    impProjectData *impprojectdata;
    NSMutableArray *DetailArray;
    NSString *postStatusText;

}

@property (nonatomic,strong)    NSString *projectDetailUrlString;
@property (nonatomic)    NSInteger project_ID;
-(void)getData;

-(void)toolBarButtonPressend:(UIBarButtonItem *)sender;


@end
