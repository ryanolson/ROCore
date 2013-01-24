
#ifndef __ROCORE__
#define __ROCORE__

#import "MKMapView+ZoomLevel.h"
#import "NSDictionary+ROJSON.h"
#import "UIButton+ROColoredButton.h"
#import "NSDate+ROTimeDateUtilities.h"
#import "UIStoryboardSegue+TopLevelNavigationView.h"
#import "UIColor+ROColors.h"
#import "RKMappingResult+QCFilteredResults.h"

#define UIColorFromHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
                                                 green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
                                                  blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]
#endif
