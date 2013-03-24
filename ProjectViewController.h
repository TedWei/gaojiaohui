//
//  ProjectViewController.h
//  gaojiaohui
//
//  Created by Ted on 22/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import <UIKit/UIKit.h>
@class impProjectData;

@interface ProjectViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDelegate,NSURLConnectionDataDelegate,NSXMLParserDelegate>
{
    NSURLConnection *connection;
    NSMutableData *xmlData;
    impProjectData *impprojectdata;
}

@property (nonatomic,strong)  NSString *urlString;
@property (nonatomic,strong)  NSString *TopItemText;



-(void)getData;
@end
