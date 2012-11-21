//
//  RootViewController2.h
//  FisrtStepRSS
//
//  Created by Admin on 23/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CParser.h"
#import "BrowserViewController.h"
#import "CTablewithRSS.h"


@interface MainViewController : UIViewController <MyProtocolParser,MyProtocolTable,UITableViewDelegate, UITableViewDataSource>
{
    CTablewithRSS *tableView;
    CParser *parser;
    NSString *TextURL;
    
}
@property(nonatomic,retain)NSString *TextURL;
@property(nonatomic, retain)CParser *parser;
@property(nonatomic, retain) CTablewithRSS *tableView;

-(id)initwithurl:(NSString*)CurrentUrl;
-(void)finishParser;
-(void)InBrowser:(NSIndexPath *)indexPath;

@end
