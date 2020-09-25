// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPackageTest",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "SwiftPackageTest",
            targets: [
                "SwiftPackageTest"
            ]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftPackageTest",
            dependencies: []
        ),
        .testTarget(
            name: "SwiftPackageTestTests",
            dependencies: [
                "SwiftPackageTest"
            ]
        )
    ]
)
