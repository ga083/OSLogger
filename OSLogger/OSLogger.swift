//
//  OSLogger.swift
//  OSLogger
//
//  Created by Alexander Solis on 7/18/19.
//  Copyright © 2019 Mellontec. All rights reserved.
//

import Foundation

@objc enum LogLevel: UInt {
    case error = 1, warning, info, debug, verbose
}

@objc protocol OSLogger {
    static func error(_ message: String)
    static func warn(_ message: String)
    static func info(_ message: String)
    static func debug(_ message: String)
    static func verbose(_ message: String)
    
    init(logLevel: LogLevel)
    
    func startConsoleLogger()
    func startFileLogger()
    
    func getLogFiles() -> [URL]
}
