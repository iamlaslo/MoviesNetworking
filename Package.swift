// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "MoviesNetworking",
    products: [
        .library(
            name: "MoviesNetworking",
            targets: ["MoviesNetworking"]),
    ],
    dependencies: [
      .package(url: "https://github.com/iamlaslo/CoreNetworking.git", branch: "main")
    ],
    targets: [
        .target(
            name: "MoviesNetworking",
            dependencies: ["CoreNetworking"]),
        .testTarget(
            name: "MoviesNetworkingTests",
            dependencies: ["MoviesNetworking", "CoreNetworking"]),
    ]
)
