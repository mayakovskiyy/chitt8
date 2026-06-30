// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "chitt8",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(name: "chitt8", targets: ["chitt8"])
    ],
    targets: [
        .executableTarget(
            name: "chitt8",
            dependencies: [],
            linkerSettings: [
                .linkedFramework("AppKit")
            ]
        )
    ]
)
