// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResChatAttributedText",
    platforms: [
        .iOS(.v16),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "ResChatAttributedText",
            targets: ["ResChatAttributedText"]),
    ],
    dependencies: [
        .package(url: "https://github.com/iwasrobbed/Down.git", from: "0.9.4"),
        .package(name: "ResChatProtocols", path: "../ResChatProtocols"),
    ],
    targets: [
        .target(
            name: "ResChatAttributedText",
            dependencies: [
                "Down",
                "ResChatProtocols"
            ]),
        .testTarget(
            name: "ResChatAttributedTextTests",
            dependencies: ["ResChatAttributedText"]),
    ]
)
