.PHONY: show_environment
show_environment:
	sw_vers
	xcodebuild -version
	swift --version

.PHONY: nyan
nyan:
	echo nyan

.PHONY: swift_package_test_test
swift_package_test_test:
	cd SwiftPackageTest \
	&& swift package generate-xcodeproj \
	&& xcodebuild -scheme SwiftPackageTest-Package -destination 'platform=iOS Simulator,name=iPhone 11 Pro Max,OS=14.0' test
