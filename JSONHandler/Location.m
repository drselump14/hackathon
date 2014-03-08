//
//  Location.m
//  JSONHandler
//
//  Created by Phillipus on 28/10/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import "Location.h"

@implementation Location

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
//    NSDictionary *geometry;
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
//        _title = [jsonDictionary objectForKey:@"title"];
//        _place = [jsonDictionary objectForKey:@"place"];
//        _information = [jsonDictionary objectForKey:@"information"];
//        _telephone = [jsonDictionary objectForKey:@"telephone"];
        NSDictionary *properties = [jsonDictionary objectForKey:@"properties"];
        _title = [properties objectForKey:@"ITEM003"];
        _place = [properties objectForKey:@"ITEM008"];
        NSDictionary *geometry = [jsonDictionary objectForKey:@"geometry"];
        NSArray *coordinates = [[NSArray alloc] initWithArray:[geometry objectForKey:@"coordinates"]];
//        NSLog(@"ini koordinat = %@", coordinates);
        _longitude = coordinates[0];
        _latitude = coordinates[1];
        
        //Calculate Distance
        CLLocation *loc1 = [[CLLocation alloc] initWithLatitude: 35.223893 longitude:139.673944];
        CLLocation *loc2 = [[CLLocation alloc] initWithLatitude: [self.latitude doubleValue]longitude: [self.longitude doubleValue]];
        
        CLLocationDistance distance = [loc1 distanceFromLocation:loc2];
        _distance = distance;
//        _url = [jsonDictionary objectForKey:@"url"];
//        _visited = [jsonDictionary objectForKey:@"visited"];
    }
    
    return self;
}

@end
