import CGtk

extension UnsafeMutablePointer {

    func cast<T>() -> UnsafeMutablePointer<T> {
        let pointer = UnsafeRawPointer(self).bindMemory(to: T.self, capacity: 1)
        return UnsafeMutablePointer<T>(mutating: pointer)
    }

}

extension UnsafeMutablePointer where Pointee == gchar {

    func toString() -> String {
        String(cString: self)
    }

}
