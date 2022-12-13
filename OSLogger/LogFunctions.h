////
////  LogFunctions.h
////  OSLogger
////
////  Created by Alexander Solis on 7/19/19.
////  Copyright © 2019 Mellontec. All rights reserved.
////

/*
 The idea behind this file is to bring consistency across the app when generating log messages.
 This file is specifically intended for Objective-C code, there is another file that implements
 global functions for Swift.
 
 IMPORTANT: If Cocoalumberjack is changed with another adapter, the macro implementation must change
 to incorporate the new adapter. The advantage is that once the change is in this file,
 it will affect every log across the app.
 **/

#ifndef LogFunctions_h
#define LogFunctions_h

#define OSLogError(text, ...) [[OSLoggerContainer shared] error:[NSString stringWithFormat:(text), ##__VA_ARGS__]];
#define OSLogWarn(text, ...) [[OSLoggerContainer shared] warn:[NSString stringWithFormat:(text), ##__VA_ARGS__]];
#define OSLogInfo(text, ...) [[OSLoggerContainer shared] info:[NSString stringWithFormat:(text), ##__VA_ARGS__]];
#define OSLogDebug(text, ...) [[OSLoggerContainer shared] debug:[NSString stringWithFormat:(text), ##__VA_ARGS__]];
#define OSLogVerbose(text, ...) [[OSLoggerContainer shared] verbose:[NSString stringWithFormat:(text), ##__VA_ARGS__]];

#endif /* LogFunctions_h */
