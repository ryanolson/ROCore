//
//  NSDictionary+ROJSON.m
//  SplitIt!
//
//  Created by Ryan Olson on 8/5/12.
//
//

#import "NSDictionary+ROJSON.h"

@implementation NSDictionary (ROJSON)

+(NSDictionary *)dictionaryWithContentsOfJSONURLString:(NSString *)jsonString
{
    NSError * error = nil;
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
}

@end
