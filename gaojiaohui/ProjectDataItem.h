//
//  ProjectDataItem.h
//  gaojiaohui
//
//  Created by Ted on 22/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectDataItem : NSObject<NSXMLParserDelegate>
{
    NSString *name;
    NSString *title;
    NSMutableString *currentString;
    id parentParserDelegate;
    
}

@property (nonatomic,assign) id parentParserDelegate;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *title;

@end
