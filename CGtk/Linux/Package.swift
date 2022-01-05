// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "CGtk",
    pkgConfig: "gtk+-3.0",
    providers: [.apt("libgtk-3-dev clang")]
)
