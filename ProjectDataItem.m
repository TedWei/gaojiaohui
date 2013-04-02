//
//  ProjectDataItem.m
//  gaojiaohui
//
//  Created by Ted on 22/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import "ProjectDataItem.h"

@implementation ProjectDataItem
@synthesize title,name,parentParserDelegate;

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
 //   NSLog(@"startElement %@",elementName);
    if ([elementName isEqual:@"DWMC_CN"]) {
        currentString=[[NSMutableString alloc]init];
        self.name=currentString;
    }else if ([elementName isEqual:@"CZXMMC_CN"]){
        currentString=[[NSMutableString alloc]init];
        self.title=currentString;
    }else if ([elementName isEqual:@"CNNAME"]){
        currentString=[[NSMutableString alloc]init];
        self.name=currentString;
    }else if ([elementName isEqual:@"COMPANY"]){
        currentString=[[NSMutableString alloc]init];
        self.title=currentString;
    }else if ([elementName isEqual:@"ZWH"]){
        currentString=[[NSMutableString alloc]init];
        self.ZWH=currentString;
    }else if ([elementName isEqual:@"CZXMMC_CN"]){
        currentString=[[NSMutableString alloc]init];
        self.CZXMMC_CN=currentString;
    }else if ([elementName isEqual:@"SZZG"]){
        currentString=[[NSMutableString alloc]init];
        self.SZZG=currentString;
    }else if ([elementName isEqual:@"PPMC"]){
        currentString=[[NSMutableString alloc]init];
        self.PPMC=currentString;
    }else if ([elementName isEqual:@"XMSSHY"]){
        currentString=[[NSMutableString alloc]init];
        self.XMSSHY=currentString;
    }else if ([elementName isEqual:@"GJ_CN"]){
        currentString=[[NSMutableString alloc]init];
        self.GJ_CN=currentString;
    }else if ([elementName isEqual:@"SSQ"]){
        currentString=[[NSMutableString alloc]init];
        self.SSQ=currentString;
    }else if ([elementName isEqual:@"SSZT"]){
        currentString=[[NSMutableString alloc]init];
        self.SSZT=currentString;
    }else if ([elementName isEqual:@"YZBM"]){
        currentString=[[NSMutableString alloc]init];
        self.YZBM=currentString;
    }else if ([elementName isEqual:@"EMAIL"]){
        currentString=[[NSMutableString alloc]init];
        self.EMAIL=currentString;
    }else if ([elementName isEqual:@"GJ_CN"]){
        currentString=[[NSMutableString alloc]init];
        self.GJ_CN=currentString;
    }else if ([elementName isEqual:@"WZ"]){
        currentString=[[NSMutableString alloc]init];
        self.WZ=currentString;
    }else if ([elementName isEqual:@"DWMC_CN"]){
        currentString=[[NSMutableString alloc]init];
        self.DWMC_CN=currentString;
    }else if ([elementName isEqual:@"DH"]){
        currentString=[[NSMutableString alloc]init];
        self.DH=currentString;
    }else if ([elementName isEqual:@"CZ"]){
        currentString=[[NSMutableString alloc]init];
        self.CZ=currentString;
    }else if ([elementName isEqual:@"XXDZ_CN"]){
        currentString=[[NSMutableString alloc]init];
        self.XXDZ_CN=currentString;
    }else if ([elementName isEqual:@"TZYXMS_CN"]){
        currentString=[[NSMutableString alloc]init];
        self.TZYXMS_CN=currentString;
    }


}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
 //   [currentString stringByAppendingFormat:@"%@ ",string];
    [currentString appendString:string];
    NSLog(@"title is %@",currentString);

}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    currentString =nil;
    if ([elementName isEqual:@"project"]) {
        [parser setDelegate:parentParserDelegate];
    }
}
@end
