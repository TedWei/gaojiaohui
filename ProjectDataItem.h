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
    NSMutableString *currentString;
}

@property (nonatomic,weak) id parentParserDelegate;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *ZWH;
@property (nonatomic,strong) NSString *CZXMMC_CN;
@property (nonatomic,strong) NSString *SZZG;
@property (nonatomic,strong) NSString *PPMC;
@property (nonatomic,strong) NSString *XMSSHY;
@property (nonatomic,strong) NSString *GJ_CN;
@property (nonatomic,strong) NSString *SSQ;
@property (nonatomic,strong) NSString *SSZT;
@property (nonatomic,strong) NSString *YZBM;
@property (nonatomic,strong) NSString *EMAIL;
@property (nonatomic,strong) NSString *WZ;
@property (nonatomic,strong) NSString *DWMC_CN;
@property (nonatomic,strong) NSString *DH;
@property (nonatomic,strong) NSString *CZ;
@property (nonatomic,strong) NSString *XXDZ_CN;
@property (nonatomic,strong) NSString *TZYXMS_CN;


@end
