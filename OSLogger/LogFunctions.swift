//
//  LogFunctions.swift
//  OSLogger
//
//  Created by Alexander Solis on 7/18/19.
//  Copyright © 2019 Mellontec. All rights reserved.
//

/*
 The idea behind this file is to bring consistency across the app when generating log messages.
 This file is specifically intended for Swift code, there is another file that implements similar
 Macros that is used in Objective-C.
 
 IMPORTANT: If Cocoalumberjack is changed with another adapter, the global function implementation
 must change to incorporate the new adapter. The advantage is that once the change is in this file,
 it will affect every log across the app.
 **/

func CPLogError(_ message: String) {
    CocoaLumberjackAdapter.error(message)
}

func CPLogWarn(_ message: String) {
    CocoaLumberjackAdapter.warn(message)
}

func CPLogInfo(_ message: String) {
    CocoaLumberjackAdapter.info(message)
}

func CPLogDebug(_ message: String) {
    CocoaLumberjackAdapter.debug(message)
}

func CPLogVerbose(_ message: String) {
    CocoaLumberjackAdapter.verbose(message)
}
