//
//  ViewController.m
//  PlacesTest
//
//  Created by Steven White on 3/7/15.
//  Copyright (c) 2015 Strap. All rights reserved.
//

#import "ViewController.h"
#import <VennPlaces/VennPlaces.h>

@interface ViewController ()

@end

@implementation ViewController {
    NSArray *places;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:@"chinese", @"keyword",
                           @"cincinnati oh 45202", @"address", nil];
    
    [[VennPlaces sharedPlaces] searchWithQuery:query andCallback:^(NSDictionary *data, NSError *e) {
        places = [data valueForKeyPath:@"places"];
        [self.table reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [places count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *place = (NSDictionary *)[places objectAtIndex:indexPath.row];
    NSString *name = [place objectForKey:@"name"];
    NSLog(@"have name: %@", name);
    
    // Get Cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"places"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"places"];
    }
    
    cell.textLabel.text = name;
    return cell;
}

@end
