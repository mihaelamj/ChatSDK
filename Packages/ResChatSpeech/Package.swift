// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResChatSpeech",
    platforms: [
        .macOS(.v10_15), // Specify macOS 10.15 as the minimum version
        .iOS(.v13)       // Include iOS 13 if necessary
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ResChatSpeech",
            targets: ["ResChatSpeech"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ResChatSpeech"),
        .testTarget(
            name: "ResChatSpeechTests",
            dependencies: ["ResChatSpeech"]
        ),
    ]
)
