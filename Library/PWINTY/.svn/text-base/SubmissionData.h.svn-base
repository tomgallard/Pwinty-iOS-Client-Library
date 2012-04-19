//
//  SubmissionData.h
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/29/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

/**
 Object representing data about specified order.
 */

@interface SubmissionData : NSObject

/**
 Boolean - is the order valid for submission (will it succeed if you submit it).
 */
@property (assign, nonatomic) BOOL oIsValid;

/**
 Id of the order this object relates to.
 */
@property (assign, nonatomic) int oID;

/**
 An array of strings, containing any top level errors associated with the order.
 
 - General Errors (which may be found in the oGeneralErrors array):
 
    1) AccountBalanceInsufficient - You cannot submit any more orders until you have paid off the balance outstanding on your account;
    2) ItemsContainingErrors - One or more of the photos in the order has errors- see the photos object for more information;
    3) NoItemsInOrder - The order has no photos associated with it, so cannot be submitted;
    4) PostalAddressNotSet - The postal address fields on the order were not properly set;
 */
@property (retain, nonatomic) NSArray *oGeneralErrors;

/**
 Array of PhotoErrorData objects containing any photos in the order which have errors or warnings.

 
 */
@property (retain, nonatomic) NSArray *oPhotos;


/**
 Return SubmissionData object.
 
 \param dict - NSDictionary object with spesified keys.
 
 <br>keys</br>
 - kID;
 - kIsValid;
 - kGeneralErrors;
 - kErrors;
 - kWarnings.
 */
+ (SubmissionData *)createObjectFromDictionary:(NSDictionary *)dict;

@end



@interface PhotoErrorData : NSObject

/**
 Id of the photo this error data relates to.
 */
@property (assign, nonatomic) int photoID;

/**
 Array of objects containing any errors associated with this photo. 

 - Possible photo error values:
 1) FileCouldNotBeDownloaded - You gave us a URL to download the image from. We could not download an image from the URL (we try multiple times);
 2) NoImageFile - You haven't given us a URL to download an image from, nor have you POSTed us an image, so we have no image for this photo;
 3) InvalidImagefile - We found an image- but it is not a valid jpg file;
 4) PostalAddressNotSet - The postal address fields on the order were not properly set;
 */
@property (retain, nonatomic) NSArray *photoErrors;

/**
 Array of objects containing any warnings associated with this photo. 
    - Possible photo error values:
        1) CroppingWillOccur - The image supplied does not match the aspect ratio of the photo size. We'll need to crop or resize it to fit it on the photo.
        2) PictureSizeTooSmall - The image supplied is below the recommended resolution for a photo of this size. 
            - Recommended resolutions (types):
            - kPhotoType4x6;
            - kPhotoType5x7;
            - kPhotoType6x6;
            - kPhotoType8x8;
            - kPhotoType8x10;
            - kPhotoType8x12;
            - kPhotoTypeP30x40;
            - kPhotoTypeP30x45;
            - kPhotoTypeP40x50;
        3) CouldNotValidateImageSize - You've supplied a photo with a URL, and submitted it before the photo has been downloaded. This means we can't yet see if the image size is above the recommended resolution for the size of photo.
        4) CouldNotValidateAspectRatio - You've supplied a photo with a URL, and submitted it before the photo has been downloaded. This means we can't yet see if the aspect ratio matches that of the chosen photo size.
 */
@property (retain, nonatomic) NSArray *photoWarnings;

/**
 Return PhotoErrorData object.
 
 \param dict - NSDictionary object with spesified keys.
 
 <br>keys</br>
 - kErrors;
 - kWarnings.
 */
+ (PhotoErrorData *)createObjectFromDictionary:(NSDictionary *)dict;

/**
 Return an array of PhotoErrorData objects.
 
 \param array - array of JSON strings.
 
 */
+ (NSArray *)createArrayOfObjectsFromArray:(NSArray *)array;
@end
