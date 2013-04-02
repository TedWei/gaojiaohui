//
//  ProjectDetailViewCell.m
//  gaojiaohui
//
//  Created by Ted on 28/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import "ProjectDetailViewCell.h"

@implementation ProjectDetailViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        projectName=[[UILabel alloc]init];
        projectDetail=[[UILabel alloc]init];
        
        [self.contentView addSubview:projectName];
        [self.contentView addSubview:projectDetail];
        // Initialization code
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    projectName.frame=CGRectMake(10, 10, 80, 20);
    projectDetail.frame=CGRectMake(110, 10,200,20);
}

@end
