// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Demo",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        .plugin(
            name: "DemoAPIGenerator",
            targets: [
                "DemoAPIGenerator"
            ]
        ),
    ],
    targets: [
        .plugin(
            name: "DemoAPIGenerator",
            capability: .command(
                intent: .custom(verb: "demo-api-generator", description: "Generates the DemoAPI Package"),
                permissions: [
                    .writeToPackageDirectory(reason: "To write the generated package")
                ]
            ),
            dependencies: [
                .target(name: "create-api")
            ]
        ),
        .binaryTarget(
            name: "create-api",
            url: "https://github.com/CreateAPI/CreateAPI/releases/download/0.1.0/create-api.artifactbundle.zip",
            checksum: "4e9d1fb023c52e423d57de0928da5d943e3e4c81f6cb903523654867e6372db7"
        )
    ]
)
