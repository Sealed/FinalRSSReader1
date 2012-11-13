//
//  CTablewithRSSData.h
//  FisrtStepRSS
//
//  Created by student on 10/27/12.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTablewithRSSData : NSObject
{
    NSMutableArray *description;
    NSMutableArray *url;
    NSMutableArray *title;
    NSMutableArray *pubData;
}
@property (nonatomic,retain) NSMutableArray *description;
@property (nonatomic,retain) NSMutableArray *url;
@property (nonatomic,retain) NSMutableArray *title;
@property (nonatomic,retain) NSMutableArray *pubData;

@end
