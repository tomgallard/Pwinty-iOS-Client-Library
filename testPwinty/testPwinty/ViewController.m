//
//  ViewController.m
//  testPwinty
//
//  Created by Chinara Kuzekeeva on 3/27/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "AllOrdersViewController.h"

@implementation ViewController

- (void)orderCreated:(NSNotification *)notif
{
    OrdersData *oData = notif.object;
    NSMutableString *mStr = [NSMutableString string];
    [mStr appendFormat:@"Order id: %@ \n Recipient name: %@", oData.oID, oData.recipientName];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:mStr delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)loadOrdersData:(NSNotification *)notif
{
    NSArray *dataArray = notif.object;
    AllOrdersViewController *ctrl = [[AllOrdersViewController alloc] initWithNibName:@"AllOrdersViewController" bundle:nil];
    ctrl.oredrs = [NSArray arrayWithArray:dataArray];
    [self.navigationController pushViewController:ctrl animated:YES];
    [ctrl release];
}

- (void)addObservers
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(loadOrdersData:) name:@"ordersReceived" object:nil];
    [center addObserver:self selector:@selector(orderCreated:) name:@"orederCreated" object:nil];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    _requests = [[NSArray alloc] initWithObjects:@"Load all orders (GET)", @"Create Order (POST)",  nil];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [_table release];
    _table = nil;
    [_ind release];
    _ind = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self addObservers];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {

    [_table release];
    [_requests release];

    [_ind release];
    [super dealloc];
}
#pragma mark - Requests

//test order
- (NSDictionary *)createOrdersDict
{
    NSMutableDictionary *dict = [NSMutableDictionary  dictionary];
    [dict setObject:@"Mr. Crash" forKey:kRecipientName];
    [dict setObject:@"14 star street" forKey:kAddress1];
    [dict setObject:@"Possum town" forKey:kAddressTownOrCity];
    [dict setObject:@"Sate" forKey:kStateOrCountry];
    [dict setObject:@"258777 DFS" forKey:kPostalOrZipCode];
    [dict setObject:@"USA" forKey:kCountry];
    [dict setObject:@"CrazyWeekend" forKey:kTextOnReverse];
    return [NSDictionary dictionaryWithDictionary:dict];
}

#pragma mark - UITableviewDelegates

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Model *model = [Model currentInstance];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0)
    {
        [model orders];
    }
    else if (indexPath.row == 1)
    {
        NSDictionary *dict = [self createOrdersDict];
        OrdersData *oData = [OrdersData createObjectFormDictionary:dict];
        [model createOrder:oData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_requests count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if (cell == nil) 
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

	}
    cell.textLabel.text = [_requests objectAtIndex:indexPath.row];
    return cell;

}
@end
