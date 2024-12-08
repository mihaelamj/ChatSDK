// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResChatSocket",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ResChatSocket",
            targets: ["ResChatSocket"]),
        
    ],
    dependencies: [
        .package(url: "https://github.com/socketio/socket.io-client-swift.git", from: "16.0.1"),
        .package(name: "ResChatLogging", path: "../ResChatLogging"),
    ],

    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ResChatSocket",
            dependencies: [
                .product(name: "SocketIO", package: "socket.io-client-swift"),
                .product(name: "ResChatLogging", package: "ResChatLogging")
            ]
        ),
        .testTarget(
            name: "ResChatSocketTests",
            dependencies: ["ResChatSocket"]
        ),
    ]
)
