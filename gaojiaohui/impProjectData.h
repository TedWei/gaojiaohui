//
//  ProjectData.h
//  gaojiaohui
//
//  Created by Ted on 22/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface impProjectData : NSObject<NSXMLParserDelegate>
{
    NSMutableString *currentString;
}
@property (nonatomic,weak) id parentParserDelegate;
@property (nonatomic,readonly,strong) NSMutableArray *items;
@end
