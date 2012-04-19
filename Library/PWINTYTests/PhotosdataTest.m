//
//  PhotosdataTest.m
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 4/2/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import "PhotosdataTest.h"
#import "PhotosData.h"
#import "JSON.h"
//change jsonStr
@implementation PhotosdataTest

- (void)testValidPhotosData
{
    SBJSON *json = [[[SBJSON alloc] init] autorelease];
    NSDictionary *jsonDict = nil;
    PhotosData *pData = nil;
    NSString *URLStr = [NSString stringWithString:@"{\"id\":171,\"type\":\"6x6\",\"url\":\"http://lh5.ggpht.com/_QLwms0mVa4w/S_btQMyOJqI/AAAAAAAAAqk/gjrND_lMd84/Screen%20shot%202010-05-21%20at%204.29.17%20PM.png\",\"status\":\"FileNotFoundAtUrl\",\"copies\":5,\"sizing\":\"Crop\",\"orderId\":129}"]; //Valid JSON string
    NSString *emptyURLStr = [NSString stringWithString:@"{\"id\":171,\"type\":\"6x6\",\"url\":null,\"status\":\"FileNotFoundAtUrl\",\"copies\":5,\"sizing\":\"Crop\",\"orderId\":129}"];
    NSArray *arr = [NSArray arrayWithObjects:URLStr, emptyURLStr, nil];
    for (NSString *str in arr)
    {
        jsonDict = [json objectWithString:str];
        pData = [PhotosData createObjectFormDictionary:jsonDict];
        STAssertNotNil(pData, @"Photo data creation error!");
    }
    
}

- (void)testInvalidPhotosData
{
    SBJSON *json = [[[SBJSON alloc] init] autorelease];
    NSDictionary *jsonDict = nil;
    PhotosData *pData = nil;
    NSString *emptyStatusStr = [NSString stringWithString:@"{\"id\":171,\"type\":\"6x6\",\"url\":\"http://lh5.ggpht.com/_QLwms0mVa4w/S_btQMyOJqI/AAAAAAAAAqk/gjrND_lMd84/Screen%20shot%202010-05-21%20at%204.29.17%20PM.png\",\"status\":null,\"copies\":5,\"sizing\":\"Crop\",\"orderId\":129}"]; //invalid JSON string
    NSString *emptyOrderIdStr = [NSString stringWithString:@"{\"id\":171,\"type\":\"6x6\",\"url\":\"http://lh5.ggpht.com/_QLwms0mVa4w/S_btQMyOJqI/AAAAAAAAAqk/gjrND_lMd84/Screen%20shot%202010-05-21%20at%204.29.17%20PM.png\",\"status\":\"FileNotFoundAtUrl\",\"copies\":5,\"sizing\":\"Crop\",\"orderId\":null}"]; //invalid JSON string
    NSArray *arr = [NSArray arrayWithObjects:emptyStatusStr, emptyOrderIdStr, nil];
    for (NSString *str in arr)
    {
        jsonDict = [json objectWithString:str];
        pData = [PhotosData createObjectFormDictionary:jsonDict];
        STAssertNil(pData, @"Photo data creation error!");
    }
}


@end
