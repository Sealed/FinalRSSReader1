//
//  RootViewController2.m
//  FisrtStepRSS
//
//  Created by Admin on 23/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize tableView;
@synthesize parser;
@synthesize TextURL;

-(id)initwithurl:(NSString*)CurrentUrl
{
self = [super init];
self.TextURL = [NSString stringWithString:CurrentUrl];
return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
    parser = [[CParser alloc] initwithurl:TextURL];
    parser.delegate = self;
    
}

-(void)finishParser
{    
    tableView = [[CTablewithRSS alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain title:parser.parData.feedTitle pubdate:parser.parData.feedPubDate url:parser.parData.feedURL description:parser.parData.feedDescription];
    tableView.delegat = self;    
    [self.view addSubview:tableView];
}

-(void)InBrowser:(NSIndexPath *)indexPath
{    
    NSString *currenturl = [NSString string];
    NSString *currenttitle = [NSString string];
    currenturl = [self.tableView.data.url objectAtIndex:indexPath.row];
    currenttitle = [self.tableView.data.title objectAtIndex:indexPath.row];                    
    BrowserViewController *second = [[BrowserViewController alloc] initwithurl:currenturl title:currenttitle];
    [self.navigationController pushViewController:second animated:YES];
    [currenturl release];
    
}

-(void)dealloc
{
    [tableView release];
    [parser release];
    [super dealloc];
}

@end