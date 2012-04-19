//
//  Keys.h
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/27/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

/**
 Available request types.
 */
typedef enum {
    kTypeOrders,
    kTypeCreateOrder,
    kTypeOrderStatus,
    kTypeOredrSubmissionStatus,
    kTypePhotos,
    kTypeCreatePhoto
} requestType;

/**
 Pwinty uses custom HTTP headers for Authorization.
 All requests should include these two HTTP headers
*/
//TOKENS
extern NSString *const kMerchantID;
extern NSString *const kAPIKey;
//

//HOSTS
extern NSString *const kSandBoxHost;
extern NSString *const kLiveHost;
//

//HOST TAILS
extern NSString *const kOrdersHostTail;
extern NSString *const kOrdersStatusHostTail;
extern NSString *const kOrderSubmissionHostTail;
extern NSString *const kPhotosHostTail;
//

//Orders keys
extern NSString *const kID;
extern NSString *const kRecipientName;
extern NSString *const kAddress1;
extern NSString *const kAddress2;
extern NSString *const kAddressTownOrCity;
extern NSString *const kStateOrCountry;
extern NSString *const kPostalOrZipCode;
extern NSString *const kCountry;
extern NSString *const kStatus;
extern NSString *const kPhotos;
extern NSString *const kTextOnReverse;
//

//Order Statuses
extern NSString *const kOrderStatusNotYetSubmitted;
extern NSString *const kOrderStatusSubmitted;
extern NSString *const kOrderStatusComplete;
extern NSString *const kOrderStatusCancelled;
//

//Submission status keys
extern NSString *const kIsValid;
extern NSString *const kGeneralErrors;
extern NSString *const kErrors;
extern NSString *const kWarnings;
//

//Photo keys
extern NSString *const kOrderID;
extern NSString *const kPhotoType;
extern NSString *const kPhotoPath;
extern NSString *const kPhotoStatus;
extern NSString *const kPhotoCopies;
extern NSString *const kPhotoSizing;
extern NSString *const kPhotoFile;
extern NSString *const kphotoFileName;
//

//Photo statuses
extern NSString *const kPhotoStatusAwaitingUrlOrData;
extern NSString *const kPhotoStatusNotYetDownloaded;
extern NSString *const kPhotoStatusOk;
extern NSString *const kPhotoStatusFileNotFoundAtUrl;
extern NSString *const kPhotoStatusInvalid;
//

//Sizing options
extern NSString *const kSizingOptionCrop;
extern NSString *const kSizingOptionShrinkToFit;
extern NSString *const kSizingOptionShrinkToExactFit;
//

//Photo types
extern NSString *const kPhotoType4x6;
extern NSString *const kPhotoType5x7;
extern NSString *const kPhotoType6x6;
extern NSString *const kPhotoType8x8;
extern NSString *const kPhotoType8x10;
extern NSString *const kPhotoType8x12;
extern NSString *const kPhotoTypeP30x40;
extern NSString *const kPhotoTypeP30x45;
extern NSString *const kPhotoTypeP40x50;
//