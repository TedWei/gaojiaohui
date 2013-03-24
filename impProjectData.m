//
//  ProjectData.m
//  gaojiaohui
//
//  Created by Ted on 22/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import "impProjectData.h"
#import "ProjectDataItem.h"

@interface impProjectData ()

@end

@implementation impProjectData


@synthesize items,parentParserDelegate;

-(id)init
{
    self=[super init];
    if (self) {
        items=[[NSMutableArray alloc]init];
    }
    return self;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
  //  NSLog(@"did start parser:%@", elementName);
    if ([elementName isEqual:@"project"]){
        
        ProjectDataItem *project=[[ProjectDataItem alloc]init];
        [project setParentParserDelegate:self];

        [parser setDelegate:project];
        [items addObject:project];
                
    }
    

}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
 //   NSLog(@"found character:%@", string);
    [currentString appendString:string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
  //  NSLog(@"did end parser:%@", elementName);
     currentString=nil;
    if ([elementName isEqual:@"impproject"]) {
        [parser setDelegate:parentParserDelegate];
        NSLog(@"items.count is %d",items.count);

    }
}

@end
