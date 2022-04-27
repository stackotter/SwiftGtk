import CGtk

extension Bool {

    func toGBoolean() -> gboolean {
        self ? 1 : 0
    }

}
