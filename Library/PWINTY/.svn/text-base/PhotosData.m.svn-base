//
//  PhotosData.m
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/29/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import "PhotosData.h"
#import "PwintyKeys.h"
#import "Utils.h"

@implementation PhotosData

@synthesize oID = _oID;
@synthesize photoID = _photoID;
@synthesize photoCopies = _photoCopies;
@synthesize photoType = _photoType;
@synthesize photoPath = _photoPath;
@synthesize photoStatus = _photoStatus;
@synthesize photoSizing = _photoSizing;
@synthesize photoFile = _photoFile;
@synthesize photoFileName = _photoFileName;

+ (NSDictionary *)createDictionaryFromObject:(PhotosData *)pData
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:[NSString stringWithFormat:@"%d",  pData.oID] forKey:kOrderID];
    [dict setObject:[NSString stringWithFormat:@"%d", pData.photoID] forKey:kID];
    
    [dict setObject:[NSString stringWithFormat:@"%d", pData.photoCopies] forKey:kPhotoCopies];
    [dict setObject:pData.photoType forKey:kPhotoType];
    [dict setObject:pData.photoPath forKey:kPhotoPath];
    [dict setObject:pData.photoStatus forKey:kStatus];
    [dict setObject:pData.photoSizing forKey:kPhotoSizing];
    [dict setObject:pData.photoFile forKey:kPhotoFile];
    [dict setObject:pData.photoFileName forKey:kphotoFileName];
    return dict;

}
+ (PhotosData *)createObjectFormDictionary:(NSDictionary *)dict
{
    NSArray *ex = [NSArray arrayWithObjects:kPhotoPath, kPhotoFile, nil];
    BOOL isFieldEmpty = [Utils isFieldEmpty:dict exceptions:ex];
    if (!isFieldEmpty)
    {
        PhotosData *pData = [[PhotosData alloc] init];
        pData.oID = [[dict objectForKey:kOrderID] intValue];
        pData.photoID = [[dict objectForKey:kID] intValue];
        pData.photoCopies = [[dict objectForKey:kPhotoCopies] intValue];
        pData.photoType = [dict objectForKey:kPhotoType];
        pData.photoPath = [dict objectForKey:kPhotoPath]; //optional
        pData.photoStatus = [dict objectForKey:kStatus];
        pData.photoSizing = [dict objectForKey:kPhotoSizing];
        pData.photoFile = [dict objectForKey:kPhotoFile]; //optional
        pData.photoFileName = [dict objectForKey:kphotoFileName]; //need only if photo file field is not empty
        return [pData autorelease];
    }
    else
    {
        return nil;
    }
}

+ (NSArray *)createArrayOfObjectsFromArray:(NSArray *)array
{
    PhotosData *pData;
    NSMutableArray *arr;
    arr = [NSMutableArray array];
    for (NSDictionary * dict in array) {
        pData = [PhotosData createObjectFormDictionary:dict];
        if (pData != nil)[arr addObject:pData];
    }
    return arr;
}

- (void)dealloc
{
    [_photoType release];
    [_photoPath release];
    [_photoStatus release];
    [_photoSizing release];
    [_photoFile release];
    [_photoFileName release];
    [super dealloc];
}
@end
