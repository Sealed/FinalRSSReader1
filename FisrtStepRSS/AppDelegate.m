//
//  AppDelegate.m
//  FisrtStepRSS
//
//  Created by Admin on 20/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstScreenViewController.h"

@implementation AppDelegate 


- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    DefaultSHKConfigurator *configurator = [[[MySHKConfigurator alloc] init] autorelease];
    [SHKConfiguration sharedInstanceWithConfigurator:configurator];
   
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[[FirstScreenViewController new]autorelease]];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    navController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navController.toolbar.barStyle = UIBarStyleBlackOpaque;
    self.window.rootViewController = navController;
    [navController release];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)handleOpenURL:(NSURL*)url
{
    NSString* scheme = [url scheme];
    NSString* prefix = [NSString stringWithFormat:@"fb%@", SHKCONFIG(facebookAppId)];
    if ([scheme hasPrefix:prefix])
        return [SHKFacebook handleOpenURL:url];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [self handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [self handleOpenURL:url];
}

@end
