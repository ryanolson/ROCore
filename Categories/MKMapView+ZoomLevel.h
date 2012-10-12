//
//  MKMapView+ZoomLevel.h
//  WhatsBrewing
//
//  Created by Ryan Olson on 10/11/12.
//
//

#import <MapKit/MapKit.h>

@interface MKMapView (ZoomLevel)
- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
                  zoomLevel:(NSUInteger)zoomLevel
                   animated:(BOOL)animated;

@end
