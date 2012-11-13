//
//  CustomCell.h
//  FisrtStepRSS
//
//  Created by student on 10/27/12.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    UILabel *title;
    UILabel *pubData;
    UILabel *descriprion;
}
@property(nonatomic,retain)UILabel *title;
@property(nonatomic,retain)UILabel *pubData;
@property(nonatomic,retain)UILabel *descriprion;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
