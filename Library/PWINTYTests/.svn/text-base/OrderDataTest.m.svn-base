//
//  OrderDataTest.m
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/30/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import "OrderDataTest.h"
#import "Keys.h"
#import "SBJSON.h"

@interface OrderDataTest() {
@private
}


@end

@implementation OrderDataTest

- (void)setUp
{
    // Set-up code here.
    [super setUp];
    NSLog(@"%@ setUp", self.name);
}

- (void)tearDown
{
    // Tear-down code here.
    [super tearDown];
    NSLog(@"%@ tearDown", self.name);
}

- (void)testValidOrderData
{
    NSString *jsonStr = [NSString stringWithString:@"{\"id\":129,\"address1\":\"The Hollies\",\"address2\":null,\"postalOrZipCode\":\"CF11 1AX\",\"country\":\"UK\",\"addressTownOrCity\":NY,\"recipientName\":\"Mr Jones\",\"textOnReverse\":null,\"stateOrCounty\":\"Glamorgan\",\"status\":\"Complete\",\"photos\":[]}"]; //Valid JSON string
    SBJSON *json = [[[SBJSON alloc] init] autorelease];

    NSDictionary *jsonDict = [json objectWithString:jsonStr];
    OrdersData *oData = [OrdersData createObjectFormDictionary:jsonDict];
    STAssertNotNil(oData, @"Order data creation error!");
}

- (void)testInvalidOrderData
{
    NSString *jsonStr = [NSString stringWithString:@"{\"id\":129,\"address1\":\"The Hollies\",\"address2\":null,\"postalOrZipCode\":\"CF11 1AX\",\"country\":\"UK\",\"addressTownOrCity\":null,\"recipientName\":null,\"textOnReverse\":null,\"stateOrCounty\":\"Glamorgan\",\"status\":\"Complete\",\"photos\":[]}"]; //invalid JSON string
    SBJSON *json = [[[SBJSON alloc] init] autorelease];
    NSDictionary *jsonDict = [json objectWithString:jsonStr];
    OrdersData *oData = [OrdersData createObjectFormDictionary:jsonDict];
    STAssertNil(oData, @"Order data creation error!");
}

@end
