//
//  ViewController.swift
//  OSLoggerExample
//
//  Created by Alexander Solis on 7/19/19.
//  Copyright © 2019 Mellontec. All rights reserved.
//

import UIKit
import OSLogger

class ViewController: UIViewController {

    @IBOutlet weak var logsView: UITextView!
    @IBOutlet weak var filePathView: UITextView!
    
    private let logger: OSLogger = CocoaLumberjackAdapter(logLevel: .verbose)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logger.startConsoleLogger()
        logger.startFileLogger()
        
        OSLogInfo("*App Launched*")
        
        filePathView.text = logger.getLogFiles().last?.absoluteString
    }
    
    @IBAction func logFromSwift() {
        let swiftLogger = SwiftLogger()
        swiftLogger.logSomething()
        updateLogsView()
    }
    
    @IBAction func logFromObjectiveC() {
        let objectiveCLogger = ObjectiveCLogger()
        objectiveCLogger.logSomething()
        updateLogsView()
    }
    
    func updateLogsView() {
        let logFiles = logger.getLogFiles()
        for logFile: URL in logFiles {
            logsView.text = try? String(contentsOf: logFile, encoding: .utf8)
        }
    }
}

