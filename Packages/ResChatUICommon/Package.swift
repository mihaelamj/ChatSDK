// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResChatUICommon",
    platforms: [
        .iOS(.v16),
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ResChatUICommon",
            targets: ["ResChatUICommon"]),
    ],
    dependencies: [
        .package(name: "ResChatAppearance", path: "../ResChatAppearance"),
        .package(name: "ResChatProtocols", path: "../ResChatProtocols"),
        .package(name: "ResChatAttributedText", path: "../ResChatAttributedText")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ResChatUICommon",
            dependencies: [
                "ResChatAppearance",
                "ResChatProtocols",
                "ResChatAttributedText"
            ]),
        .testTarget(
            name: "ResChatUICommonTests",
            dependencies: ["ResChatUICommon"]
        ),
    ]
)
