//
//  VennPlaces.m
//  Pods
//
//  Created by Steven White on 3/7/15.
//
//

#import "VennPlaces.h"
#import "Constants.h"

static VennPlaces *_sharedInstance = nil;

@interface VennPlaces()

@property (nonatomic, copy, readwrite) NSString *apiKey;
@property (nonatomic, copy, readwrite) NSString *baseUrl;

@end

@implementation VennPlaces

+ (instancetype)sharedPlaces {
    return _sharedInstance;
}

+ (void)setupWithApiKey:(NSString *)key {
    if (_sharedInstance == nil) {
        _sharedInstance = [[self alloc] initWithApiKey:key];
    }
}

- (void)searchWithQuery:(NSDictionary *)search andCallback:(void (^)(NSDictionary *, NSError *))cb {
    NSString *urlString = self.baseUrl;
    BOOL first = YES;
    if ([search count] > 0) {
        for (NSString *key in search) {
            urlString = [urlString stringByAppendingFormat:@"&%@=%@", key, [search[key] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            first = NO;
        }
    }
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *res, NSData *data, NSError *err){
                               if (err) {
                                   cb(nil, err);
                                   return;
                               }
                               
                               NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                               cb(dict, err);
                           }];
}

-(id) initWithApiKey:(NSString *)key {
    self = [super init];
    if (self) {
        self.apiKey = key;
        self.baseUrl = [NSString stringWithFormat:@"%@?key=%@", kVennSearchUri, key];
    }
    return self;
}

@end