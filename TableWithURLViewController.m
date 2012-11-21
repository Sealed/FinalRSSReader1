//
//  TableWithURLViewController.m
//  FisrtStepRSS
//
//  Created by Admin on 28/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import "TableWithURLViewController.h"

@interface TableWithURLViewController ()

@end

@implementation TableWithURLViewController
@synthesize edit;
@synthesize add;
@synthesize tableview;

- (void)viewDidLoad
{
    [super viewDidLoad];
    edit =[[[UIBarButtonItem alloc] 
                             initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                             target:self
                             action:@selector(editing)] autorelease];
    self.navigationItem.RightBarButtonItem = edit;
    add = [[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addelem)] autorelease];
    self.navigationItem.leftBarButtonItem = add;
    tableview = [[CTable alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableview.delegat = self;
    [self.view addSubview:tableview];
	// Do any additional setup after loading the view.
}

-(void)editing
{
    [tableview editing];
}
-(void)addelem
{
    [tableview addelem];
}
- (void)InMainView:(NSIndexPath *)indexPath
{
    NSString *currentURL = [NSString string];
    currentURL = [tableview.data.dataURL objectAtIndex:indexPath.row];
    MainViewController *gotomain = [[[MainViewController alloc]initwithurl:currentURL ]autorelease];
    [self.navigationController pushViewController:gotomain animated:YES];
}

@end
