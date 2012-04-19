//
//  OrdersData.m
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/27/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import "OrdersData.h"
#import "SBJSON.h"
#import "PwintyKeys.h"
#import "PhotosData.h"
#import "Utils.h"

@implementation OrdersData
@synthesize oID = _oID;;
@synthesize recipientName = _recipientName;
@synthesize address1 = _address1;;
@synthesize address2 = _address2;
@synthesize addressTownOrCity = _addressTownOrCity;
@synthesize stateOrCountry = _stateOrCountry;
@synthesize postalOrZipCode = _postalOrZipCode;
@synthesize country = _country;
@synthesize status = _status;
@synthesize photos = _photos;;
@synthesize textObReverse = _textObReverse;

+ (NSDictionary *)createDictionaryFromObject:(OrdersData *)oData
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:oData.recipientName forKey:kRecipientName];
    [dict setObject:oData.address1 forKey:kAddress1];
    if (oData.address2 != nil)
    {
        [dict setObject:oData.address2 forKey:kAddress2];
    }
    [dict setObject:oData.addressTownOrCity forKey:kAddressTownOrCity];
    [dict setObject:oData.stateOrCountry forKey:kStateOrCountry];
    [dict setObject:oData.postalOrZipCode forKey:kPostalOrZipCode];
    [dict setObject:oData.country forKey:kCountry];
    if (oData.textObReverse != nil)
    {
        [dict setObject:oData.textObReverse forKey:kTextOnReverse];
    }
    return dict;
}

+ (OrdersData *)createObjectFormDictionary:(NSDictionary *)dict
{
    NSArray *ex = [NSArray arrayWithObjects:kAddress2, kTextOnReverse, nil];
    BOOL isFieldEmpty = [Utils isFieldEmpty:dict exceptions:ex];
    if (!isFieldEmpty)
    {
        id obj;
        OrdersData *oData;
        oData = [[OrdersData alloc] init];
        oData.oID = [[dict objectForKey:kID] intValue];
        oData.recipientName = [dict objectForKey:kRecipientName];
        oData.address1 = [dict objectForKey:kAddress1];
        oData.stateOrCountry = [dict objectForKey:kStateOrCountry];
        oData.postalOrZipCode = [dict objectForKey:kPostalOrZipCode];
        oData.country = [dict objectForKey:kCountry];
        oData.status = [dict objectForKey:kStatus];
        oData.photos = [dict objectForKey:kPhotos];
        obj = [dict objectForKey:kAddress2];
        if ([obj isKindOfClass:[NSNull class]]) oData.address2 = nil;
        else oData.address2 = obj;
        
        obj = [dict objectForKey:kAddressTownOrCity];
        if ([obj isKindOfClass:[NSNull class]]) oData.addressTownOrCity = nil;
        else oData.addressTownOrCity = obj;
        
        if ([oData.photos count] > 0)
        {
            oData.photos = [PhotosData createArrayOfObjectsFromArray:oData.photos];
        }
        oData.textObReverse = [dict objectForKey:kTextOnReverse];
        return [oData autorelease];
    }
    else
    {
        return nil;
    }
}

+ (NSArray *)createArrayOfObjectsFromArray:(NSArray *)array
{
    OrdersData *oData;
    NSMutableArray *arr;
    arr = [NSMutableArray array];
    for (NSDictionary * dict in array) {
        oData = [OrdersData createObjectFormDictionary:dict];
        if (oData != nil)[arr addObject:oData];
    }
    return arr;
}

- (void)dealloc
{
    [_recipientName release];
    [_address1 release];
    [_address2 release];
    [_addressTownOrCity release];
    [_stateOrCountry release];
    [_postalOrZipCode release];
    [_country release];
    [_status release];
    [_photos release];
    [_textObReverse release];
    [super dealloc];
}
@end
