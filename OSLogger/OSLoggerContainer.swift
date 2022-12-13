//
//  OSLoggers.swift
//  OSLogger
//
//  Created by Alexander Solis on 8/12/22.
//  Copyright © 2022 Mellontec. All rights reserved.
//

import UIKit

/**
 Container class for storing active loggers (such as CocoaLumberjack, Shipbook, etc...)
 */
@objc public class OSLoggerContainer: NSObject {
    /// Singleton object.
    @objc public static let shared = OSLoggerContainer()
    
    /// Array with active loggers.
    private var loggers: [OSLogger]
    
    override private init() {
        loggers = []
    }
    
    @objc public func addLogger(_ logger: OSLogger) {
        loggers.append(logger)
    }
    
    @objc public func deleteLoggers() {
        loggers = []
    }
    
    @objc public func error(_ message: String) {
        loggers.forEach {
            $0.error(message)
        }
    }
    
    @objc public func warn(_ message: String) {
        loggers.forEach { logger in
            logger.warn(message)
        }
    }
    
    @objc public func info(_ message: String) {
        loggers.forEach { logger in
            logger.info(message)
        }
    }
    
    @objc public func debug(_ message: String) {
        loggers.forEach { logger in
            logger.debug(message)
        }
    }
    
    @objc public func verbose(_ message: String) {
        loggers.forEach { logger in
            logger.verbose(message)
        }
    }
}
