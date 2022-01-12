//
//  OSLogger
//
//  Created by Alexander Solis on 7/18/19.
//  Copyright © 2019 Mellontec. All rights reserved.
//

import UIKit
import CocoaLumberjack

@objc public class CocoaLumberjackAdapter: NSObject, OSLogger {
    
    var logger: DDLog // Needs internal access to use dependency inyection in unit tests.
    private var logLevel = LogLevel.warning

    public static func error(_ message: String) {
        DDLogError(message)
    }
    
    public static func warn(_ message: String) {
        DDLogWarn(message)
    }
    
    public static func info(_ message: String) {
        DDLogInfo(message)
    }
    
    public static func debug(_ message: String) {
        DDLogDebug(message)
    }
    
    public static func verbose(_ message: String) {
        DDLogVerbose(message)
    }
    
    override public init() {
        logger = DDLog.sharedInstance

        super.init()
    }

    required convenience public init(logLevel: LogLevel = .warning) {
        self.init()
        self.logLevel = logLevel
    }

    public func startConsoleLogger() {
        let ddosLogger = DDOSLogger.sharedInstance
        ddosLogger.logFormatter = CocoaLumberjackFormatter()
        logger.add(ddosLogger, with: logLevel.ddLogLevel())
    }

    public func startFileLogger() {
        let fileLogger = DDFileLogger()
        fileLogger.logFormatter = CocoaLumberjackFormatter()
        fileLogger.rollingFrequency = 60 * 60 * 24// 24 hour rolling
        fileLogger.maximumFileSize = 50000000;
        fileLogger.logFileManager.maximumNumberOfLogFiles = 3
        logger.add(fileLogger, with: logLevel.ddLogLevel())
    }

    public func getLogFiles() -> [URL] {
        let fileLoggers = logger.allLoggers.filter {
            return $0 is DDFileLogger
        }

        var fileURL: URL?

        if let fileLogger = fileLoggers.last as? DDFileLogger,
           let filePath = fileLogger.currentLogFileInfo?.filePath{
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
