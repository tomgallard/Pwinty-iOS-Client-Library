//
//  WebServices.m
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/27/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import "WebServices.h"
#import "Utils.h"
#import "SubmissionData.h"
#import "Loader.h"

static WebServices *shareInstance = nil;

@interface WebServices () <LoaderProtocol>{
}
- (void)startRequest:(requestType)type;
@end

@implementation WebServices
@synthesize delegate = _delegate;
@synthesize HOST = _HOST;
@synthesize merchantID = _merchantID;
@synthesize APIKey = _APIKey;

#pragma mark - Singletone

+ (WebServices *)currentInstance
{
    @synchronized(self)
    {
        if(shareInstance == nil)
        {
            shareInstance = [[super allocWithZone:NULL] retain];
            shareInstance.HOST = [[[NSString alloc] init] autorelease];
            shareInstance.merchantID = [[[NSString alloc] init] autorelease];
            shareInstance.APIKey = [[[NSString alloc] init] autorelease];
        }
    }
    return shareInstance;
}



+ (void)disposeWebServices
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



#pragma mark - RequestBuilder

- (void)buildGETRequestWithType:(requestType)type URL:(NSURL *)url
{
    [self startRequest:type];
    [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
    NSMutableURLRequest *request;
    request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request addValue:_merchantID forHTTPHeaderField:@"X-Pwinty-MerchantId"];
    [request addValue:_APIKey forHTTPHeaderField:@"X-Pwinty-REST-API-Key"];
    Loader *ldr = [Loader loadWithRequest:request delegate:self];
    ldr.loaderTag = type;
}

- (void)buildPOSTRequestWithType:(requestType)type URL:(NSURL *)url body:(NSString *)body
{
    [self startRequest:type];
    [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
    NSMutableURLRequest *request;
    request = [NSMutableURLRequest requestWithURL:url];
    
    
   NSData *bodyData  =  [[body stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]
                               dataUsingEncoding:NSUTF8StringEncoding 
                               allowLossyConversion:YES];
    
	[request setHTTPMethod:@"POST"];
	
    //add header info
    [request addValue:_merchantID forHTTPHeaderField:@"X-Pwinty-MerchantId"];
    [request addValue:_APIKey forHTTPHeaderField:@"X-Pwinty-REST-API-Key"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    
    //create the body of the post
    [request setHTTPBody:bodyData];
    
    Loader *ldr = [Loader loadWithRequest:request delegate:self];
    ldr.loaderTag = type;
}

- (void)builPOSTRequestFirPhotosUploadingWithType:(requestType)type URL:(NSURL *)url params:(PhotosData *)params
{
    [self startRequest:type];
    [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
    NSInputStream *inputStream;
    NSMutableURLRequest *request;
    request = [NSMutableURLRequest requestWithURL:url];

    [request setHTTPMethod:@"POST"];
    NSString *boundary = @"-P-W-I-N-T-Y-I-P-H-O-N-E-A-P-P-";
    [request addValue:_merchantID forHTTPHeaderField:@"X-Pwinty-MerchantId"];
    [request addValue:_APIKey forHTTPHeaderField:@"X-Pwinty-REST-API-Key"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
    NSMutableData *postbody = [NSMutableData data];
    
    // file
    [postbody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithFormat:@"Content-Disposition: attachment; name=\"%@\"; filename=\"%@.jpg\"\r\n", kPhotoFile, params.photoFileName] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithString:@"Content-Type: image/png\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:params.photoFile];
    [postbody appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // order id
    [postbody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", kOrderID] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithFormat:@"%d", params.oID] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    //type
    [postbody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", kPhotoType] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[params.photoType dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];

    
    //copies
    [postbody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", kPhotoCopies] dataUsingEncoding:NSUTF8StringEncoding]];	
    [postbody appendData:[[NSString stringWithFormat:@"%d", params.photoCopies] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    //sizing
    [postbody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", kPhotoSizing] dataUsingEncoding:NSUTF8StringEncoding]];	
    [postbody appendData:[params.photoSizing dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
   //close form
    [postbody appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSString *str = [[NSString alloc] initWithData:postbody encoding:NSUTF8StringEncoding];
    NSLog(@"postbody --- %@", str);
    [str release];
    inputStream = [NSInputStream inputStreamWithData:postbody];
    [request setHTTPBodyStream:inputStream];
   
    Loader *ldr = [Loader loadWithRequest:request delegate:self];
    ldr.loaderTag = type;
}

#pragma mark - API

- (void)loadOrders //get
{
    NSString * path = [_HOST stringByAppendingPathComponent:kOrdersHostTail];
    NSURL * url = [NSURL URLWithString:path];
    [self buildGETRequestWithType:kTypeOrders URL:url];
    
}

- (void)loadOrderWithOrderID:(int)oID; //get
{
    NSString *idStr = [NSString stringWithFormat:@"%d", oID];
    NSString * path = [_HOST stringByAppendingPathComponent:kOrdersHostTail];
    NSURL * url = [Utils buildGETRequestWithPath:path andParams:[NSDictionary dictionaryWithObject:idStr forKey:kID]];
    [self buildGETRequestWithType:kTypeOrders URL:url];

}

- (void)createNewOrderWithParams:(NSDictionary *)params //post
{
    NSString *jsonStr;
    NSString * path = [_HOST stringByAppendingPathComponent:kOrdersHostTail];
    NSURL *url = [NSURL URLWithString:path];
    jsonStr = [Utils buildRequestParamsString:params];
    [self buildPOSTRequestWithType:kTypeCreateOrder URL:url body:jsonStr];
}

- (void)setOrderStatusWithParams:(NSDictionary *)params
{
    NSString *jsonStr = [Utils buildRequestParamsString:params];
    NSURL *url = [Utils buildURLWithHOST:_HOST andTail:kOrdersStatusHostTail];
    if (jsonStr == nil) return;
    else [self buildPOSTRequestWithType:kTypeOrderStatus URL:url body:jsonStr];

}

- (void)getOrdersWithSubmissionStatusesByID:(int)oID
{
    NSString *path = [_HOST stringByAppendingPathComponent:kOrderSubmissionHostTail];
    NSURL * url = [Utils buildGETRequestWithPath:path andParams:[NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"%d", oID] forKey:kID]];
    [self buildGETRequestWithType:kTypeOredrSubmissionStatus URL:url];
}

- (void)getPhotoInfoWithId:(int)pID // photo id
{
    NSString *idStr = [NSString stringWithFormat:@"%d", pID];
    NSString * path = [_HOST stringByAppendingPathComponent:kPhotosHostTail];
    NSURL * url = [Utils buildGETRequestWithPath:path andParams:[NSDictionary dictionaryWithObject:idStr forKey:kID]];
    [self buildGETRequestWithType:kTypePhotos URL:url];
}

- (void)addPhotoToOrderWithParams:(PhotosData *)params
{
    NSURL *url = [Utils buildURLWithHOST:_HOST andTail:kPhotosHostTail];
    if (params.photoPath != nil)
    {
        NSDictionary *dict = [PhotosData createDictionaryFromObject:params];
        NSString *jsonStr = [Utils buildRequestParamsString:dict];
        if (jsonStr == nil) return;
        else [self buildPOSTRequestWithType:kTypeCreatePhoto URL:url body:jsonStr];
    }
    else if (params.photoFile != nil)
    {
        [self builPOSTRequestFirPhotosUploadingWithType:kTypeCreatePhoto URL:url params:params];
    }
}

#pragma mark - LoaderDelegates
- (void)startRequest:(requestType)type
{
    if ([_delegate respondsToSelector:@selector(startRequestWithType:)])
    {
        [_delegate startRequestWithType:type];
    }
}

- (void)loadingDidFinishWithResult:(id)result andLoader:(id)loader
{
    if (_delegate == nil)return;
    
    Loader *instance = (Loader *)loader;
    NSArray *resultArray = nil;
    NSString *jsonStr = [[[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding] autorelease];
    NSString *errorStr;
    id jsonObj = [Utils buildObjectFromJSONString:jsonStr];
    if (jsonObj == nil) return;
    errorStr = [Utils getErrorTextFromObject:jsonObj];
    if (errorStr == nil)
    {
        switch (instance.loaderTag) {
            case kTypeOrders:
            {
                if ([jsonObj isKindOfClass:[NSArray class]])
                {
                    resultArray = (NSArray *)jsonObj;
                }
                else if ([jsonObj isKindOfClass:[NSDictionary class]])
                {
                    resultArray = [NSArray arrayWithObject:jsonObj];
                }
                resultArray = [OrdersData createArrayOfObjectsFromArray:resultArray];
                if ([_delegate respondsToSelector:@selector(ordersLoadedWithResult:)])
                {
                    [_delegate ordersLoadedWithResult:resultArray];
                }
            }
                break;
              case kTypeCreateOrder:
            {
                OrdersData *oData = [OrdersData createObjectFormDictionary:jsonObj];
                if ([_delegate respondsToSelector:@selector(oderCreatedWithResult:)])
                {
                    [_delegate orderCreatedWithResult:oData];
                }
            }
                break;
                case kTypeOrderStatus:
            {
                if ([_delegate respondsToSelector:@selector(orderStatusWithResult:)])
                {
                    [_delegate orderStatusWithResult:jsonStr];
                }

            }
                break;
                case kTypeOredrSubmissionStatus:
            {
                SubmissionData *sData;
                if ([jsonObj isKindOfClass:[NSDictionary class]])
                {
                    sData = [SubmissionData createObjectFromDictionary:jsonObj];
                    if ([_delegate respondsToSelector:@selector(orderSubmissionStatusWithResult:)])
                    {
                        [_delegate orderSubmissionStatusWithResult:sData];
                    }
                }
            }
                break;
                case kTypePhotos:
            {
                PhotosData *pData = [PhotosData createObjectFormDictionary:jsonObj];
                if ([_delegate respondsToSelector:@selector(photoInfoLoadedWithResult:)])
                {
                    [_delegate photoInfoLoadedWithResult:pData];
                }

            }
                break;
                case kTypeCreatePhoto:
            {
                PhotosData *pData = [PhotosData createObjectFormDictionary:jsonObj];
                if ([_delegate respondsToSelector:@selector(photoUploadedWithResult:)])
                {
                    [_delegate photoUploadedWithResult:pData];
                }
            }
                break;
            default:
                break;
        }
    }
    else
    {
        if ([_delegate respondsToSelector:@selector(connectionDidFailWithError:)])
        {
            [_delegate connectionDidFailWithError:errorStr];
        }
    }
}

- (void)loadingDidFinishWithError:(NSString *)error
{
    if (_delegate == nil)return;
    if ([_delegate respondsToSelector:@selector(connectionDidFailWithError:)])
    {
        [_delegate connectionDidFailWithError:error];
    }
}

@end
