//
//  OSLoggerContainerTests.swift
//  OSLoggerTests
//
//  Created by Alexander Solis on 8/12/22.
//  Copyright © 2022 Mellontec. All rights reserved.
//

import XCTest
@testable import OSLogger

class OSLoggerContainerTests: XCTestCase {

    let sut = OSLoggerContainer.shared
    let logger1 = MockOSLogger()
    let logger2 = MockOSLogger()
    
    override func setUpWithError() throws {
        sut.addLogger(logger1)
        sut.addLogger(logger2)
    }

    override func tearDownWithError() throws {
    }

    func testLoggersErrorMessageIsTriggered() throws {
        sut.error("test message")
        XCTAssertTrue(logger1.erroCalled)
    }
    
    func testLoggersWarnMessageIsTriggered() throws {
        sut.warn("test message")
        XCTAssertTrue(logger1.warnCalled)
    }

    func testLoggersInfoMessageIsTriggered() throws {
        sut.info("test message")
        XCTAssertTrue(logger1.infoCalled)
    }

    func testLoggersDebugMessageIsTriggered() throws {
        sut.debug("test message")
        XCTAssertTrue(logger1.debugCalled)
    }

    func testLoggersVerboseMessageIsTriggered() throws {
        sut.verbose("test message")
        XCTAssertTrue(logger1.verboseCalled)
    }

}

extension OSLoggerContainerTests {
    class MockOSLogger: OSLogger {
        var erroCalled = false
        var warnCalled = false
        var infoCalled = false
        var debugCalled = false
        var verboseCalled = false
        
        func error(_ message: String) {
            erroCalled = true
        }
        
        func warn(_ message: String) {
            warnCalled = true
        }
        
        func info(_ message: String) {
            infoCalled = true
        }
        
        func debug(_ message: String) {
            debugCalled = true
        }
        
        func verbose(_ message: String) {
            verboseCalled = true
        }
        
        required init(userInfo: [String : String]? = nil) {
            
        }
    }
}
