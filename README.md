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

Setup the logger, it is recommended to use the OSLogger protocol instead of the adapter directly. 
```swift
let logger: OSLogger = CocoaLumberjackAdapter()

logger.startConsoleLogger() // Should only be used when running from Xcode
logger.startFileLogger()

OSLoggerContainer.shared.addLogger(logger)
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
id<OSLogger> logger = [[CocoaLumberjackAdapter alloc]  initWithUserInfo:nil];
[logger startConsoleLogger]; // Should only be used when running from Xcode
[logger startFileLogger];

// Add the logger adapter to the container.
[[OSLoggerContainer shared] addLogger:logger];
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

### Currently the project supports a ShipBook adapter as well:
```swift
let userInfo = [
    "appId": "548a53c95e5",
    "appKey": "d4ea3df4e6",
    "userId": "123"
]

let shipBookAdapter = ShipBookAdapter(userInfo: userInfo)
shipBookAdapter.startLogger()

// Add the logger adapter to the container.
OSLoggerContainer.shared().addLogger(shipBookAdapter)
```

```objc
        NSDictionary *userInfo = @{
            @"appId" : @"548a53c95e5",
            @"appKey" : @"d4ea3df4e6",
            @"userId" : "123"
        };
        
        ShipBookAdapter *shipBookAdapter = [[ShipBookAdapter alloc] initWithUserInfo:userInfo];
        [shipBookAdapter startLogger];
        
        // Add the logger adapter to the container.
        [[OSLoggerContainer shared] addLogger:shipBookAdapter];
```

More adapters can be added by implementing the OSLogger protocol.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
