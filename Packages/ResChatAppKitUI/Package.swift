// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResChatAppKitUI",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ResChatAppKitUI",
            targets: ["ResChatAppKitUI"]),
    ],
    dependencies: [
        .package(name: "ResChatAppearance", path: "../ResChatAppearance"),  // Add ResChatAppearance as a local package
        .package(name: "ResChatProtocols", path: "../ResChatProtocols"),   // Add ResChatProtocols as a local package
        .package(name: "ResChatAttributedText", path: "../ResChatAttributedText")  // Add ResChatAttributedText as a local package
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ResChatAppKitUI",
            dependencies: [
                "ResChatAppearance",  // Specify ResChatAppearance as a dependency
                "ResChatProtocols",   // Specify ResChatProtocols as a dependency
                "ResChatAttributedText"  // Specify ResChatAttributedText as a dependency
            ]),
        .testTarget(
            name: "ResChatAppKitUITests",
            dependencies: ["ResChatAppKitUI"]),
    ]
)
