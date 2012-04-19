//
//  ViewController.h
//  testPwinty
//
//  Created by Chinara Kuzekeeva on 3/27/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PWINTY.h"
@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *_table;
    NSArray *_requests;
    IBOutlet UIActivityIndicatorView *_ind;
}
@end
