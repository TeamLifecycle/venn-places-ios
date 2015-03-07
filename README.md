# venn-places-ios

## License

VennPlaces is available under the MIT license. See the LICENSE file for more info.

## Example

To run the example project (tests), clone the repo, and run `pod install` from the Example directory first.

## Installation

VennPlaces is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "VennPlaces"

## Usage

Include the `VennPlaces.h` header.

```objective-c
#import <VennPlaces.h>
```

Initialize the SDK with your API key.

```objective-c
[VennPlaces setupWithApiKey:@"myapikey"];
```

Request your places.

```objective-c

NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:@"chinese", @"keyword",
        @"food", @"category", nil];
[[VennPlaces sharedPlaces] searchWithQuery:query
        andCallback:^(NSURLResponse *res, NSData *data, NSError *err) {
    NSLog(@"%@", err);
    NSLog(@"%@", data);
}];
```
