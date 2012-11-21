//
//  SecondViewController.h
//  FisrtStepRSS
//
//  Created by Admin on 25/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHK.h"

@interface BrowserViewController : UIViewController<UIWebViewDelegate>
{
    NSURL *url;
    UIWebView *browser;
    NSString *texturl;
    NSString *feedtitle;
    
}
@property(nonatomic,retain) NSString *texturl;
@property(nonatomic,retain) UIWebView *browser;
@property(nonatomic,retain) NSURL *url;
@property(nonatomic,retain) NSString *feedtitle;

-(id)initwithurl:(NSString *)text title:(NSString *)title;



@end
