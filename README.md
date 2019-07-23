# OSLogger
A log system that makes logging consistent on both Swift and Objective-C.

## Install

#### Cocoa Pods
Requires Cocoapods 1.5.0 or above.

```ruby
target '<you project target>' do
pod 'OSLogger'
end
```

## Usage

#### Swift Usage

Import the module:
```swift
import OSLogger
```

Setup the logger, it is suggested to use the OSLogger protocol instead of the adapter directly. 
```swift
let logger: OSLogger = CocoaLumberjackAdapter(logLevel: .info)

logger.startConsoleLogger() // Should only be used when running from Xcode
logger.startFileLogger()
```

To retrieve log files:
```swift
let logFiles = logger.getLogFiles()
for logFile in logFiles {
    <do something with the log files>
}
```

For making logs across the Swift code use :
```swift
OSLogVerbose("This is a log from Swift code")
OSLogDebug("This is a log from Swift code")
OSLogInfo("This is a log from Swift code")
OSLogWarn("This is a log from Swift code")
OSLogError("This is a log from Swift code")
```

#### Objective-C Usage

To import the module:
```objc
@import OSLogger;
```

Setup the logger, it is suggested to use the OSLogger protocol instead of the adapter directly. 
```objc
id<OSLogger> logger = [[CocoaLumberjackAdapter alloc]  initWithLogLevel:LogLevelInfo];
[logger startConsoleLogger]; // Should only be used when running from Xcode
[logger startFileLogger];
```

To retrieve log files:
```objc
for (NSURL *logFile in logger.getLogFiles) {
    if (logFile) <do something with the log files>
}
```

For making logs across the Objective-C code use :
```objc
OSLogVerbose(@"This is a log from Objective-C code")
OSLogDebug(@"This is a log from Objective-C code")
OSLogInfo(@"This is a log from Objective-C code")
OSLogWarn(@"This is a log from Objective-C code")
OSLogError(@"This is a log from Objective-C code")
```

The output will consist of the date, the message type (Info, Debug, Error, etc...) followed by the log message:
2019-07-22 18:26:32: Info - Hello World!

## TODO: More Adapters?

Since OSLogger is a protocol, the library can be expanded to support other implementations such as Apple Framework logs:
Swift: print()
Objc: NSLog()
or other implementations similar to Cocoalumberjack, the advantage is that a change like this, will require just a few lines of code changes in the main code of a project that uses OSLogger. 

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
