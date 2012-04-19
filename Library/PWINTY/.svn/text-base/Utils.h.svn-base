//
//  Utils.h
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/27/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import "SBJSON.h"

@interface Utils : NSObject

+ (NSString *)buildJSONStringFromDictionary:(NSDictionary *)dict;
+ (id)buildObjectFromJSONString:(NSString *)jsonStr;
+ (NSURL *)buildURLWithHOST:(NSString *)host andTail:(NSString *)tail;
+ (NSURL *)buildGETRequestWithPath:(NSString *)path andParams:(NSDictionary *)params;
+ (NSString *)buildRequestParamsString:(NSDictionary *)params;
+ (NSArray *)dictionaryToArray:(NSDictionary *)params;
+ (NSString *)getErrorTextFromObject:(id)object;
+ (BOOL)isFieldEmpty:(NSDictionary *)dict exceptions:(NSArray *)ex;
@end
