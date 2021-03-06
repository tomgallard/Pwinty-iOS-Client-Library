//
//  OrdersData.h
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/27/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//


/**
 Object representing specified order.
 */

@interface OrdersData : NSObject
/**
 Unique integer identifying the order
 */
@property (assign, nonatomic) int oID;
/**
 Who the order will be addressed to
 */
@property (retain, nonatomic) NSString *recipientName;
/**
 First line of recipient address
 */
@property (retain, nonatomic) NSString *address1;
/**
 Second line of recipient address (OPTIONAL)
 */
@property (retain, nonatomic) NSString *address2;
/**
 Town/City of recipient address
 */
@property (retain, nonatomic) NSString *addressTownOrCity;
/**
 State (US) or County (UK) of recipient address
 */
@property (retain, nonatomic) NSString *stateOrCountry;
/**
 Postal/Zipcode of recipient address
 */
@property (retain, nonatomic) NSString *postalOrZipCode;
/**
 Country of recipient (we support almost every country in the world!)
 */
@property (retain, nonatomic) NSString *country;
/**
 Status of order. 
 - Can be:
     1) kOrderStatusNotYetSubmitted;
     2) kOrderStatusSubmitted;
     3) kOrderStatusComplete;
     4) kOrderStatusCancelled;
 */
@property (retain, nonatomic) NSString *status;
/**
 An array of PhotosData objects representing the photos in the order. 
 */
@property (retain, nonatomic) NSArray *photos;
/**
 Text to be printed on the back of each photo in the order (OPTIONAL)
 */
@property (retain, nonatomic) NSString *textObReverse;

/**
 Return NSDictionary with spesified keys.
 */
+ (NSDictionary *)createDictionaryFromObject:(OrdersData *)oData;

/**
 Return OrdersData object.
 */
+ (OrdersData *)createObjectFormDictionary:(NSDictionary *)dict;

/**
 Return an array of OrdersData objects.
 */
+ (NSArray *)createArrayOfObjectsFromArray:(NSArray *)array;
@end
