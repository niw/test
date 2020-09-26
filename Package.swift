// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CatTheKitten",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "CatTheKitten",
            targets: [
                "CatTheKitten"
            ]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CatTheKitten",
            dependencies: []
        ),
        .testTarget(
            name: "CatTheKittenTests",
            dependencies: [
                "CatTheKitten"
            ]
        )
    ]
)
