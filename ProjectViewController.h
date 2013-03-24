//
//  ProjectViewController.h
//  gaojiaohui
//
//  Created by Ted on 22/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import <UIKit/UIKit.h>
@class impProjectData;
@class FootView;

@interface ProjectViewController : UITableViewController<NSXMLParserDelegate>
{
    NSURLConnection *connection;
    NSMutableData *xmlData;
    impProjectData *impprojectdata;
    
    NSInteger pageNumber;

}

@property (nonatomic,strong)  NSString *urlString;
@property (nonatomic,strong)  NSString *TopItemText;
@property (nonatomic,strong)  FootView *footview;

-(void)getData;
@end
