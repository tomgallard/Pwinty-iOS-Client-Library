//
//  Utils.m
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/27/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import "Utils.h"

@implementation Utils

//  used for compatibility with iOS versions prior to 5.0
+ (NSString *)buildJSONStringFromDictionary:(NSDictionary *)dict
{
    SBJSON *json = [[[SBJSON alloc] init] autorelease];
    NSError *error = nil;
    NSString *jsonStr;
    jsonStr = [json stringWithObject:dict error:&error];
    if (error == nil) return jsonStr;
    else return nil;
}

//  used for compatibility with iOS versions prior to 5.0
+ (id)buildObjectFromJSONString:(NSString *)jsonStr
{
    SBJSON *json = [[[SBJSON alloc] init] autorelease];
    NSError *error = nil;
    id jsonObj;
    jsonObj = [json objectWithString:jsonStr error:&error];
    if (error != nil) return nil;
    else return jsonObj;
}

+ (NSURL *)buildURLWithHOST:(NSString *)host andTail:(NSString *)tail
{
    NSString * path = [host stringByAppendingPathComponent:tail];
    NSURL *url = [NSURL URLWithString:path];
    return url;
}

+ (NSString *)buildRequestParamsString:(NSDictionary *)params
{
    NSArray *keys = [params allKeys];
    NSMutableString *paramsStr = [NSMutableString string];
    NSString *val;
    NSString *key;
    
    for (int i = 0; i < [keys count]; i++)
    {
        key = [keys objectAtIndex:i];    
        val = [params objectForKey:key];
        [paramsStr appendFormat:@"%@=%@", key, val];
        if (i != [keys count]-1)
        {
            [paramsStr appendString:@"&"];
        }
    }
    return paramsStr;
}

+ (NSURL *)buildGETRequestWithPath:(NSString *)path andParams:(NSDictionary *)params
{
    NSString *paramsStr = [self buildRequestParamsString:params];
    NSString *buildedPath;
    buildedPath = [NSString stringWithFormat:@"%@?%@", path, paramsStr];
    return [NSURL URLWithString:buildedPath];
}

+ (NSArray *)dictionaryToArray:(NSDictionary *)params
{
    NSArray *keys = [params allKeys];
    NSMutableArray *arr = [NSMutableArray array];
    NSString *val;
    NSString *key;
    
    for (int i = 0; i < [keys count]; i++)
    {
        key = [keys objectAtIndex:i];    
        val = [params objectForKey:key];
        [arr addObject:val];
    }
    return [NSArray arrayWithArray:arr];
}

+ (NSString *)getErrorTextFromObject:(id)object
{
    if ([object isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dict = (NSDictionary *)object;
        return [dict objectForKey:@"error"];
    }
    else return nil;
}

+ (BOOL)isFieldEmpty:(NSDictionary *)dict exceptions:(NSArray *)ex
{
    id obj;
    NSMutableArray *keys = [NSMutableArray arrayWithArray:[dict allKeys]];
    if (ex != nil)
    {
        [keys removeObjectsInArray:ex]; //remove optional fiels from validation
    }
    
    for (NSString *key in keys)
    {
        obj = [dict objectForKey:key];
        if ([obj isKindOfClass:[NSNull class]])
        {
            return YES; 
        }
    }
    return NO;
}

@end
