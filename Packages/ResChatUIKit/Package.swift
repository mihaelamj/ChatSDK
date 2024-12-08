// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResChatUIKit",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ResChatUIKit",
            targets: ["ResChatUIKit"]),
    ],
    dependencies: [
        .package(name: "ResChatAppearance", path: "../ResChatAppearance"),
        .package(name: "ResChatMessageManager", path: "../ResChatMessageManager"),
        .package(name: "ResChatProtocols", path: "../ResChatProtocols"),
        .package(name: "ResChatAttributedText", path: "../ResChatAttributedText"),
        .package(name: "ResChatUICommon", path: "../ResChatUICommon"),
        .package(name: "ResChatSpeech", path: "../ResChatSpeech"),
        .package(name: "ResChatLogging", path: "../ResChatLogging")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ResChatUIKit",
            dependencies: [
                "ResChatAppearance",
                "ResChatMessageManager",
                "ResChatProtocols",
                "ResChatAttributedText",
                "ResChatUICommon",
                "ResChatSpeech",
                "ResChatLogging"
            ]),
        .testTarget(
            name: "ResChatUIKitTests",
            dependencies: ["ResChatUIKit"]
        ),
    ]
)
