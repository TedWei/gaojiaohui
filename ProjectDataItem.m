//
//  ProjectDataItem.m
//  gaojiaohui
//
//  Created by Ted on 22/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import "ProjectDataItem.h"

@implementation ProjectDataItem
@synthesize name,title;

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"startElement %@",elementName);
    if ([elementName isEqual:@"DWMC_CN"]) {
        currentString=[[NSMutableString alloc]init];
        self.name=currentString;
    }else if ([elementName isEqual:@"CZXMMC_CN"]){
        currentString=[[NSMutableString alloc]init];
        self.title=currentString;
    }else if ([elementName isEqual:@"CHNAME"]){
        currentString=[[NSMutableString alloc]init];
        self.name=currentString;
    }else if ([elementName isEqual:@"COMPANY"]){
        currentString=[[NSMutableString alloc]init];
        self.title=currentString;
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [currentString appendString:string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    currentString =nil;
    if ([elementName isEqual:@"project"]) {
        [parser setDelegate:parentParserDelegate];
    }
}
@end
