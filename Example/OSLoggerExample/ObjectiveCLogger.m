//
//  ObjectiveCLogger.m
//  OSLoggerExample
//
//  Created by Alexander Solis on 7/22/19.
//  Copyright © 2019 Mellontec. All rights reserved.
//

#import "ObjectiveCLogger.h"
@import OSLogger;

@implementation ObjectiveCLogger
- (void)logSomething {
    OSLogInfo(@"This is a log from Objective-C code")
}
@end
