// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GazetteDB",
	platforms: [
		.macOS(.v14),
		.iOS(.v17),
		.watchOS(.v10),
		.visionOS(.v1)
	],
    products: [
        .library(
            name: "GazetteDB",
            targets: ["GazetteDB"]),
    ],
	dependencies: [
		.package(name: "GazetteCore", path: "../GazetteCore")
	],
    targets: [
        .target(
            name: "GazetteDB",
			dependencies: [
				"GazetteCore"
			]
		),
        .testTarget(
            name: "GazetteDBTests",
            dependencies: ["GazetteDB"]),
    ]
)
