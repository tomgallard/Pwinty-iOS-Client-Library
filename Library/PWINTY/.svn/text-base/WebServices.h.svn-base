//
//  WebServices.h
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/27/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//


#import "PwintyKeys.h"
#import "OrdersData.h"
#import "PhotosData.h"
#import "SubmissionData.h"
#import "WebServicesProtocol.h"

//@protocol WebServicesProtocol<NSObject>
//@optional
//
///**
//1) For call before the request gone to the server
//*/
//- (void)startRequestWithType:(requestType)type;
//
//- (void)ordersLoadedWithResult:(NSArray *)result;
//
//- (void)orderCreatedWithResult:(OrdersData *)result;
//
//- (void)orderStatusWithResult:(NSString *)result;
//
//- (void)orderSubmissionStatusWithResult:(SubmissionData *)result;
//
//- (void)photoInfoLoadedWithResult:(PhotosData *)result;
//
//- (void)photoUploadedWithResult:(PhotosData *)result;
//
//@required
///**
// 1) The errors of the server in reply to incorrect data in requests.
// 
// 2) The errors of connection.
// */
//-(void) connectionDidFailWithError:(NSString *)error;
//@end

@interface WebServices : NSObject
{
    id<WebServicesProtocol>deleagte;
}

@property (assign, nonatomic) id<WebServicesProtocol>delegate;

#ifndef DOXYGEN_SHOULD_SKIP_THIS
@property (retain, nonatomic) NSString *HOST;
@property (retain, nonatomic) NSString *merchantID;
@property (retain, nonatomic) NSString *APIKey;
#endif /* DOXYGEN_SHOULD_SKIP_THIS */
#pragma mark - Singletone

+ (WebServices *)currentInstance;
+ (void)disposeWebServices;

#ifndef DOXYGEN_SHOULD_SKIP_THIS
#pragma mark - API

- (void)loadOrders;
- (void)loadOrderWithOrderID:(int)oID;
- (void)createNewOrderWithParams:(NSDictionary *)params; 
- (void)setOrderStatusWithParams:(NSDictionary *)params;
- (void)getOrdersWithSubmissionStatusesByID:(int)oID;
- (void)addPhotoToOrderWithParams:(PhotosData *)params;
- (void)getPhotoInfoWithId:(int)pID;
#endif /* DOXYGEN_SHOULD_SKIP_THIS */
@end
