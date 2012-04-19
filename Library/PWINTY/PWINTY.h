//
//  PWINTY.h
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/27/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PwintyKeys.h"
#import "WebServicesProtocol.h"
#import "OrdersData.h"
#import "SubmissionData.h"
#import "PhotosData.h"


/**
 @mainpage * Main Pwinty interface class.
 This class contains methods for initialization, host choice and server calls. 
 */

@interface PWINTY : NSObject
{
    id<WebServicesProtocol>delegate; 
}

/**
  id<WebServicesProtocol>delegate – obligatory, delegate for receiving server callbacks
 */
@property (assign, nonatomic) id<WebServicesProtocol>delegate;

/**
 Specifies the desired host.
 @param isSandBox – YES for connecting to the sandbox host, NO for production server. 
 
 All testing and development should be done against the sandbox API. 
 This is an environment where you can create and submit orders without incurring any costs.
 */
- (void)useSandboxHost:(BOOL)isSandBox;

/**
 Class intializer. 
 @param  mID - MerchantID, key - APIKey, target – Class for processing server callbacks.
 */
- (id)initWithMerchantID:(NSString *)mID 
                  APIKey:(NSString *)key 
             andDelegate:(id<WebServicesProtocol>)target;

/**
 <br>Retrieves information about all your orders.</br>
 
 <br>On success calls <b>ordersLoadedWithResult</b> of PWINTY delegate object with
 array of OrdersData objects as parameter. Refer to \file WebServicesProtocol.h </br>

 */

- (void)loadOrders;

/**
 <br>Retrieves information about specific order.</br>
 
 <br>On success calls <b>ordersLoadedWithResult</b> of PWINTY delegate object with
 array with OrdersData object as parameter. Refer to \file WebServicesProtocol.h </br>
 
 <br>On failure calls <b>connectionDidFailWithError</b> with error description:</br>

 - The order with the specified id was not found.
 */
- (void)loadOrderWithOrderID:(int)oID;

/**
 <br>Creates a new order.</br>
 @param oData - OrdersData object. Refer to \file OrdersData.h
  
 <br>On success calls <b>orderCreatedWithResult</b> of PWINTY delegate object with OrdersData object as parameter. Refer to \file WebServicesProtocol.h </br>
 
 <br>On failure calls <b>connectionDidFailWithError</b> with error description:</br>
 
 - One of the input parameters was invalid or missing, error message should indicate which one and why.
 */
- (void)createNewOrderWithParams:(OrdersData *)oData;

/**
 <br>Update the status of an order (to submit or cancel it).</br>
 @param params - NSDictionary object.
 Must contain the following fields:
 - 1) id - Order id;
 - 2) status - Status to which the order should be updated. Valid values are "Cancelled" or "Submitted";
 
  <br>On success calls <b>orderStatusWithResult</b> of PWINTY delegate object with string object as parameter. Refer to \file WebServicesProtocol.h </br>
 
 <br>On failure calls <b>connectionDidFailWithError</b> with error descriptions:</br>

 - Order with the specified id was not found;
 - One or more of the input parameters was invalid;
 - The order cannot be transitioned to the supplied status from its current status.
 */
- (void)setOrderStatusWithParams:(NSDictionary *)params;

/**
 Gets information on whether the order is ready for submission, and any errors or warnings associated with the order
 @param id - Order id
 
 <br>On success calls <b>orderSubmissionStatusWithResult</b> of PWINTY delegate object with SubmissionData object as parameter. Refer to \file WebServicesProtocol.h </br>
 
 <br>On failure calls <b>connectionDidFailWithError</b> with error description:</br>
 
 - Order with the specified id was not found.
 */
- (void)getOrdersWithSubmissionStatusesByID:(int)oID;
/**
 Add a photo to an order
 @param params - PhotosData object. Refer to \file PhotosData.h.
 
 <br>On success calls <b>photoUploadedWithResult</b> of PWINTY delegate object with
 PhotosData object as parameter. Refer to \file WebServicesProtocol.h </br>
 
 <br>On failure calls <b>connectionDidFailWithError</b> with error descriptions:</br>

 - Bad or missing input parameter- see error for more details;
 - The order is in a state (e.g. Complete) where photos cannot be added;
 - The order with the specified orderId was not found.
 */
- (void)addPhotoToOrderWithParams:(PhotosData *)params;

/**
 Retrieves information about a specific photo
 @param pId - the id of the photo.
 
 <br>On success calls <b>photoInfoLoadedWithResult</b> of PWINTY delegate object with
 PhotosData object as parameter. Refer to \file WebServicesProtocol.h </br>
 
 <br>On failure calls <b>connectionDidFailWithError</b> with error description:</br>
 
 - The photo with the specified id was not found.
 */
- (void)getPhotoInfoWithId:(int)pID;

@end
