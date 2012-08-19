//
//  NSDictionary+ROJSON.h
//  SplitIt!
//
//  Created by Ryan Olson on 8/5/12.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ROJSON)

+(NSDictionary*)dictionaryWithContentsOfJSONURLString:(NSString*)jsonString;

@end
