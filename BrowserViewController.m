//
//  SecondViewController.m
//  FisrtStepRSS
//
//  Created by Admin on 25/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import "BrowserViewController.h"

@interface BrowserViewController ()


@end

@implementation BrowserViewController
@synthesize url;
@synthesize browser;
@synthesize texturl;
@synthesize feedtitle;

-(id)initwithurl:(NSString *)text title:(NSString *)title
{
    self = [super init];    
    self.texturl = [NSString stringWithString:text];
    self.texturl = [self.texturl stringByReplacingOccurrencesOfString:@" " withString:@""];
    self.texturl = [self.texturl stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    self.texturl = [self.texturl stringByReplacingOccurrencesOfString:@"	" withString:@""];
    self.texturl = [self.texturl stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    self.feedtitle = [NSString stringWithString:title];
    return self;
}


- (void)viewDidLoad
{    
    [super viewDidLoad];
    UIBarButtonItem *edit =[[UIBarButtonItem alloc]initWithTitle:@"share" style:UIBarButtonItemStyleDone target:self action:@selector(sharetoall)];
    self.navigationItem.RightBarButtonItem = edit;
    browser = [[UIWebView alloc] initWithFrame:self.view.bounds];
    browser.delegate = self;    
    self.url = [NSURL URLWithString:self.texturl];    
    [self.view addSubview:browser];    
    [browser loadRequest:[NSURLRequest requestWithURL:self.url]];
}

-(void)sharetoall
{      
	SHKItem *item = [SHKItem new]; // Get the ShareKit action sheet
    item.shareType = SHKShareTypeURL;
    item.URL = url;
    item.URLContentType = SHKURLContentTypeWebpage;
    item.title = feedtitle;
    
    
    SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
    actionSheet.actionSheetStyle = UIBarStyleBlackOpaque;
    
    // ShareKit detects top view controller (the one intended to present ShareKit UI) automatically,
    // but sometimes it may not find one. To be safe, set it explicitly
    [SHK setRootViewController:self];
    
    // Display the action sheet
    [actionSheet showInView:self.view];
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@", error);
}

-(void)dealloc
{
    [url release];
    [browser release];
    [texturl release];
    [super dealloc];
}


@end
