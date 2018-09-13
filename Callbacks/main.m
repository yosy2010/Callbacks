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
        
        // create a loggor
        BNRLogger *logger = [[BNRLogger alloc] init];
        
        // create a timer and call " " on it so that it update every 2 seconds
        __unused NSTimer *timer = [NSTimer
                          scheduledTimerWithTimeInterval:2.0
                          target:logger
                          selector:@selector(updateLastTime:)
                          userInfo:nil repeats:YES];
        
        
        // run until an event happen
        [[NSRunLoop currentRunLoop] run];
        
    }
    return 0;
}
