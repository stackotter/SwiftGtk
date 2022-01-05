// swift-tools-version:5.5

import PackageDescription

#if os(OSX)
    let gtkPath = "./CGtk/OSX"
#elseif os(Linux)
    let gtkPath = "./CGtk/Linux"
#else
    fatalError("Unsupported platform.")
#endif

let package = Package(
  name:  "SwiftGtk",
  dependencies: [
    .package(name: "CGtk", path: gtkPath)
  ],
  targets: [
    .target(name: "SwiftGtk"),
    .executableTarget(
      name: "Demo",
      dependencies: ["SwiftGtk"],
      resources: [.copy("GTK.png")])
  ]
)
