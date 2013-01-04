//
//  ROSingleton.h
//  Osila
//
//  Created by Ryan Olson on 1/1/13.
//  Copyright (c) 2013 Ryan Olson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ROSingleton : NSObject
+(id) sharedInstance;
+(void) setSharedInstance:(id)newSharedInstance;
@end
