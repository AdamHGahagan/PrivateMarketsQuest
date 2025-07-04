// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "PrivateMarketsQuest",
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "PrivateMarketsQuest", targets: ["PrivateMarketsQuest"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PrivateMarketsQuest",
            dependencies: []
        )
    ]
)
