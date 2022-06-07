// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProjectDescription",
    platforms: [.macOS(.v11)],
    products: [
        .library(
            name: "ProjectDescription",
            targets: ["ProjectDescription"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ProjectDescription",
            dependencies: [],
            path: "ProjectDescription"
        ),
    ]
)