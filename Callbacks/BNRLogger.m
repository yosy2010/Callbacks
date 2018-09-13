//
//  BNRLogger.m
//  Callbacks
//
//  Created by YASSER ALTAMIMI on 03/01/1440 AH.
//  Copyright © 1440 YASSER ALTAMIMI. All rights reserved.
//

#import "BNRLogger.h"



@implementation BNRLogger

// create a string for the lastTime string to be log
- (NSString *)lastTimeString
{
    
    // create a static date formatter
    static NSDateFormatter *formatter = nil;
    
    // check if it's not created already, then create one and set its values to medium style
    if (!formatter) {
        
        // init it
        formatter = [[NSDateFormatter alloc] init];
        
        // set its values to medium style
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterMediumStyle];
        
        // log that it is created already
        NSLog(@"formatter created");
    }
    
    // get last time from the object
    NSDate *lastTime = [self lastTime];
    
    // return it with the time string
    return [formatter stringFromDate:lastTime];
    
}

//
- (void)updateLastTime:(NSTimer *)timer
{
    // create NSDate object for the time now
    NSDate *now = [NSDate date];
    
    // set the last time NSDate object to the time now
    [self setLastTime:now];
    
    // get the string of the time and log it
    NSString *lastTimeString = [self lastTimeString];
    NSLog(@"just set the time to %@", lastTimeString);
    
}


@end
