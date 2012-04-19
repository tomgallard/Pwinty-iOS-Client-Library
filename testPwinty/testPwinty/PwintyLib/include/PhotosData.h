//
//  PhotosData.h
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/29/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

/**
 Object representing data about spesified Photo.
 */

@interface PhotosData : NSObject

/**
 Unique integer identifying the order id.
 */
@property (assign, nonatomic) int oID;

/**
 Unique integer identifying the photo.
 */
@property (assign, nonatomic) int photoID;

/**
 Number of copies of the photo to include in the order.
 */
@property (assign, nonatomic) int photoCopies;

/**
 Type of photo
 - Can be:
     1) kPhotoType4x6;
     2) kPhotoType5x7;
     3) kPhotoType6x6;
     4) kPhotoType8x8;
     5) kPhotoType8x10;
     6) kPhotoType8x12;
     7) kPhotoTypeP30x40;
     8) kPhotoTypeP30x45;
     9) kPhotoTypeP40x50;
*/
@property (retain, nonatomic) NSString *photoType;

/**
 If photo is to be downloaded by Pwinty, the photo's URL. (OPTIONAL)
 */
@property (retain, nonatomic) NSString *photoPath;

/**
 Current status of the photo.
 - Can be:
     1) kPhotoStatusAwaitingUrlOrData;
     2) kPhotoStatusNotYetDownloaded;
     3) kPhotoStatusOk;
     4) kPhotoStatusFileNotFoundAtUrl;
     5) kPhotoStatusInvalid;
 */
@property (retain, nonatomic) NSString *photoStatus;

/**
 How the image should be resized when printing.
 - Can be:
     1) kSizingOptionCrop;
     2) kSizingOptionShrinkToFit;
     3) kSizingOptionShrinkToExactFit;
 */
@property (retain, nonatomic) NSString *photoSizing;

/**
 Bynary data of the photo. Use only Jpg format. (OPTIONAL)
 
 \code
     UIImage *img = [UIImage imageNamed:@"somePic.png"];
     NSData *data = UIImageJPEGRepresentation(img, 1);
 \endcode
 */
@property (retain, nonatomic) NSData *photoFile;

/**
 Filename of the uploading photo. Use only for binary data uploading only. (OPTIONAL)
 */
@property (retain, nonatomic) NSString *photoFileName;


/**
  Return an array of PhotosData objects.
 */
+ (NSArray *)createArrayOfObjectsFromArray:(NSArray *)array;

/**
 Return PhotosData object create from dictionary.
 
 \param dict - NSDictionary object with spesified keys.
 */
+ (PhotosData *)createObjectFormDictionary:(NSDictionary *)dict;

/**
 Return NSDictionary object created from PhotosDataObject.
 */
+ (NSDictionary *)createDictionaryFromObject:(PhotosData *)pData;
@end
