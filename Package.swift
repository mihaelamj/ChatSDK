// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChatSDK",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ChatSDK",
            targets: ["ChatSDK"]),
    ],
    dependencies: [
        // Add all your local packages here
        .package(path: "Packages/ResChatAppearance"),
        .package(path: "Packages/ResChatMessageManager"),
        .package(path: "Packages/ResChatAttributedText"),
        .package(path: "Packages/ResChatHouCommon"),
        .package(path: "Packages/ResChatSpeech"),
        .package(path: "Packages/ResChatProtocols"),
        .package(path: "Packages/ResChatSocket"),
        .package(path: "Packages/ResChatProxy"),
//        .package(path: "Packages/ResChatHouUIKit"), // iOS-specific
//        .package(path: "Packages/ResChatUIKit"), // iOS-specific
//        .package(path: "Packages/ResChatHouAppKit"), // macOS-specific
//        .package(path: "Packages/ResChatAppKitUI"), // macOS-specific
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ChatSDK",
            dependencies: [
                "ResChatAppearance",
                "ResChatMessageManager",
                "ResChatAttributedText",
                "ResChatHouCommon",
                "ResChatSpeech",
                "ResChatProtocols",
                "ResChatSocket",
                "ResChatProxy",
//                .target(name: "ResChatHouUIKit", condition: .when(platforms: [.iOS])),
//                .target(name: "ResChatUIKit", condition: .when(platforms: [.iOS])),
//                .target(name: "ResChatHouAppKit", condition: .when(platforms: [.macOS])),
//                .target(name: "ResChatAppKitUI", condition: .when(platforms: [.macOS])),
                ]
        ),
        .testTarget(
            name: "ChatSDKTests",
            dependencies: ["ChatSDK"]
        ),
    ]
)
