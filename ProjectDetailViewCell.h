//
//  ProjectDetailViewCell.h
//  gaojiaohui
//
//  Created by Ted on 28/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectDetailViewCell : UITableViewCell
{
    UILabel *projectName;
    UILabel *projectDetail;
}

@property (nonatomic,strong)    UILabel *projectName;
@property (nonatomic,strong)    UILabel *projectDetail;


@end
