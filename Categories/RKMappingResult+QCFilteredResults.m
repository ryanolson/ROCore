//
//  RKMappingResult+QCFilteredResults.m
//  Osila
//
//  Created by Ryan Olson on 1/24/13.
//  Copyright (c) 2013 Ryan Olson. All rights reserved.
//

#import "RKMappingResult+QCFilteredResults.h"

@implementation RKMappingResult (QCFilteredResults)
-(NSArray *)filteredArrayWithClass:(Class)filteredClass
{
    NSMutableArray * filteredArray = [NSMutableArray array];
    for (id obj in self.array) {
        if ([obj isKindOfClass:filteredClass]) {
            [filteredArray addObject:obj];
        }
    }
    return filteredArray;
}
@end
