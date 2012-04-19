//
//  AllOrdersViewController.h
//  testPwinty
//
//  Created by Chinara Kuzekeeva on 3/28/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//
#import "OrdersData.h"

@interface AllOrdersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>
{
    IBOutlet UITableView *_table;
    OrdersData *_oData;
}

@property (retain, nonatomic) NSArray *oredrs;
@end
