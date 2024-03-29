Pod::Spec.new do |s|
  s.platform = :ios
  s.ios.deployment_target = '10.0'
  s.swift_version = "5.0"
  s.name = "OSLogger"
  s.version = "2.0.0"
  s.summary = "Objective-C and Swift logger"
  s.description = <<-DESC
A log system that makes logging consistent on both Swift and Objective-C.
                   DESC
  s.homepage = "https://github.com/ga083/OSLogger"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "Alexander Solis" => "alexandersv@gmail.com" }
  s.source = { :git => "https://github.com/ga083/OSLogger.git", :tag => "#{s.version}" }
  s.source_files = "OSLogger", "OSLogger/**/*.{h,m}", "OSLogger/Log Systems/CocoaLumberjack","OSLogger/Log Systems/ShipBook"
  s.framework = "Foundation"
  s.dependency 'CocoaLumberjack/Swift', '3.7.0'
  s.dependency 'ShipBookSDK'
end
