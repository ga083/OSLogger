//
//  CocoaLumberjackAdapterTests.swift
//  OSLoggerTests
//
//  Created by Alexander Solis on 7/20/19.
//  Copyright © 2019 Mellontec. All rights reserved.
//

import XCTest
import CocoaLumberjack
@testable import OSLogger


class CocoaLumberjackAdapterTests: XCTestCase {
    var mockDDLog: MockDDLog!
    
    override func setUp() {
        super.setUp()
        mockDDLog = MockDDLog()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTheDefaultConsoleLogLevelIsSetToWarning() {
        let logger = CocoaLumberjackAdapter(logger: mockDDLog, logLevel: nil)
        logger.startConsoleLogger()
        XCTAssertEqual(mockDDLog.logLevelSet!, DDLogLevel.warning)
    }

    func testTheDefaultFileLogLevelIsSetCorrectly() {
        let logger = CocoaLumberjackAdapter(logger: mockDDLog, logLevel: nil)
        logger.startFileLogger()
        XCTAssertEqual(mockDDLog.logLevelSet!, DDLogLevel.warning)
    }

    func testTheConsoleLogLevelIsSetCorrectly() {
        let logger = CocoaLumberjackAdapter(logger: mockDDLog, logLevel: LogLevel.error)
        logger.startConsoleLogger()
        XCTAssertEqual(mockDDLog.logLevelSet!, DDLogLevel.error)
    }

    func testTheFileLogLevelIsSetCorrectly() {
        let logger = CocoaLumberjackAdapter(logger: mockDDLog, logLevel: LogLevel.verbose)
        logger.startFileLogger()
        XCTAssertEqual(mockDDLog.logLevelSet!, DDLogLevel.verbose)
    }

    func testTheLoggerIsNotAddedBeforeTheLoggerStarts() {
        XCTAssertFalse(mockDDLog.loggerAdded)
    }

    func testTheConsoleLoggerIsAddedWhenTheLoggerStarts() {
        let logger = CocoaLumberjackAdapter(logger: mockDDLog, logLevel: nil)
        logger.startConsoleLogger()
        XCTAssertTrue(mockDDLog.loggerAdded)
    }

    func testTheFileLoggerIsAddedWhenTheLoggerStarts() {
        let logger = CocoaLumberjackAdapter(logger: mockDDLog, logLevel: nil)
        logger.startFileLogger()
        XCTAssertTrue(mockDDLog.loggerAdded)
    }

    func testLogsCanBeExtracted() {
        let logger = CocoaLumberjackAdapter(logger: mockDDLog, logLevel: nil)
        logger.startFileLogger()
        OSLogError("Hi there!")

        let filePaths = logger.getLogFiles()
        XCTAssertTrue(filePaths.count > 0)
        XCTAssertEqual(filePaths.last!, mockDDLog.filePath!)
    }
}

extension CocoaLumberjackAdapterTests {
    class MockDDLog: DDLog {
        var loggerAdded = false
        var logLevelSet: DDLogLevel?
        var filePath: URL?

        override var allLoggers: [DDLogger] {
            get {
                let fileLogger = DDFileLogger()
                filePath = URL(fileURLWithPath: fileLogger.currentLogFileInfo.filePath)
                return [fileLogger]
            }
        }

        override func add(_ logger: DDLogger, with level: DDLogLevel) {
            loggerAdded = true
            logLevelSet = level
        }
    }
}

extension CocoaLumberjackAdapter {
    convenience init(logger: DDLog, logLevel: LogLevel?) {
        if let logLevel = logLevel {
            self.init(logLevel: logLevel)
        } else {
            self.init()
        }

        self.logger = logger
    }
}
