//
//  CTablewithRSS.h
//  FisrtStepRSS
//
//  Created by student on 10/27/12.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTablewithRSSData.h"
#import "CustomCell.h"
@protocol MyProtocolTable<NSObject>
@optional
- (void)InBrowser:(NSIndexPath *)indexPath;
@end

@interface CTablewithRSS : UITableView <UITableViewDataSource,UITableViewDelegate>
{
    id<MyProtocolTable> delegat;
    CustomCell *cell;
    CTablewithRSSData *data;
}
@property (nonatomic,assign)id<MyProtocolTable> delegat;
@property (nonatomic,retain)CTablewithRSSData *data;
@property (nonatomic, retain)CustomCell *cell;

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style title:(NSMutableArray *)title pubdate:(NSMutableArray *)pubdate url:(NSMutableArray *)url description:(NSMutableArray *)descriprion;



@end
