source 'https://github.com/CocoaPods/Specs.git'
# Uncomment this line to define a global platform for your project
platform :ios, '8.0'
# Uncomment this line if you're using Swift or 8.0+
use_frameworks!

# xcodeproj is deprecated in 1.0 and has been renamed to project. For pre-1.0 versions use xcodeproj.

workspace 'Collection_XcodeScript.xcworkspace'

xcodeproj 'DemoFramework/DemoFramework.xcodeproj'
xcodeproj 'Test/Test.xcodeproj'

def shared_pods
pod 'AFNetworking'
pod 'IQKeyboardManager'
pod 'CocoaAsyncSocket'  
end


# DemoFramework不依赖任何cocoapds生成的库，所以留空
target 'DemoFramework' do
	xcodeproj 'DemoFramework/DemoFramework.xcodeproj'
end

target 'Test' do
	xcodeproj 'Test/Test.xcodeproj'
	shared_pods
	pod 'MBProgressHUD'
end

