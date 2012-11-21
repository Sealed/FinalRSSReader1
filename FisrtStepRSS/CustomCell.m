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
    UIFont *titlefont = [UIFont fontWithName:@"Georgia-Bold" size:23];
    UIFont *pubdatafont = [UIFont fontWithName:@"Georgia-Italic" size:10];
    UIFont *descriptionfont = [UIFont fontWithName:@"Georgia" size:15];
    title = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 330, 25)];
    title.font = titlefont;
    pubData = [[UILabel alloc]initWithFrame:CGRectMake(0, 27, 330, 15)];
    pubData.font = pubdatafont;
    descriprion =[[UILabel alloc]initWithFrame:CGRectMake(0, 45, 330, 50)];
    descriprion.textAlignment = NSTextAlignmentLeft;
    descriprion.numberOfLines = 3;
    descriprion.font = descriptionfont;
    
    [self addSubview:title];
    [self addSubview:pubData];
    [self addSubview:descriprion];
    return self;
}


@end
