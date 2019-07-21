//
//  OSLogger
//
//  Created by Alexander Solis on 7/18/19.
//  Copyright © 2019 Mellontec. All rights reserved.
//

import UIKit
import CocoaLumberjack

class CocoaLumberjackFormatter: NSObject, DDLogFormatter {
    let dateFormmater = DateFormatter()
    var loggerCount = 0

    override public init() {
        super.init()
        dateFormmater.dateFormat = "yyyy-MM-dd HH:mm:ss:SSS"
    }

    //MARK: - DDLogFormatter
    func format(message logMessage: DDLogMessage) -> String? {

        let logLevel: String
        switch logMessage.flag {
        case DDLogFlag.error:
            logLevel = "Error"
        case DDLogFlag.warning:
            logLevel = "Warn"
        case DDLogFlag.info:
            logLevel = "Info"
        case DDLogFlag.debug:
            logLevel = "Debug"
        default:
            logLevel = "Verbose"
        }

        let timestamp = dateFormmater.string(from: logMessage.timestamp)
        let logMsg = logMessage.message
        
        return "\(timestamp): \(logLevel) - \(logMsg)"
    }

    func didAdd(to logger: DDLogger) {
        loggerCount += 1

        assert(loggerCount <= 1, "This logger isn't thread-safe");
    }

    func willRemove(from logger: DDLogger) {
        loggerCount -= 1
    }
}
