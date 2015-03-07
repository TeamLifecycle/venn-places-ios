//
//  VennPlacesTests.m
//  VennPlacesTests
//
//  Created by Steven White on 03/07/2015.
//  Copyright (c) 2014 Steven White. All rights reserved.
//

#import <VennPlaces/VennPlaces.h>
SPEC_BEGIN(InitialTests)

describe(@"VennPlaces", ^{
    context(@"API", ^{
        beforeAll(^{
            [VennPlaces setupWithApiKey:@"fookey"];
        });
        
        it(@"should perform a search", ^{
            NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:@"chinese", @"keyword", @"food", @"category", nil];
            [[VennPlaces sharedPlaces] searchWithQuery:query andCallback:^(NSURLResponse *res, NSData *data, NSError *err) {
                NSLog(@"%@", err);
                NSLog(@"%@", data);
            }];
        });
    });
});

SPEC_END
