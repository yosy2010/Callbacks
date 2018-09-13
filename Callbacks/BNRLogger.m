//
//  BNRLogger.m
//  Callbacks
//
//  Created by YASSER ALTAMIMI on 03/01/1440 AH.
//  Copyright © 1440 YASSER ALTAMIMI. All rights reserved.
//

#import "BNRLogger.h"

@interface BNRLogger ()

-(void)zoneChanged: (NSNotification *)notification;

@end

@implementation BNRLogger

// instance merthods
- (void)zoneChanged:(NSNotification *)notification
{
    NSLog(@"the system time zone has changed");
}

// protocol methods:

// called every time data arrive
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    // log how many byte were recived
    NSLog(@"recived %lu bytes", [data length]);
    
    // create a mutable data if it doesn't already exist
    if (!_incomingData) {
        _incomingData = [[NSMutableData alloc] init];
    }
    
    // append the data to the data object
    [_incomingData appendData:data];
    
}

// called when the last chounk of data has processed
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
   
    // log that all data were recived
    NSLog(@"got it all");
    
    // put it all into a string
    NSString *string = [[NSString alloc] initWithData:_incomingData encoding:NSUTF8StringEncoding];
    
    // empty the mutableData object after we have all the data in the string
    _incomingData = nil;
    
    // log how many characters the string has
    NSLog(@"string has %lu characters", [string length]);
    
    // see the entire fetched file, comment next line because it might be a long line
//    NSLog(@"the whole string is: %@", string);
    
}

// called if the fetch failed
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
    // log the error message
    NSLog(@"connection failed %@", [error localizedDescription]);
    
    // empty the mutableData object after the failure in connection
    
}

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
