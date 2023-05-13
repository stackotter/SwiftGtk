// swift-tools-version:5.5

import PackageDescription

#if os(macOS)
let cGtkSources = "Sources/CGtk/MacOS"
#elseif os(Linux) || os(Windows)
let cGtkSources = "Sources/CGtk/Linux+Windows"
#else
fatalError("Unsupported platform.")
#endif

let package = Package(
    name:  "SwiftGtk",
    products: [
        .executable(name: "Demo", targets: ["Demo"]),
        .library(name: "SwiftGtk", targets: ["SwiftGtk"]),
        .library(name: "CGtk", targets: ["CGtk"])
    ],
    targets: [
        .systemLibrary(
            name: "CGtk",
            path: cGtkSources,
            pkgConfig: "gtk4",
            providers: [
                .brew(["gtk+4"]),
                .apt(["libgtk-4-dev clang"])
            ]
        ),
        .target(
            name: "SwiftGtk",
            dependencies: ["CGtk"]
        ),
        .executableTarget(
            name: "Demo",
            dependencies: ["SwiftGtk"],
            resources: [.copy("GTK.png")]
        )
    ]
)
