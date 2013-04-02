//
//  ProJectDetailViewController.m
//  gaojiaohui
//
//  Created by Ted on 27/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import "ProJectDetailViewController.h"
#import "ProjectDataItem.h"
#import "impProjectData.h"
#import "WebViewController.h"
#import "noteViewController.h"
#import "AppDelegate.h"
#import "ProjectDetailViewCell.h"

@interface ProJectDetailViewController ()
{
    ProjectDataItem *item;
    UIButton *mapButton;
    UIButton *shareButton;
    UIButton *phoneButton;
    UIButton *noteButton;
}

@end

@implementation ProJectDetailViewController

@synthesize projectDetailUrlString,project_ID;


-(id)init
{
    self=[super init];
    if (self) {
        
    }
    return self ;
    
}

#pragma sinaweiboDelegate

- (SinaWeibo *)sinaweibo
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return delegate.sinaweibo;
}

- (void)removeAuthData
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"SinaWeiboAuthData"];
}

- (void)storeAuthData
{
    SinaWeibo *sinaweibo = [self sinaweibo];
    
    NSDictionary *authData = [NSDictionary dictionaryWithObjectsAndKeys:
                              sinaweibo.accessToken, @"AccessTokenKey",
                              sinaweibo.expirationDate, @"ExpirationDateKey",
                              sinaweibo.userID, @"UserIDKey",
                              sinaweibo.refreshToken, @"refresh_token", nil];
    [[NSUserDefaults standardUserDefaults] setObject:authData forKey:@"SinaWeiboAuthData"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)sinaweiboLogIn
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    NSLog(@"%@", [keyWindow subviews]);
    
    
    SinaWeibo *sinaweibo = [self sinaweibo];
    [sinaweibo logIn];
    
}

- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo
{
    NSLog(@"sinaweiboDidLogIn userID = %@ accesstoken = %@ expirationDate = %@ refresh_token = %@", sinaweibo.userID, sinaweibo.accessToken, sinaweibo.expirationDate,sinaweibo.refreshToken);
    NSUInteger LoginNumber=1;
    if (LoginNumber ==1) {
        [self postStatusButtonPressed];
    }
    LoginNumber ++;
    [self storeAuthData];
}


- (void)sinaweiboLogInDidCancel:(SinaWeibo *)sinaweibo
{
    NSLog(@"sinaweiboLogInDidCancel");
}

- (void)sinaweibo:(SinaWeibo *)sinaweibo logInDidFailWithError:(NSError *)error
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登陆失败！"
                                                        message:[NSString stringWithFormat:@"%@",error]
                                                       delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];

    NSLog(@"sinaweibo logInDidFailWithError %@", error);
}

- (void)sinaweibo:(SinaWeibo *)sinaweibo accessTokenInvalidOrExpired:(NSError *)error
{
    NSLog(@"sinaweiboAccessTokenInvalidOrExpired %@", error);
    [self removeAuthData];
}

#pragma mark - SinaWeiboRequest Delegate

- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error
{
    if ([request.url hasSuffix:@"statuses/update.json"])
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"发送以下微博失败！"
                                                            message:[NSString stringWithFormat:@"%@", postStatusText]
                                                           delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        
        NSLog(@"Post status failed with error : %@", error);
    }
        
    
}

static NSUInteger textNumber =0;
- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result
{
    if ([request.url hasSuffix:@"statuses/update.json"])
        
    {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享微博成功！"
                                                            message:nil
                                                           delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        
         postStatusText = nil;
    }
}

- (void)postStatusButtonPressed
{
    if (!postStatusText)
    {
        postStatusText = nil;
        textNumber++;
        postStatusText = [[NSString alloc] initWithFormat:@" %@ text %i", item.EMAIL,textNumber];
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享以下内容到微博"
                                                        message:[NSString stringWithFormat:@"%@", postStatusText]
                                                       delegate:self cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"OK", nil];
    alertView.tag = 0;
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    SinaWeibo *sinaweibo = [self sinaweibo];
    BOOL authValid = sinaweibo.isAuthValid;
    if (authValid) {
        if (buttonIndex == 1)
        {
            if (alertView.tag == 0)
            {
                // post status
                SinaWeibo *sinaweibo = [self sinaweibo];
                [sinaweibo requestWithURL:@"statuses/update.json"
                                   params:[NSMutableDictionary dictionaryWithObjectsAndKeys:postStatusText, @"status", nil]
                               httpMethod:@"POST"
                                 delegate:self];
                
            }
        }

    }

    }

#pragma viewDidLoad

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setToolbarHidden:NO animated:YES];
    
    mapButton=[[UIButton alloc]initWithFrame:CGRectMake(40, 5, 30, 30)];
    [mapButton setBackgroundImage:[UIImage imageNamed:@"mapItem"] forState:UIControlStateNormal];
    [mapButton addTarget:self action:@selector(toolBarButtonPressend:) forControlEvents:UIControlEventTouchDown];
    [mapButton setShowsTouchWhenHighlighted:YES];
    [self.navigationController.toolbar addSubview:mapButton];
    
    
    shareButton=[[UIButton alloc]initWithFrame:CGRectMake(115, 5, 30, 30)];
    [shareButton setBackgroundImage:[UIImage imageNamed:@"shareItem"] forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(toolBarButtonPressend:) forControlEvents:UIControlEventTouchDown];
    [shareButton setShowsTouchWhenHighlighted:YES];
    [self.navigationController.toolbar addSubview:shareButton];

    
    
    phoneButton=[[UIButton alloc]initWithFrame:CGRectMake(185, 5, 30, 30)];
    [phoneButton setBackgroundImage:[UIImage imageNamed:@"phoneItem"] forState:UIControlStateNormal];
    [phoneButton addTarget:self action:@selector(toolBarButtonPressend:) forControlEvents:UIControlEventTouchDown];
    [phoneButton setShowsTouchWhenHighlighted:YES];
    [self.navigationController.toolbar addSubview:phoneButton];
    
    

    
    noteButton=[[UIButton alloc]initWithFrame:CGRectMake(255, 5, 30, 30)];
    [noteButton setBackgroundImage:[UIImage imageNamed:@"noteItem"] forState:UIControlStateNormal];
    [noteButton addTarget:self action:@selector(toolBarButtonPressend:) forControlEvents:UIControlEventTouchDown];
    [noteButton setShowsTouchWhenHighlighted:YES];
    [self.navigationController.toolbar addSubview:noteButton];
    
    [self.navigationController.toolbar setBackgroundImage:[UIImage imageNamed:@"upFrame"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];

}




-(void)viewWillAppear:(BOOL)animated
{
    [self getData];
    [self.navigationController setToolbarHidden:NO animated:YES];


}

-(void)viewDidAppear:(BOOL)animated
{
    self.navigationController.navigationBar.topItem.title=@"项目信息";
}

-(void)viewDidDisappear:(BOOL)animated
{
    item =nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)toolBarButtonPressend:(UIButton *)sender
{
    if (sender == mapButton) {
        WebViewController *webViewController=[[WebViewController alloc]init];
        [webViewController loadWebPageWithString:@"http://www.apple.com"];
        [self.navigationController pushViewController:webViewController animated:YES];
        
    }else if(sender == shareButton){
        UIActionSheet *av=[[UIActionSheet alloc]initWithTitle:@"分享信息到：" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"新浪微博",@"短信",@"邮件",nil];
        [av showFromToolbar:self.navigationController.toolbar];
        
    }else if(sender == phoneButton){
         NSString *phoneNumber=[NSString stringWithFormat:@"tel://%@",item.DH];
        UIWebView*callWebview =[[UIWebView alloc] init];
        NSURL *telURL =[NSURL URLWithString:phoneNumber];
        [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
        [self.view addSubview:callWebview];
        

    }else if(sender == noteButton){
        
        noteViewController *note=[[noteViewController alloc]init];
        [self.navigationController pushViewController:note animated:YES];
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex ==0)
    {
        SinaWeibo *sinaweibo = [self sinaweibo];
        BOOL authValid = sinaweibo.isAuthValid;
        if (!authValid) {
            [self sinaweiboLogIn];
        }else{
            [self postStatusButtonPressed];
     }
        
    }else if (buttonIndex == 1){
        
        NSString *messageNumber=[NSString stringWithFormat:@"tel://%@",item.CZ];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:messageNumber]];
        
    }else if (buttonIndex == 2){
        NSString *email=[NSString stringWithFormat:@"mailto:%@",item.EMAIL];

        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
        
    }
}


#pragma messageDelegate

- (void)sendSMS:(NSString *)bodyOfMessage recipientList:(NSArray *)recipients
{
    
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
    
    if([MFMessageComposeViewController canSendText])
        
    {
        
        controller.body = item.TZYXMS_CN;
        
        controller.recipients = item.CZ;
        
        controller.messageComposeDelegate = self;
        
        [self presentViewController:controller animated:YES completion:nil];
    }
    
}

// 处理发送完的响应结果
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MessageComposeResultCancelled)
        NSLog(@"Message cancelled");
    else if (result == MessageComposeResultSent)
        NSLog(@"Message sent");
    else 
        NSLog(@"Message failed");
}


#pragma emailDelegate

-(void)sendMail:(NSString *)subject content:(NSString *)content{
    
    MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
    
    if([MFMailComposeViewController canSendMail])
        
    {
        
        [controller setSubject:item.EMAIL];
        
        [controller setMessageBody:item.TZYXMS_CN isHTML:NO];
        
        controller.mailComposeDelegate = self;
        

        [self presentViewController:controller animated:YES completion:nil];
    }
}

//邮件完成处理
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MessageComposeResultCancelled)
        NSLog(@"Message cancelled");
    else if (result == MessageComposeResultSent)
        NSLog(@"Message sent");
    else 
        NSLog(@"Message failed");  
    
}


#pragma GetTheData

-(void)getData{
    NSString *urls=[self.projectDetailUrlString stringByAppendingFormat:@"?project_id=%d",project_ID];
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
     NSLog(@"%@",elementName);
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
    NSString *errorString=[NSString stringWithFormat:@"getData failed:%@",[error localizedDescription]];
    UIAlertView *av=[[UIAlertView alloc]initWithTitle:@"Error" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [av show];
    
}


#pragma mark - Table view delegate


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 15;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"UITableViewCell";
    ProjectDetailViewCell *cell=(ProjectDetailViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell = [[ProjectDetailViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
//  NSLog(@"impprojectdata.items is %@",impprojectdata.items);
    
    item=[[impprojectdata items] objectAtIndex:0];
    NSLog(@"%@",item);
    

    if (indexPath.row == 0) {
        cell.projectName.text=item.ZWH;
        cell.projectDetail.text = item.ZWH;
    }else if (indexPath.row ==1){
        cell.detailTextLabel.text=item.CZXMMC_CN;
    }else if (indexPath.row ==2){
        cell.detailTextLabel.text=item.SZZG;
    }else if (indexPath.row ==3){
        cell.detailTextLabel.text=item.PPMC;
    }else if (indexPath.row ==4){
        cell.detailTextLabel.text=item.XMSSHY;
    }else if (indexPath.row ==5){
        cell.detailTextLabel.text=item.GJ_CN;
    }else if (indexPath.row ==6){
        cell.detailTextLabel.text=item.SSQ;
    }else if (indexPath.row ==7){
        cell.detailTextLabel.text=item.SSZT;
    }else if (indexPath.row ==8){
        cell.detailTextLabel.text=item.YZBM;
    }else if (indexPath.row ==9){
        cell.detailTextLabel.text=item.EMAIL;
    }else if (indexPath.row ==10){
        cell.detailTextLabel.text=item.WZ;
    }else if (indexPath.row ==11){
        cell.detailTextLabel.text=item.DWMC_CN;
    }else if (indexPath.row ==12){
        cell.detailTextLabel.text=item.DH;
    }else if (indexPath.row ==13){
        cell.detailTextLabel.text=item.CZ;
    }else if (indexPath.row ==14){
        cell.detailTextLabel.text=item.XXDZ_CN;
    }else if (indexPath.row ==15){
        cell.detailTextLabel.text=item.TZYXMS_CN;
    }
    return cell;
}



@end
