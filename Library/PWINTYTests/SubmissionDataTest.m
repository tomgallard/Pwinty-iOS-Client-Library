//
//  SubmissionDataTest.m
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 4/2/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import "SubmissionDataTest.h"
#import "SBJSON.h"
#import "SubmissionData.h"

@implementation SubmissionDataTest

- (void)testValidSubmissionData
{
    NSString *jsonStr = [NSString stringWithString:@"{\"id\":129,\"isValid\":false,\"photos\":[{\"id\":171,\"errors\":[\"FileCouldNotBeDownloaded\"],\"warnings\":[\"CouldNotValidateImageSize\",\"CouldNotValidateAspectRatio\"]}],\"generalErrors\":[]}"]; //Valid JSON string
    SBJSON *json = [[[SBJSON alloc] init] autorelease];
    
    NSDictionary *jsonDict = [json objectWithString:jsonStr];
    SubmissionData *sData = [SubmissionData createObjectFromDictionary:jsonDict];
    STAssertNotNil(sData, @"Submission data creation error!");
}

- (void)testInvalidSubmissionData
{
    NSString *emptyIDStr = [NSString stringWithString:@"{\"id\":null,\"isValid\":false,\"photos\":[{\"id\":171,\"errors\":[\"FileCouldNotBeDownloaded\"],\"warnings\":[\"CouldNotValidateImageSize\",\"CouldNotValidateAspectRatio\"]}],\"generalErrors\":[]}"]; //invalid JSON string
    NSString *emptyIsValidStr = [NSString stringWithString:@"{\"id\":129,\"isValid\":null,\"photos\":[{\"id\":171,\"errors\":[\"FileCouldNotBeDownloaded\"],\"warnings\":[\"CouldNotValidateImageSize\",\"CouldNotValidateAspectRatio\"]}],\"generalErrors\":[]}"]; //invalid JSON string
    NSArray *strs = [NSArray arrayWithObjects:emptyIDStr, emptyIsValidStr, nil];
    SBJSON *json = [[[SBJSON alloc] init] autorelease];
    NSDictionary *jsonDict = nil;
    SubmissionData *sData = nil;
    for (NSString *str in strs)
    {
        jsonDict = [json objectWithString:str];
        sData = [SubmissionData createObjectFromDictionary:jsonDict];
        STAssertNil(sData, @"Submission data creation error!");
    }
}


@end
