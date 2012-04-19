//
//  SubmissionData.m
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/29/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//


#import "SubmissionData.h"
#import "PwintyKeys.h"
#import "Utils.h"

@implementation SubmissionData

@synthesize oID = _oID;
@synthesize oGeneralErrors = _oGeneralErrors;
@synthesize oPhotos = _oPhotos;
@synthesize oIsValid = _oIsValid;

+ (SubmissionData *)createObjectFromDictionary:(NSDictionary *)dict
{
    BOOL isFieldEmpty = [Utils isFieldEmpty:dict exceptions:nil];
    if (isFieldEmpty) return nil;

    SubmissionData *sData;
    sData = [[SubmissionData alloc] init];
    sData.oID = [[dict objectForKey:kID] intValue];
    sData.oGeneralErrors = [dict objectForKey:kGeneralErrors];
    sData.oIsValid = [[dict objectForKey:kIsValid] boolValue];
    NSArray *arr = [dict objectForKey:kPhotos];
    if ([arr count] > 0)
    {
        sData.oPhotos = [PhotoErrorData createArrayOfObjectsFromArray:arr];
    }
    return [sData autorelease];

}

- (void)dealloc
{
    [_oGeneralErrors release];
    [_oPhotos release];
    [super dealloc];
}

@end

@implementation PhotoErrorData

@synthesize photoID = _photoID;
@synthesize photoErrors = _photoErrors;
@synthesize photoWarnings = _photoWarnings;

+ (PhotoErrorData *)createObjectFromDictionary:(NSDictionary *)dict
{
    PhotoErrorData *eData;
    eData = [[PhotoErrorData alloc] init];
    eData.photoID = [[dict objectForKey:kID] intValue];
    eData.photoErrors = [dict objectForKey:kErrors];
    eData.photoWarnings = [dict objectForKey:kWarnings];
    return [eData autorelease];
}

+ (NSArray *)createArrayOfObjectsFromArray:(NSArray *)array
{
    PhotoErrorData *eData;
    NSMutableArray *arr;
    arr = [NSMutableArray array];
    for (NSDictionary * dict in array) {
        eData = [PhotoErrorData createObjectFromDictionary:dict];
        [arr addObject:eData];
    }
    return arr;
}

- (void)dealloc
{
    [_photoErrors release];
    [_photoWarnings release];
    [super dealloc];
}

@end
