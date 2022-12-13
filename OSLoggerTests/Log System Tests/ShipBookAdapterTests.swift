//
//  ShipBookAdapterTests.swift
//  OSLoggerTests
//
//  Created by Alexander Solis on 8/12/22.
//  Copyright © 2022 Mellontec. All rights reserved.
//

import XCTest
@testable import OSLogger
@testable import ShipBookSDK

class ShipBookAdapterTests: XCTestCase {

    var sut = ShipBookAdapter()
    var mockLog: MockLog!
    
    override func setUpWithError() throws {
        mockLog = MockLog("")
        sut.logger = mockLog
    }

    override func tearDownWithError() throws {
    }

    func testErrorLogsTheMessage() throws {
        sut.error("some error")
        XCTAssertEqual(mockLog.message, "some error")
    }
    
    func testWarnLogsTheMessage() throws {
        sut.warn("some warning")
        XCTAssertEqual(mockLog.message, "some warning")
    }

    func testInfoLogsTheMessage() throws {
        sut.info("some information")
        XCTAssertEqual(mockLog.message, "some information")
    }

    func testDebugLogsTheMessage() throws {
        sut.debug("some debug message")
        XCTAssertEqual(mockLog.message, "some debug message")
    }

    func testVerboseLogsTheMessage() throws {
        sut.debug("some verbose message")
        XCTAssertEqual(mockLog.message, "some verbose message")
    }
}

extension ShipBookAdapterTests {
    class MockLog: Log {
        var message: String?
        
        override func e(_ msg: String, function: String = #function, file: String = #file, line: Int = #line) {
            message = msg
        }
        
        override func w(_ msg: String, function: String = #function, file: String = #file, line: Int = #line) {
            message = msg
        }
        
        override func i(_ msg: String, function: String = #function, file: String = #file, line: Int = #line) {
            message = msg
        }
        
        override func d(_ msg: String, function: String = #function, file: String = #file, line: Int = #line) {
            message = msg
        }
        
        override func v(_ msg: String, function: String = #function, file: String = #file, line: Int = #line) {
            message = msg
        }
    }
}
