//
//  OSLogger.swift
//  OSLogger
//
//  Created by Alexander Solis on 7/18/19.
//  Copyright © 2019 Mellontec. All rights reserved.
//

import UIKit
import CocoaLumberjack

@objc class CocoaLumberjackAdapter: NSObject, OSLogger {
    var logger: DDLog // Needs internal access to use dependency inyection in unit tests.
    private var logLevel = LogLevel.warning

    static func error(_ message: String) {
        DDLogError(message)
    }

    static func warn(_ message: String) {
        DDLogWarn(message)
    }

    static func info(_ message: String) {
        DDLogInfo(message)
    }

    static func debug(_ message: String) {
        DDLogDebug(message)
    }

    static func verbose(_ message: String) {
        DDLogVerbose(message)
    }

    override init() {
        logger = DDLog.sharedInstance

        super.init()
    }

    required convenience init(logLevel: LogLevel = .warning) {
        self.init()
        self.logLevel = logLevel
    }

    func startConsoleLogger() {
        let ttyLogger = DDTTYLogger()
        ttyLogger.logFormatter = CocoaLumberjackFormatter()
        logger.add(ttyLogger, with: logLevel.ddLogLevel())
    }

    func startFileLogger() {
        let fileLogger = DDFileLogger()
        fileLogger.logFormatter = CocoaLumberjackFormatter()
        fileLogger.rollingFrequency = 60 * 60 * 24// 24 hour rolling
        fileLogger.maximumFileSize = 50000000;
        fileLogger.logFileManager.maximumNumberOfLogFiles = 3
        // Maybe it is better to append to a file in case we want previous launch information.
        //fileLogger.doNotReuseLogFiles = true
        logger.add(fileLogger, with: logLevel.ddLogLevel())
    }

    func getLogFiles() -> [URL] {
        let fileLoggers = logger.allLoggers.filter {
            return $0 is DDFileLogger
        }

        var fileURL: URL?

        if let fileLogger = fileLoggers.last as? DDFileLogger {
            let filePath = fileLogger.currentLogFileInfo.filePath
            fileURL = URL(fileURLWithPath: filePath)
        }

        return fileURL != nil ? [fileURL!] : []
    }
}

extension LogLevel {
    func ddLogLevel() -> DDLogLevel {
        var logLevel: DDLogLevel!

        switch self {
        case .error:
            logLevel = DDLogLevel.error
        case .warning:
            logLevel = DDLogLevel.warning
        case .info:
            logLevel = DDLogLevel.info
        case .debug:
            logLevel = DDLogLevel.debug
        case .verbose:
            logLevel = DDLogLevel.verbose
        }

        return logLevel
    }
}
