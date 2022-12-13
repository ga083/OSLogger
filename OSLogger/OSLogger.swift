//
//  OSLogger.swift
//  OSLogger
//
//  Created by Alexander Solis on 7/18/19.
//  Copyright © 2019 Mellontec. All rights reserved.
//

import Foundation

@objc public enum LogLevel: UInt {
    case error = 1, warning, info, debug, verbose
}

@objc public protocol OSLogger {
    func error(_ message: String)
    func warn(_ message: String)
    func info(_ message: String)
    func debug(_ message: String)
    func verbose(_ message: String)
    
    init(userInfo: [String: String]?)
    
    @objc optional func getLogFiles() -> [URL]
}
