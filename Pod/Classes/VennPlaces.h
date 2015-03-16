//
//  VennPlaces.h
//  Pods
//
//  Created by Steven White on 3/7/15.
//

#import <Foundation/Foundation.h>

@interface VennPlaces : NSObject

/**
 * Sets up VennPlaces with provided API key
 *
 * @param key The API key used to authenticate requests
 */
+ (void) setupWithApiKey:(NSString *) key;

/**
 * Delivers shared VennPlaces client
 */
+ (instancetype) sharedPlaces;

/**
 * Performs search operation
 *
 * @param query Map of date to build search query for request
 */
- (void)searchWithQuery:(NSDictionary *) query andCallback:(void (^)(NSDictionary *, NSError *))cb;
@end
