//
//  main.m
//  Callbacks
//
//  Created by YASSER ALTAMIMI on 03/01/1440 AH.
//  Copyright © 1440 YASSER ALTAMIMI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /////////////////////////////////////////////////////////////////////////
        // TARGET-ACTION callback
        
        // create a loggor
        BNRLogger *logger = [[BNRLogger alloc] init];
        
        // create a timer and call " " on it so that it update every 2 seconds
        // commented so we can check the next example
//        __unused NSTimer *timer = [NSTimer
//                          scheduledTimerWithTimeInterval:2.0
//                          target:logger
//                          selector:@selector(updateLastTime:)
//                          userInfo:nil repeats:YES];
        
        //////////////////////////////////////////////////////////
        // HELPER OBJECTB callback + notification
        
//        - (void)zoneChanged:(NSNotification *)notification
//        {
//            NSLog(@"the system time zone has changed");
//        }
        
//        [[NSNotificationCenter defaultCenter]addObserver:logger selector:@selector(zoneChanged:) name:NSSystemTimeZoneDidChangeNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:NSSystemTimeZoneDidChangeNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            NSLog(@"the system time zone has changed");
        }];
        
        // create a url
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        
        // // create a request
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request delegate:logger startImmediately:YES];
        
        
        // run until an event happen
        [[NSRunLoop currentRunLoop] run];
        
    }
    return 0;
}
