//
//  CustomCell.m
//  FisrtStepRSS
//
//  Created by student on 10/27/12.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize title;
@synthesize pubData;
@synthesize descriprion;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    title = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 400, 15)];
    pubData = [[UILabel alloc]initWithFrame:CGRectMake(0, 18, 400, 15)];
    descriprion =[[UILabel alloc]initWithFrame:CGRectMake(0, 35, 400, 50)];
    [self addSubview:title];
    [self addSubview:pubData];
    [self addSubview:descriprion];
    return self;
}

@end
