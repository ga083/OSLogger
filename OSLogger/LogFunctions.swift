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

import Foundation

public func OSLogError(_ message: String) {
    OSLoggerContainer.shared.error(message)
}

public func OSLogWarn(_ message: String) {
    OSLoggerContainer.shared.warn(message)
}

public func OSLogInfo(_ message: String) {
    OSLoggerContainer.shared.info(message)
}

public func OSLogDebug(_ message: String) {
    OSLoggerContainer.shared.debug(message)
}

public func OSLogVerbose(_ message: String) {
    OSLoggerContainer.shared.verbose(message)
}
