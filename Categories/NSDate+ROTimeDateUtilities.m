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
    NSDateComponents *time = [[NSCalendar currentCalendar] components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit |  NSHourCalendarUnit |NSMinuteCalendarUnit) fromDate:self];
    [time setSecond:0];
    NSInteger minutes = [time minute];
    NSInteger remain = minutes % minuteInterval;
    NSDate * roundedDate = [[NSCalendar currentCalendar] dateFromComponents:time];
    return [roundedDate dateByAddingTimeInterval:60*(minuteInterval-remain)];
}

@end
