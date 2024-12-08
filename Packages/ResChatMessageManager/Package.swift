// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResChatMessageManager",
    platforms: [
        .iOS(.v16),
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ResChatMessageManager",
            targets: ["ResChatMessageManager"]),
    ],
    dependencies: [
        .package(name: "ResChatUICommon", path: "../ResChatUICommon"),
        .package(name: "ResChatLogging", path: "../ResChatLogging")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ResChatMessageManager",
            dependencies: ["ResChatUICommon",
                           "ResChatLogging"]),
        .testTarget(
            name: "ResChatMessageManagerTests",
            dependencies: ["ResChatMessageManager"]
        ),
    ]
)
