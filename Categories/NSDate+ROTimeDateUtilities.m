//
//  NSDate+ROTimeDateUtilities.m
//  Osila
//
//  Created by Ryan Olson on 12/26/12.
//  Copyright (c) 2012 Ryan Olson. All rights reserved.
//

#import "NSDate+ROTimeDateUtilities.h"

@implementation NSDate (ROTimeDateUtilities)

-(NSDate *)roundedUpToNearestMinuteInterval:(NSInteger)minuteInterval
{
    NSDateComponents *time = [[NSCalendar currentCalendar] components:(NSHourCalendarUnit|NSMinuteCalendarUnit) fromDate:self];
    NSInteger minutes = [time minute];
    NSInteger remain = minutes % minuteInterval;
    return [self dateByAddingTimeInterval:60*(minuteInterval-remain)];
}

@end
