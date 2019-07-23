//
//  SwiftFileThatLogs.swift
//  OSLoggerExample
//
//  Created by Alexander Solis on 7/22/19.
//  Copyright © 2019 Mellontec. All rights reserved.
//

import UIKit
import OSLogger

class SwiftLogger: NSObject {
    func logSomething() {
        OSLogInfo("This is a log from Swift code")
    }
}
