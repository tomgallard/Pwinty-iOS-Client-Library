//
//  Loader.m
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/27/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import "Loader.h"


@implementation Loader
@synthesize loaderTag;

- (id)initWithRequest:(NSURLRequest *)request delegate:(id<LoaderProtocol>)delegate
{
    self = [super init];
    if (self) {
        [self retain];
        target = delegate;
        receivedData = [[NSMutableData alloc] init];
        [NSURLConnection connectionWithRequest:request delegate:self];
    }
    return self;
}

+ (Loader *)loadWithRequest:(NSMutableURLRequest *)request delegate:(id<LoaderProtocol>)delegate
{
    Loader *loader = [[Loader alloc] initWithRequest:request delegate:delegate];
    return [loader autorelease];
}

- (void)dealloc
{
    [receivedData release];
    [super dealloc];
}

#pragma mark - NSURLConnectionDelegates

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSString *errorDesc = [error localizedDescription];
    [receivedData setLength:0];
    NSLog(@"error: %@", error);
    if([target respondsToSelector:@selector(loadingDidFinishWithError:)])[target loadingDidFinishWithError:errorDesc];
    [self autorelease];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if([target respondsToSelector:@selector(loadingDidFinishWithResult:andLoader:)])[target loadingDidFinishWithResult:receivedData andLoader:self];
    [receivedData setLength:0];
    [self autorelease];
}

- (BOOL)connectionShouldUseCredentialStorage:(NSURLConnection *)connection
{
    return YES;
}

@end
