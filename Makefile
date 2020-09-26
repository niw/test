NAME = CatTheKitten

BUILD_PROJECT = $(NAME).xcodeproj
BUILD_SCHEME = $(NAME)-Package
BUILD_SDK = iphonesimulator
BUILD_DERIVED_DATA_PATH = .build/derived_data

TEST_DESTINATION = platform=iOS Simulator,name=iPhone 11

DOCS_SOURCES = Sources/**/*.swift
DOCS_OUTPUT_PATH = .build/documentation

XCODEBUILD = xcodebuild
SWIFT = swift
SWIFTLINT = swiftlint

RUBY_BIN_PATH = /usr/bin
RUBY = $(RUBY_BIN_PATH)/ruby
BUNDLE = $(RUBY_BIN_PATH)/bundle

.PHONY: all
all: correct

.PHONY: clean
clean:
	git clean -dfX

.bundle: Gemfile
	$(BUNDLE) install --path "$@"
	touch "$@"

.PHONY: bundle
bundle: .bundle

.PHONY: lint
lint: .bundle
	$(SWIFTLINT)
	$(BUNDLE) exec rubocop

$(BUILD_PROJECT): Package.swift Sources Tests
	$(SWIFT) package generate-xcodeproj

.PHONY: test
test: $(BUILD_PROJECT)
	$(XCODEBUILD) \
		-project "$<" \
		-scheme "$(BUILD_SCHEME)" \
		-derivedDataPath "$(BUILD_DERIVED_DATA_PATH)" \
		-destination "$(TEST_DESTINATION)" \
		test

$(DOCS_OUTPUT_PATH): .bundle $(BUILD_PROJECT) $(DOCS_SOURCES)
	mkdir -p "$@"
	$(BUNDLE) exec jazzy \
		--output "$@" \
		--clean \
		--use_safe_filenames \
		--module CatTheKitten \
		--build-tool-arguments "-project,$(BUILD_PROJECT),-scheme,$(BUILD_SCHEME),-sdk,$(BUILD_SDK),-derivedDataPath,$(BUILD_DERIVED_DATA_PATH)" \
		--include "$(DOCS_SOURCES)"

.PHONY: docs
docs: $(DOCS_OUTPUT_PATH)
