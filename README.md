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
