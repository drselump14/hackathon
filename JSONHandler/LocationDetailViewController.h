//
//  LocationDetailViewController.h
//  JSONHandler
//
//  Created by Phillipus on 28/10/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import <MapKit/MapKit.h>
#import "CoreLocationController.h"


@interface LocationDetailViewController : UIViewController<MKMapViewDelegate>

@property (weak, nonatomic) Location *location;
//@property (weak, nonatomic) IBOutlet UILabel *lblLongitude;
//@property (weak, nonatomic) IBOutlet UILabel *lblLatitude;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (nonatomic, retain) CoreLocationController *locationController;
@property (nonatomic, retain) NSNumber *loclatitude;
@property (nonatomic, retain) NSNumber *loclongitude;

-(IBAction)openMap:(id)sender;


@end
