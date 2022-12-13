//
//  ShipBookAdapter.swift
//  OSLogger
//
//  Created by Alexander Solis on 8/12/22.
//  Copyright © 2022 Mellontec. All rights reserved.
//

import UIKit
import ShipBookSDK

@objc public class ShipBookAdapter: NSObject, OSLogger {
    var logger = ShipBook.getLogger("")

    private var appId: String?
    private var appKey: String?
    private var userId: String?
    
    override public init() {
        super.init()
    }
    
    required convenience public init(userInfo: [String : String]? = nil) {
        self.init()
        
        guard let userInfo = userInfo else {
            return
        }

        self.appId = userInfo["appId"]
        self.appKey = userInfo["appKey"]
        self.userId = userInfo["userId"]
    }

    public func error(_ message: String) {
        logger.e(message)
    }
    
    public func warn(_ message: String) {
        logger.w(message)
    }
    
    public func info(_ message: String) {
        logger.i(message)
    }
    
    public func debug(_ message: String) {
        logger.d(message)
    }
    
    public func verbose(_ message: String) {
        logger.v(message)
    }
    
    @objc public func startLogger() {
        guard let appId = appId,
              let appKey = appKey else {
            return
        }

        ShipBook.start(appId: appId, appKey: appKey)

        if let userId = userId {
            ShipBook.registerUser(userId: userId)
        }
    }
}
