# venn-places-ios

## License

VennPlaces is available under the MIT license. See the LICENSE file for more info.

## Example

To run the example project, clone the repo, and run `pod install` from the PlacesTest directory first.

## Installation

VennPlaces is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "VennPlaces"


## Contributing

First, initialize the test project with the VennPlaces pod.

```
cd PlacesTest
pod update
```

Open `PlacesTest/VennPlaces.xcworkspace` in xcode.

See [http://guides.cocoapods.org/making/making-a-cocoapod.html](http://guides.cocoapods.org/making/making-a-cocoapod.html) for details.

## Usage

Include the `VennPlaces.h` header.

```objective-c
#import <VennPlaces.h>
```

Initialize the shared SDK with your API key.

```objective-c
[VennPlaces setupWithApiKey:@"myapikey"];
```

Request your places.

```objective-c

    NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:@"chinese", @"keyword",
           @"cincinnati oh 45202", @"address", nil];

[[VennPlaces sharedPlaces] searchWithQuery:query
        andCallback:^(NSDictionary *data, NSError *err) {
    NSLog(@"%@", err);
    NSLog(@"%@", data);
}];
```
