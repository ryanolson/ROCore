//
//  UIStoryboardSegue+TopLevelNavigationView.m
//  Osila
//
//  Created by Ryan Olson on 1/5/13.
//  Copyright (c) 2013 Ryan Olson. All rights reserved.
//

#import "UIStoryboardSegue+TopLevelNavigationView.h"

@implementation UIStoryboardSegue (TopLevelNavigationView)
- (id)topLevelDestinationViewController
{
    id dest = self.destinationViewController;
    if ([dest isKindOfClass:[UINavigationController class]]) {
        UINavigationController* nav = dest;
        dest = nav.topViewController;
    }
    return dest;
}
@end
