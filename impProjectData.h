//
//  ProjectData.h
//  gaojiaohui
//
//  Created by Ted on 22/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ProjectDataItem;

@interface impProjectData : NSObject<NSXMLParserDelegate>
{
    NSMutableString *currentString;
    id parentParserDelegate;
    NSMutableArray *items;

}
@property (nonatomic,assign) id parentParserDelegate;
@property (nonatomic,readonly) NSMutableArray *items;
@end
