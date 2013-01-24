//
//  RKMappingResult+QCFilteredResults.h
//  Osila
//
//  Created by Ryan Olson on 1/24/13.
//  Copyright (c) 2013 Ryan Olson. All rights reserved.
//

#import <RestKit/RestKit.h>

@interface RKMappingResult (QCFilteredResults)
-(NSArray *)filteredArrayWithClass:(Class)filteredClass;
@end
