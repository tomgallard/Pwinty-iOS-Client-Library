//
//  Model.m
//  testPwinty
//
//  Created by Chinara Kuzekeeva on 3/29/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import "Model.h"
#import "SubmissionData.h"

static Model *shareInstance = nil;

@interface Model () {
@private
}

@property (retain, nonatomic) PWINTY *pw;

@end

@implementation Model
@synthesize pw = _pw;

#pragma mark - Singletone

+ (Model *)currentInstance
{
    @synchronized(self)
    {
        if(shareInstance == nil)
        {
            shareInstance = [[super allocWithZone:NULL] retain];
            shareInstance.pw = [[[PWINTY alloc] 
                                 initWithMerchantID:@"acb80c71-58c5-429b-9f23-766936aa6622" 
                                 APIKey:@"fe892e14-a343-4292-bfd8-cf6cfa97d3f6" 
                                 andDelegate:shareInstance] autorelease];
            [shareInstance.pw useSandboxHost:YES];
        }
    }
    return shareInstance;
}



+ (void)disposeModel
{
    @synchronized(self)
    {
        if(shareInstance == nil)return;
        [shareInstance release];
    }
}

+ (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (oneway void)release
{
    
}

- (NSUInteger)retainCount
{
    return UINT_MAX;
}

- (id)autorelease
{
    return self;
}

- (id)retain
{
    return self;
}
#pragma mark - Alert

- (void)showAllertWithTitle:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
}

#pragma mark - WebServicesProtocol

-(void) connectionBegin
{
    NSLog(@"Connection begin");
}

- (void)ordersLoadedWithResult:(NSArray *)result
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ordersReceived" object:result];
}

- (void)orderCreatedWithResult:(OrdersData *)result
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"orederCreated" object:result];
}

- (void)orderStatusWithResult:(NSString *)result
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"orderStatus" object:result];
}

- (void)orderSubmissionStatusWithResult:(SubmissionData *)result
{
    NSMutableString *str = [NSMutableString string];
    [str appendString:@"-Warnings and Errors-"];
    NSArray *warnings = result.oPhotos;
    for (PhotoErrorData *pd in warnings)
    {
       [str appendFormat:@"id ---- %d, errors: - %@, warnings: - %@ ", pd.photoID, pd.photoErrors, pd.photoWarnings];
   
    }
    [self showAllertWithTitle:@"Message" andMessage:str];
}

- (void)photosDownloadedWithresult:(PhotosData *)result
{
    NSMutableString *str = [NSMutableString string];
    [str appendFormat:@"OrderID: %d \n PhotoID: %d \n Status: %@", result.oID, result.photoID, result.photoStatus];
    [self showAllertWithTitle:@"" andMessage:str];
}

- (void)photosUploadedWithresult:(PhotosData *)result
{
    NSMutableString *str = [NSMutableString string];
    [str appendFormat:@"OrderID: %d \n PhotoID: %d \n Status: %@", result.oID, result.photoID, result.photoStatus];
    [self showAllertWithTitle:@"Upload result" andMessage:str];
}

-(void) connectionDidFailWithError:(NSString *)error
{
    [self showAllertWithTitle:@"Error" andMessage:error];
}

#pragma mark - API methods



- (void)orders
{
    [_pw loadOrders];
}

- (void)createOrder:(OrdersData *)oData
{
    [_pw createNewOrderWithParams:oData];
}

- (void)loadOrdersWithOrderID:(int)oID
{
    [_pw loadOrdersWithOrderID:oID];
}

- (void)setOrderStatusWithParams:(NSDictionary *)params
{
    [_pw setOrderStatusWithParams:params];
}

- (void)getOrdersWithSubmissionStatusesByID:(int)oID
{
    [_pw getOrdersWithSubmissionStatusesByID:oID];
}

- (void)addPhotoToOrderWithParams:(PhotosData *)params
{
    [_pw addPhotoToOrderWithParams:params];
}

- (void)getPhotoInfoWithId:(int)pID
{
    [_pw getPhotoInfoWithId:pID];
}




#pragma mark - Observers


@end
