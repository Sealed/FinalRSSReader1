//
//  CTable.h
//  FisrtStepRSS
//
//  Created by Admin on 23/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAlert.h"
#import "CData.h"
@protocol MyProtocolTableWithURL<NSObject>
@optional
- (void)InMainView:(NSIndexPath *)indexPath;
@end


@interface CTable : UITableView <UIAlertViewDelegate,UITableViewDelegate, UITableViewDataSource>
{
    id<MyProtocolTableWithURL>delegat;
    CData *data;
    DDAlertPrompt *alertView;
}
@property (nonatomic, retain)id<MyProtocolTableWithURL>delegat;
@property (nonatomic, retain)CData *data;
@property (nonatomic, retain)DDAlertPrompt *alertView;

-(void)addelem;
-(void)addSomethink;
-(void)editing;
- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;
@end
