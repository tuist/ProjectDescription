# ProjectDescription

> [!IMPORTANT]
> **This repository is archived.** Teams should use the prebuilt version of ProjectDescription instead. See the example below.

## Using prebuilt ProjectDescription

Instead of using this repository, use the prebuilt binary target:

```swift
import PackageDescription

let package = Package(
    name: "MyProjectDescriptionExtension",
    products: [
        .library(
            name: "MyProjectDescriptionExtension",
            targets: ["MyProjectDescriptionExtension"]
        ),
    ],
    targets: [
        .target(
            name: "MyProjectDescriptionExtension",
            dependencies: ["ProjectDescription"]
        ),
        .binaryTarget(
            name: "ProjectDescription",
            // Replace the 4.55.0 version with the version you want to use.
            // The checksum is available in the GitHub release, shown next to the ProjectDescription.xcframework.zip file, such as in this release: https://github.com/tuist/tuist/releases/tag/4.55.0
            url: "https://github.com/tuist/tuist/releases/download/4.55.0/ProjectDescription.xcframework.zip",
            checksum: "6da2eb2963817b0948dab252edb7ba79b5466651e0e477ef64d83f18f0f7c83e"
        ),
    ]
)
```

## How to use this repository

This repository contains mirror for the [ProjectDescription](https://github.com/tuist/tuist/tree/main/Sources/ProjectDescription) framework in the tuist main repository.

This enables users to add this framework to their `Package.swift` without having to download _all_ the dependencies the main repository has.
