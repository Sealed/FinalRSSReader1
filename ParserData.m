//
//  ParserData.m
//  FisrtStepRSS
//
//  Created by Admin on 25/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import "ParserData.h"

@implementation ParserData

@synthesize feedTitle;
@synthesize feedPubDate;
@synthesize feedURL;
@synthesize feedDescription;

-(id)init
{
    self.feedDescription = [NSMutableArray array];
    self.feedURL =[NSMutableArray array];
    self.feedPubDate =[NSMutableArray array];
    self.feedTitle = [NSMutableArray array];
    return self;
}
-(void)dealloc
{
    [feedDescription release];
    [feedTitle release];
    [feedPubDate release];
    [feedURL release];
    [super dealloc];
}

@end
