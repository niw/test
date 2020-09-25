.PHONY: show_environment
show_environment:
	sw_vers
	xcodebuild -version
	swift --version

.PHONY: nyan
nyan:
	@echo nyan nyan
