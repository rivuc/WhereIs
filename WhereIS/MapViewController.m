//
//  MapViewController.m
//  WhereIS
//
//  Created by Francisco Rivera Uc on 05/09/13.
//  Copyright (c) 2013 Francisco Rivera Uc. All rights reserved.
//

#import "MapViewController.h"
#import "AFHTTPRequestOperationManager.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  //  self.theMap = [[MKMapView alloc] init];
    self.theMap.delegate = self;
    self.theMap.scrollEnabled = YES;
    self.theMap.zoomEnabled = NO;
    self.theMap.showsUserLocation = YES;
    
    double regionWidth = 2200;
    double regionHeight = 2500;
    
    
    CLLocationCoordinate2D userLoc;
    CLLocationManager *locationManager = [[CLLocationManager alloc]init];
	userLoc.latitude =  locationManager.location.coordinate.latitude; //self.theMap.userLocation.location.coordinate.latitude;
	userLoc.longitude = locationManager.location.coordinate.longitude; //self.theMap.userLocation.location.coordinate.longitude;
    MKCoordinateRegion startRegion  = MKCoordinateRegionMakeWithDistance(userLoc, regionWidth, regionHeight);
    
    [self.theMap setRegion:startRegion animated:YES];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(foundTap:)];
    
    tapRecognizer.numberOfTapsRequired = 1;
    
    tapRecognizer.numberOfTouchesRequired = 1;
    
    [self.theMap addGestureRecognizer:tapRecognizer];

    [self SaveCoordinates];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)foundTap:(UITapGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer locationInView:self.theMap];
    CLLocationCoordinate2D tapCoordinate = [self.theMap convertPoint:point
                                                toCoordinateFromView:self.view];
    
    NSLog(@"%@ : %f, %f", [[UIDevice currentDevice] name], tapCoordinate.latitude, tapCoordinate.longitude);
}

#pragma mark request
-(void) SaveCoordinates
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"user": @"fmru", @"userDesc":@"Francisco", @"latitude":@"1", @"longitude":@"2", @"key":@"", @"comment":@"Sin comentarios", @"expire":@"1000000"};
    
    [manager POST:@"http:/localhost:5000/SaveCoordinate"
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}



@end
