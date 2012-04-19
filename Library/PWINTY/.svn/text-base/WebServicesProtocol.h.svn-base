//
//  WebServicesProtocol.h
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 4/4/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrdersData.h"
#import "PhotosData.h"
#import "SubmissionData.h"
#import "PwintyKeys.h"

@protocol WebServicesProtocol<NSObject>
@optional

/**
 1) For call before the request gone to the server
 */
- (void)startRequestWithType:(requestType)type;

/**
  \return NSArray of OrdersData objects.
 */
- (void)ordersLoadedWithResult:(NSArray *)result;

/**
 \return OrderData object representing the new order.
 */
- (void)orderCreatedWithResult:(OrdersData *)result;

/**
 \return Status code denoting success or failure.
 */
- (void)orderStatusWithResult:(NSString *)result;

/**
 \return SubmissionData object containing information on any errors or warnings associated with the order.
 */
- (void)orderSubmissionStatusWithResult:(SubmissionData *)result;

/**
 \return Information about the uploaded photo (PhotosData object).
 */
- (void)photoUploadedWithResult:(PhotosData *)result;

/**
 \return Information about the photo.
 */
- (void)photoInfoLoadedWithResult:(PhotosData *)result;


@required
/**
 1) The errors of the server in reply to incorrect data in requests.
 
 2) The errors of connection.
 */
-(void) connectionDidFailWithError:(NSString *)error;
@end


