//
//  PWINTY.h
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/27/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Keys.h"
#import "WebServices.h"
#import "OrdersData.h"
#import "SubmissionData.h"
#import "PhotosData.h"
/**
 @mainpage * Main Pwinty interface class.
 The class contains methods of calls to the server, initialization and host choice. 
 */

@interface PWINTY : NSObject
{
    id<WebServicesProtocol>delegate; 
}

/**
  id<WebServicesProtocol>delegate – it must be set obligatory for receiving of the callbacks from the server 
 */
@property (assign, nonatomic) id<WebServicesProtocol>delegate;

/**
 Specifies the desired host.
 @param isSandBox – If sandbox – pass YES, if live – pass NO 
 
 All testing and development should be done agains the sandbox API . 
 This is an environment where you can create, and submit orders without incurring any costs.
 */
- (void)useSandboxHost:(BOOL)isSandBox;

/**
 The method of initialization of the class. 
 @param  mID - MerchantID, key - APIKey, target – The class which should get the callbacks from the server.
 */
- (id)initWithMerchantID:(NSString *)mID 
                  APIKey:(NSString *)key 
             andDelegate:(id<WebServicesProtocol>)target;

/**
 Retrieves information about all your orders
 
 \return NSArray of OrdersData objects.

 */

- (void)loadOrders;

/**
 Retrieves information about specific order
 
 <br><b>Errors</b></br>
 
 - 404 - The order with the specified id was not found
 */
- (void)loadOrdersWithOrderID:(int)oID;

/**
 Creates a new order
 @param oData - OrdersData object. 
 Must contain the following fields:
 1) recipientName - Who the order should be addressed to
 2) address1 - 1st line of recipient address
 3) address2 - 2nd line of recipient address (OPTIONAL)
 4) addressTownOrCity - Town or City in the address
 5) stateOrCounty - State or County in the address
 6) postalOrZipCode - Postal code or Zip code of recipient
 7) country - Country of recipient (We support pretty much every country in the world)
 8) textOnReverse - text to be printed on the back of each photo in the order (max 27 characters, alpha numeric only) (OPTIONAL)
 
 \return OrderData object representing the new order.

 <br><b>Errors</b></br>
 
 - 400 - One of the input parameters was invalid or missing, error message should indicate which one and why
 */
- (void)createNewOrderWithParams:(OrdersData *)oData;

/**
 Update the status of an order (to submit or cancel it)
 @param params - NSDictionary object.
 Must contain the following fields:
 - 1) id - Order id
 - 2) status - Status to which the order should be updated. Valid values are "Cancelled" or "Submitted"
 
 \return Status code denoting success or failure.
 
 <br><b>Errors</b></br>
 
 - 404 - Order with the specified id was not found
 - 400 - One or more of the input parameters was invalid
 - 403 - The order cannot be transitioned to the supplied status from its current status
 */
- (void)setOrderStatusWithParams:(NSDictionary *)params;

/**
 Gets information on whether the order is ready for submission, and any errors or warnings associated with the order
 @param id - Order id
 
 \return SubmissionData object containing information on any errors or warnings associated with the order.
 
 <br><b>Errors<b></br>
 
 - 404 - Order with the specified id was not found
 */
- (void)getOrdersWithSubmissionStatusesByID:(int)oID;
/**
 Add a photo to an order
 @param params - PhotosData object.
 
 The object must contain the following data
 
 - 1) orderId - the id of the order the photo is being added to
 - 2) type - the type/size of photo
 - 3) url - if the photo is online, the url from which we can download it (OPTIONAL)
 - 4) copies - the number of copies of the photo to include in the order
 - 5) sizing - how the image should be resized when printing (resizing options)
 - 6) file - if you have the image file, then make this request as a multipart/form-data with the file included (OPTIONAL)

 \return Information about the created photo (photosData object)
 
 <br><b>Errors<b></br>
 
 - 400 - Bad or missing input parameter- see error for more details
 - 403 - The order is in a state (e.g. Complete) where photos cannot be added
 - 404 - The order with the specified orderId was not found
 */
- (void)addPhotoToOrderWithParams:(PhotosData *)params;

/**
 Retrieves information about a specific photo
 @param pId - the id of the photo.
 
 \return Information about the photo.
 
  <br><b>Errors<b></br>
 
 - 404 - The photo with the specified id was not found
 */
- (void)getPhotoInfoWithId:(int)pID;

@end
