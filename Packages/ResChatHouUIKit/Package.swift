// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResChatHouUIKit",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ResChatHouUIKit",
            targets: ["ResChatHouUIKit"]),
    ],
    dependencies: [
        .package(name: "ResChatUIKit", path: "../ResChatUIKit"),
        .package(name: "ResChatSocket", path: "../ResChatSocket"),
        .package(name: "ResChatAppearance", path: "../ResChatAppearance"),
        .package(name: "ResChatHouCommon", path: "../ResChatHouCommon"),
        .package(name: "ResChatSpeech", path: "../ResChatSpeech")
    ],
    targets: [
        .target(
            name: "ResChatHouUIKit",
            dependencies: ["ResChatUIKit",
                           "ResChatSocket",
                           "ResChatAppearance",
                           "ResChatHouCommon",
                           "ResChatSpeech"]),
        .testTarget(
            name: "ResChatHouUIKitTests",
            dependencies: ["ResChatHouUIKit"]),
    ]
)
