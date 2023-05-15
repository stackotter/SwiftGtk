**ARCHIVED**: This Gtk wrapper is developed in tandem with
[SwiftCrossUI](https://github.com/stackotter/swift-cross-ui), and hence its API is a
higgledy-piggledy mess of random Gtk APIs that SwiftCrossUI needs to access. Thus, for someone
wanting to actually just use regular old Gtk in a Swift project (and not SwiftCrossUI), this project
was never really very useful. Hence I have moved this wrapper into the SwiftCrossUI repository to
simplify the development and the contributing process of SwiftCrossUI. I advise that you have a look at
[rhx's great Gtk wrapper](https://github.com/rhx/SwiftGtk) which uses automatic code generation to
always stay up-to-date with the latest features and have complete coverage of the Gtk API.

If you still want to continue using this wrapper after reading what I have to say, include
[SwiftCrossUI](https://github.com/stackotter/swift-cross-ui) as a dependency in your project and add
the `Gtk` product as a dependency of your target or app. The wrapper has merely been moved to a new
more fitting home.

# SwiftGtk

SwiftGtk provides Swift bindings for Gtk+ 3. It currently supports both macOS and Linux (with Windows support planned).

## Dependencies

1. Swift 5.5 or higher
2. Gtk+ 3
3. clang (only required on Linux)

### macOS: Installing Gtk+ 3

Install Gtk+ 3 using [homebrew](http://brew.sh/) or the package manager of your choice.

```bash
brew install gtk+3
```

### Linux: Installing Gtk+ 3 and clang

Install Gtk+3 and Clang using `apt` or the package manager of your choice.

```bash
sudo apt install libgtk-3-dev clang
```

## Usage

Add SwiftGtk as a dependency of your project using Swift Package Manager. Below is an example package manifest that has SwiftGtk as a dependency.

```swift
import PackageDescription

let package = Package(
  name: "GtkHelloWorld",
  dependencies: [
    .package(url: "https://github.com/stackotter/SwiftGtk", .branch("main"))
  ],
  targets: [
    .executableTarget(name: "GtkHelloWorld", dependencies: ["SwiftGtk"])
  ]
)
```

## Demo

First install the required dependencies as listed above. And then run the following commands:

```bash
git clone https://github.com/stackotter/SwiftGtk
cd SwiftGtk
swift run Demo
```

### macOS

![macOS](https://github.com/stackotter/SwiftGtk/blob/main/Screenshots/Demo_macOS.png?raw=true)

## License

All code is licensed under MIT license.
