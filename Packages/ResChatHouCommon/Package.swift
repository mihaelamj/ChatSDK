// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResChatHouCommon",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "ResChatHouCommon",
            targets: ["ResChatHouCommon"]),
    ],
    dependencies: [
        .package(name: "ResChatAppearance", path: "../ResChatAppearance"),
        .package(name: "ResChatProtocols", path: "../ResChatProtocols"),
        .package(name: "ResChatSocket", path: "../ResChatSocket"),
    ],
    targets: [
        .target(
            name: "ResChatHouCommon",
            dependencies: ["ResChatAppearance", "ResChatProtocols", "ResChatSocket"]),
        .testTarget(
            name: "ResChatHouCommonuTests",
            dependencies: ["ResChatHouCommon"]),
    ]
)
