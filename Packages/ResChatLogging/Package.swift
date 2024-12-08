// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResChatLogging",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ResChatLogging",
            targets: ["ResChatLogging"]
        ),
    ],
    dependencies: [
        // External dependencies
        .package(name: "ResChatUtil", path: "../ResChatUtil")
    ],
    targets: [
        // Targets define modules and test suites for the package.
        .target(
            name: "ResChatLogging",
            dependencies: ["ResChatUtil"]
        ),
        .testTarget(
            name: "ResChatLoggingTests",
            dependencies: ["ResChatLogging"]
        ),
    ]
)
