//
//  LocationsViewController.m
//  JSONHandler
//
//  Created by Phillipus on 28/10/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import "LocationsViewController.h"
#import "LocationDetailViewController.h"
#import "Location.h"
#import "JSONLoader.h"

@implementation LocationsViewController {
    NSArray *_locations;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create a new JSONLoader with a local file URL
    JSONLoader *jsonLoader = [[JSONLoader alloc] init];
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"locations" withExtension:@"json"];
    NSURL *url = [NSURL URLWithString:@"http://yokosuka-opendata.ubin.jp/dataset/2eb99d86-3352-4f3f-a6fc-39d3d20d08d0/resource/7ddac289-fcb1-4cbd-a14c-4b6759b89020/download/2010.4.geojson"];

    // Load the data on a background queue...
    // As we are using a local file it's not really necessary, but if we were connecting to an online URL then we'd need it
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *loc = [jsonLoader locationsFromJSONFile:url];
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"distance" ascending:YES];
        _locations = [loc sortedArrayUsingDescriptors:@[sortDescriptor]];
//        _locations = [jsonLoader locationsFromJSONFile:url];
        // Now that we have the data, reload the table data on the main UI thread
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    });
}

// Just before showing the LocationDetailViewController, set the selected Location object
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    LocationDetailViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    vc.location = [_locations objectAtIndex:indexPath.row];
}


#pragma mark - Table View Controller Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LocationCell"];
    
    Location *location = [_locations objectAtIndex:indexPath.row];
    
    cell.textLabel.text = location.title;
    cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"%.2f km", location.distance/1000];
//    cell.detailTextLabel.text = location.place;
    cell.imageView.image = [UIImage imageNamed:@"location.png"];
    NSLog(@"lat: %@ & long: %@",location.latitude, location.longitude);
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_locations count];
}

@end
