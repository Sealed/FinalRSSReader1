//
//  CTablewithRSS.m
//  FisrtStepRSS
//
//  Created by student on 10/27/12.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import "CTablewithRSS.h"

@implementation CTablewithRSS
@synthesize data;
@synthesize delegat;
@synthesize cell;

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style title:(NSMutableArray *)title pubdate:(NSMutableArray *)pubdate url:(NSMutableArray *)url description:(NSMutableArray *)description
{
    self = [super initWithFrame:frame style:style];
    data = [[CTablewithRSSData alloc] init];
    data.url = [NSMutableArray arrayWithArray:url];
    data.title = [NSMutableArray arrayWithArray:title];
    data.pubData = [NSMutableArray arrayWithArray:pubdate];
    data.description = [NSMutableArray arrayWithArray:description];
    self.delegate = self;
    self.dataSource = self;
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data.title count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    
   cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        
        cell = [[[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
    }
    cell.title.text = [data.title objectAtIndex:indexPath.row];
    cell.pubData.text = [data.pubData objectAtIndex:indexPath.row];
    cell.descriprion.text = [data.description objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [delegat InBrowser:indexPath];
    
}

@end
