//
//  TableWithURLViewController.h
//  FisrtStepRSS
//
//  Created by Admin on 28/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTable.h"
#import "MainViewController.h"

@interface TableWithURLViewController : UIViewController<MyProtocolTableWithURL>
{
    UIBarButtonItem *edit;
    UIBarButtonItem *add;
    CTable *tableview;
}
@property(nonatomic,retain)UIBarButtonItem *edit;
@property(nonatomic,retain)UIBarButtonItem *add;
@property(nonatomic,retain)CTable *tableview;

- (void)InMainView:(NSIndexPath *)indexPath;
@end
