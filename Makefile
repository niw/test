RUBY_BIN_PATH = /usr/bin
RUBY = $(RUBY_BIN_PATH)/ruby
BUNDLE = $(RUBY_BIN_PATH)/bundle

.PHONY: all
all: correct

.PHONY: clean
clean:
	git clean -dfX

.bundle:
	$(BUNDLE) install --path "$@"

.PHONY: lint
lint: .bundle
	$(BUNDLE) exec rubocop

.PHONY: test
test:
	cd SwiftPackageTest \
	&& swift package generate-xcodeproj \
	&& xcodebuild \
	-project SwiftPackageTest.xcodeproj \
	-scheme SwiftPackageTest-Package \
	-destination 'platform=iOS Simulator,name=iPhone 11' \
	test

.PHONY: docs
docs:
	mkdir -p .docs
	date > .docs/index.html
