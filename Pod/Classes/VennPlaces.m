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

- (void)searchWithQuery:(NSDictionary *)search andCallback:(void (^)(NSURLResponse *, NSData *, NSError *))cb {
    NSString *urlString = self.baseUrl;
    BOOL first = YES;
    if ([search count] > 0) {
        for (NSString *key in search) {
            urlString = [urlString stringByAppendingFormat:@"&%@=%@", key, search[key]];
            first = NO;
        }
    }
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:cb];
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