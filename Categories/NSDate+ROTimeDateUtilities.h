//
//  NSDate+ROTimeDateUtilities.h
//  Osila
//
//  Created by Ryan Olson on 12/26/12.
//  Copyright (c) 2012 Ryan Olson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ROTimeDateUtilities)

// rounding dates to next nearest unit of X minutes
// http://stackoverflow.com/questions/1149256/round-nsdate-to-the-nearest-5-minutes

-(NSDate *)roundedUpToNearestMinuteInterval:(NSInteger)minuteInterval;

@end
