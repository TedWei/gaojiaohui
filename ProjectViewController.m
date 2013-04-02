//
//  ProjectViewController.m
//  gaojiaohui
//
//  Created by Ted on 22/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import "ProjectViewController.h"
#import "Constants.h"
#import "impProjectData.h"
#import "ProjectDataItem.h"
#import "HeadView.h"
#import "FootView.h"
#import "ProJectDetailViewController.h"


@implementation ProjectViewController

@synthesize urlString,footview;


-(id)initWithStyle:(UITableViewStyle)style
{
    
    self=[super initWithStyle:UITableViewStylePlain];
    if (self) {
    }
    return self;
}



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
    UIBarButtonItem *refreshButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(getData)];
    self.navigationItem.rightBarButtonItem=refreshButton;
    
    self.refreshControl=[[UIRefreshControl alloc]init];
    NSAttributedString *string=[[NSAttributedString alloc]initWithString:@"Refreshing...."];
    self.refreshControl.attributedTitle=string;
    self.refreshControl.tintColor=[UIColor redColor];
    [self.refreshControl addTarget:self action:@selector(getData) forControlEvents:UIControlEventAllEvents];
    [self getData];
}




-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:YES animated:YES];


}
-(void)viewDidAppear:(BOOL)animated
{
    self.navigationController.navigationBar.topItem.title=self.TopItemText;

}

-(void)viewDidDisappear:(BOOL)animated
{
     pageNumber = 0;
}

#pragma startRefreshingData





#pragma GetTheData

-(void)getData{
    [self.refreshControl beginRefreshing];
    pageNumber +=1;
    NSString *urls=[urlString stringByAppendingFormat:@"?page=%d",pageNumber];
    NSLog(@"url string is %@",urls);
    if (!xmlData) {
    xmlData=[[NSMutableData alloc]init];
    }
    NSURL *url=[NSURL URLWithString:urls];
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    NSLog(@"%@",req);
    connection=[[NSURLConnection alloc]initWithRequest:req delegate:self startImmediately:YES];
    
}





-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
   // NSLog(@"%@",elementName);
    if ([elementName isEqual:@"impproject"]) {
        if (!impprojectdata) {
        impprojectdata=[[impProjectData  alloc]init];
        }
        [impprojectdata setParentParserDelegate:self];
        [parser setDelegate:impprojectdata];
    }
}





-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [xmlData appendData:data];
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
   
    NSXMLParser *parser=[[NSXMLParser alloc]initWithData:xmlData];
    [parser setDelegate:self];
    [parser parse];
    xmlData =nil;
    connection =nil;
    [self.tableView reloadData];
   // NSLog(@"%@ is %@",[projectdata CZXMMC_CN],[projectdata DWMC_CN]);
    
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self.refreshControl endRefreshing];
    NSString *errorString;
    NSString *errorTitle=@"获取错误";
    
    if ([[error localizedDescription] isEqualToString:@"The request timed out."]) {
        errorString=@"连接超时";
    }else if ([errorString isEqualToString:@"Could not connect to the server."]) {
        errorString=@"无法连接到服务器";
    }
    
    NSLog(@"error is %@",errorString);
    UIAlertView *av=[[UIAlertView alloc]initWithTitle:errorTitle message:errorString delegate:self cancelButtonTitle:@"确认" otherButtonTitles: nil];
    
    [av show];
    
}




#pragma tableview


//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    HeadView *headview=[[HeadView alloc]init];
//    return headview;
//}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    footview=[[FootView alloc]init];
    [footview.button addTarget:self action:@selector(getData) forControlEvents:UIControlEventTouchDown];
    return footview;
}


//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 45;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 45;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return impprojectdata.items.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    ProJectDetailViewController *detailView=[[ProJectDetailViewController alloc]init];
    detailView.project_ID = indexPath.row+1;
    if ([urlString isEqual:kVisitURL]) {
        detailView.projectDetailUrlString =kVisitDetailURL;
        
    }else if([urlString isEqual:kTradeURL]){
        detailView.projectDetailUrlString = kTradeDetailURL;
    }
    
    [self.navigationController pushViewController:detailView animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"UITableViewCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
  //  NSLog(@"impprojectdata.items is %@",impprojectdata.items);
  
    ProjectDataItem *item=[[impprojectdata items] objectAtIndex:indexPath.row];
    
    cell.textLabel.text=item.title;
    cell.detailTextLabel.text=item.name;
    [self.refreshControl endRefreshing];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
