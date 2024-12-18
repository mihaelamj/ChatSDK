// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResChatHouAppKit",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ResChatHouAppKit",
            targets: ["ResChatHouAppKit"]),
    ],
    dependencies: [
        // Add reschatui, reschatSocket, ResChatAppearance, and ResChatHouCommon as local package dependencies
        .package(name: "ResChatAppKitUI", path: "../ResChatAppKitUI"),
        .package(name: "ResChatSocket", path: "../ResChatSocket"),
        .package(name: "ResChatAppearance", path: "../ResChatAppearance"),
        .package(name: "ResChatHouCommon", path: "../ResChatHouCommon"),
        .package(name: "ResChatSpeech", path: "../ResChatSpeech")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ResChatHouAppKit",
            dependencies: ["ResChatAppKitUI",
                           "ResChatSocket",
                           "ResChatAppearance",
                           "ResChatHouCommon",
                           "ResChatSpeech"]),
        .testTarget(
            name: "ResChatHouAppKitTests",
            dependencies: ["ResChatHouAppKit"]
        ),
    ]
)
