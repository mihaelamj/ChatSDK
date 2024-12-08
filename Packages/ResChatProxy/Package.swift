// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResChatProxy",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "ResChatProxy",
            targets: ["ResChatProxy"]),
    ],
    dependencies: [
        .package(name: "ResChatSocket", path: "../ResChatSocket"),
        .package(name: "ResChatProtocols", path: "../ResChatProtocols"),
    ],
    targets: [
        .target(
            name: "ResChatProxy",
            dependencies: [
                "ResChatSocket",
                "ResChatProtocols"
            ]
        ),
        .testTarget(
            name: "ResChatProxyTests",
            dependencies: ["ResChatProxy"]
        ),
    ]
)
