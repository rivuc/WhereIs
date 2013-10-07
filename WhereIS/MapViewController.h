//
//  MapViewController.h
//  WhereIS
//
//  Created by Francisco Rivera Uc on 05/09/13.
//  Copyright (c) 2013 Francisco Rivera Uc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *theMap;


@end
