//
//  ROSingleton.m
//  Osila
//
//  Created by Ryan Olson on 1/1/13.
//  Copyright (c) 2013 Ryan Olson. All rights reserved.
//

#import "ROSingleton.h"

@implementation ROSingleton

static id singleton = nil;

+(id)sharedInstance {
    if (nil == singleton) {
        singleton = [[ROSingleton alloc] init];
    };
    return singleton;
}

+(void)setSharedInstance:(id)newSharedInstance
{
    singleton = newSharedInstance;
}

- (id)init
{
    if (self = [super init]) {
        // Work your initialising magic here as you normally would
    }
    return self;
}

@end
