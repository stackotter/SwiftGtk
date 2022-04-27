import CGtk

extension UnsafePointer where Pointee == gchar {

    func toString() -> String {
        String(cString: self)
    }
    
}
