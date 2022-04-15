import CGtk

/// Reading directions for text.
/// 
/// https://docs.gtk.org/gtk3/enum.TextDirection.html
public enum TextDirection {
    /// No direction.
    case none

    /// Left to right text direction.
    case ltr

    /// Right to left text direction.
    case rtl

    func toGtkTextDirection() -> GtkTextDirection {
        switch self {
        case .none:
            return GTK_TEXT_DIR_NONE
        case .ltr:
            return GTK_TEXT_DIR_LTR
        case .rtl:
            return GTK_TEXT_DIR_RTL
        }
    }
}

extension GtkTextDirection {
    func toTextDirection() -> TextDirection? {
        switch self {
        case GTK_TEXT_DIR_NONE:
            return TextDirection.none
        case GTK_TEXT_DIR_LTR:
            return .ltr
        case GTK_TEXT_DIR_RTL:
            return .rtl
        default:
            return nil
        }
    }
}
