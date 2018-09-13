//
//  BNRLogger.h
//  Callbacks
//
//  Created by YASSER ALTAMIMI on 03/01/1440 AH.
//  Copyright © 1440 YASSER ALTAMIMI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRLogger : NSObject
    <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

// instance methods
{
    NSMutableData *_incomingData;
}

// properties
@property (nonatomic) NSDate *lastTime;

// mehods
-(NSString *)lastTimeString;
-(void)updateLastTime: (NSTimer *) timer;

@end

NS_ASSUME_NONNULL_END
