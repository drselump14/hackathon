//
//  MainViewController.h
//  JSONHandler
//
//  Created by Slamet Kristanto on 08/03/2014.
//  Copyright (c) 2014 Dada Beatnik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *list;
@property (weak, nonatomic) IBOutlet UIButton *kunren;

-(IBAction)openMap:(id)sender;
@end
