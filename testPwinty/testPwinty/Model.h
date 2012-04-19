//
//  Model.h
//  testPwinty
//
//  Created by Chinara Kuzekeeva on 3/29/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import "PWINTY.h"

@interface Model : NSObject <WebServicesProtocol>
{
}

+ (Model *)currentInstance;
+ (void)disposeModel;

- (void)orders;
- (void)createOrder:(OrdersData *)oData;
- (void)loadOrdersWithOrderID:(int)oID;
- (void)setOrderStatusWithParams:(NSDictionary *)params;

- (void)getOrdersWithSubmissionStatusesByID:(int)oID;
- (void)addPhotoToOrderWithParams:(PhotosData *)params;
- (void)getPhotoInfoWithId:(int)pID;
- (void)showAllertWithTitle:(NSString *)title andMessage:(NSString *)message;
@end
