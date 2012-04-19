//
//  Loader.h
//  PWINTY
//
//  Created by Chinara Kuzekeeva on 3/27/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol LoaderProtocol <NSObject>
@optional
- (void)loadingDidFinishWithResult:(id)result andLoader:(id)loader;
- (void)loadingDidFinishWithError:(NSString *)error;
@end

@interface Loader : NSObject {
    int loaderTag;
    id<LoaderProtocol>target;
    NSMutableData *receivedData;
}
@property (nonatomic) int loaderTag;

+ (Loader *)loadWithRequest:(NSMutableURLRequest *)request delegate:(id<LoaderProtocol>)delegate;

@end
