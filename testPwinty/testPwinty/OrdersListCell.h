//
//  OrdersListCell.h
//  testPwinty
//
//  Created by Chinara Kuzekeeva on 3/29/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrdersData.h"

@interface OrdersListCell : UITableViewCell
{

    IBOutlet UILabel *_oID;
    IBOutlet UILabel *recipientName;
    IBOutlet UILabel *address1;
    IBOutlet UILabel *_address2;
    IBOutlet UILabel *TownCity;
    IBOutlet UILabel *StateCountry;
    IBOutlet UILabel *postalZip;
    IBOutlet UILabel *country;
    IBOutlet UILabel *status;
    IBOutlet UILabel *photosCount;
}

- (void)setData:(OrdersData *)oData;
@end
