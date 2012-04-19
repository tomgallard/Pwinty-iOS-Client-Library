//
//  AllOrdersViewController.m
//  testPwinty
//
//  Created by Chinara Kuzekeeva on 3/28/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import "AllOrdersViewController.h"
#import "OrdersData.h"
#import "Model.h"
#import "OrdersListCell.h"
#import "PhotosData.h"

@implementation AllOrdersViewController
@synthesize oredrs;

- (void)loadOrdersData:(NSNotification *)notif
{
    NSArray *dataArray = notif.object;
    OrdersData *oData = [dataArray lastObject];
    NSMutableString *str = [NSMutableString string];
    [str appendFormat:@"Loaded order \n orderID: %d, recipient name: %@", oData.oID, oData.recipientName];
    [[Model currentInstance] showAllertWithTitle:@"" andMessage:str];
}


- (void)addObservers
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(loadOrdersData:) name:@"ordersReceived" object:nil];
    [center addObserver:self selector:@selector(orderStatusChangingResultReceived:) name:@"orderStatus" object:nil];
}

- (void)orderStatusChangingResultReceived:(NSNotification *)notif
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [_table release];
    _table = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self addObservers];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_table release];
    [super dealloc];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _oData = (OrdersData *)[oredrs objectAtIndex:indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Load order", @"Set order status", @"Submission", @"Upload Photo", @"Get photos", nil];
    [alert show];
    [alert release];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [oredrs count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
	OrdersListCell *cell = (OrdersListCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if (cell == nil) 
	{
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"OrdersListCell" owner:self options:nil];
		cell = [nib objectAtIndex:0];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	}

    OrdersData *oData = [oredrs objectAtIndex:indexPath.row];
    [cell setData:oData];
    return cell;
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != alertView.cancelButtonIndex)
    {
        Model *model = [Model currentInstance];
        switch (buttonIndex) {
            case 1: //Load order by id
            {
                [model loadOrdersWithOrderID:_oData.oID];
            }
                break;
            case 2:
            {
                NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d", _oData.oID], kID, kOrderStatusCancelled, kStatus, nil];
                [model setOrderStatusWithParams:dict];
            }
                break;
            case 3:
            {
                [model getOrdersWithSubmissionStatusesByID:_oData.oID];
            }
                break;
                case 4:
            {
                UIImage *img = [UIImage imageNamed:@"myaso.png"];
                NSData *data = UIImageJPEGRepresentation(img, 1);
                 NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d", _oData.oID], kOrderID, kPhotoType8x10, kPhotoType, @"5", kPhotoCopies, kSizingOptionShrinkToExactFit, kPhotoSizing, data, kPhotoFile,  nil];
                PhotosData *pData = [PhotosData createObjectFormDictionary:dict];
                [model addPhotoToOrderWithParams:pData];
            }
                break;
            case 5:
            {
                if ([_oData.photos count] > 0)
                {
                    PhotosData *pData = [_oData.photos objectAtIndex:0];
                    [model getPhotoInfoWithId:pData.photoID];
                    
                }
            }
                break;
            default:
                break;
        }
    }
}

@end
