//
//  Keys.m
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/27/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import "PwintyKeys.h"

//TOKENS
NSString *const kMerchantID = @"X-Pwinty-MerchantId";
NSString *const kAPIKey = @"X-Pwinty-REST-API-Key";
//

//HOSTS
NSString *const kSandBoxHost = @"https://sandbox.pwinty.com";
NSString *const kLiveHost = @"https://api.pwinty.com";
//

//HOST TAILS
NSString *const kOrdersHostTail= @"Orders";
NSString *const kOrdersStatusHostTail = @"Orders/status";
NSString *const kOrderSubmissionHostTail = @"Orders/SubmissionStatus";
NSString *const kPhotosHostTail = @"Photos";
//

NSString *const kID = @"id";
NSString *const kStatus = @"status";

//Orders JSON keys
NSString *const kRecipientName = @"recipientName";
NSString *const kAddress1 = @"address1";
NSString *const kAddress2 = @"address2";
NSString *const kAddressTownOrCity = @"addressTownOrCity";
NSString *const kStateOrCountry = @"stateOrCounty";
NSString *const kPostalOrZipCode = @"postalOrZipCode";
NSString *const kCountry = @"country";
NSString *const kPhotos = @"photos";
NSString *const kTextOnReverse = @"textOnReverse";
//

//Order Statuses
NSString *const kOrderStatusNotYetSubmitted = @"NotYetSubmitted";
NSString *const kOrderStatusSubmitted = @"Submitted";
NSString *const kOrderStatusComplete = @"Complete";
NSString *const kOrderStatusCancelled = @"Cancelled";
//

//Submission status keys
NSString *const kIsValid = @"isValid";
NSString *const kGeneralErrors = @"generalErrors";
NSString *const kErrors = @"errors";
NSString *const kWarnings = @"warnings";
//

//Photo keys
NSString *const kOrderID = @"orderId";
NSString *const kPhotoType = @"type";
NSString *const kPhotoPath = @"url";
NSString *const kPhotoCopies = @"copies";
NSString *const kPhotoSizing = @"sizing";
NSString *const kPhotoFile = @"file";
NSString *const kphotoFileName = @"fileName";
//

//Photo statuses
NSString *const kPhotoStatusAwaitingUrlOrData = @"AwaitingUrlOrData";
NSString *const kPhotoStatusNotYetDownloaded = @"NotYetDownloaded";
NSString *const kPhotoStatusOk = @"Ok";
NSString *const kPhotoStatusFileNotFoundAtUrl = @"FileNotFoundAtUrl";
NSString *const kPhotoStatusInvalid = @"Invalid";
//

//Sizing options
NSString *const kSizingOptionCrop = @"Crop";
NSString *const kSizingOptionShrinkToFit = @"ShrinkToFit";
NSString *const kSizingOptionShrinkToExactFit = @"ShrinkToExactFit";
//

//Photo types
NSString *const kPhotoType4x6 = @"4x6";
NSString *const kPhotoType5x7 = @"5x7";
NSString *const kPhotoType6x6 = @"6x6";
NSString *const kPhotoType8x8 = @"8x8";
NSString *const kPhotoType8x10 = @"8x10";
NSString *const kPhotoType8x12 = @"8x12";
NSString *const kPhotoTypeP30x40 = @"P30x40";
NSString *const kPhotoTypeP30x45 = @"P30x45";
NSString *const kPhotoTypeP40x50 = @"P40x50";
//