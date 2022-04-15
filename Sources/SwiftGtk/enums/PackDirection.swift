import CGtk

/// Determines how widgets should be packed inside menubars and menuitems contained in menubars.
/// 
/// https://docs.gtk.org/gtk3/enum.PackDirection.html
public enum PackDirection {
    /// Widgets are packed left-to-right.
    case ltr

    /// Widgets are packed right-to-left.
    case rtl

    /// Widgets are packed top-to-bottom.
    case ttb

    /// Widgets are packed bottom-to-top.
    case btt

    func toGtkPackDirection() -> GtkPackDirection {
        switch self {
        case .ltr:
            return GTK_PACK_DIRECTION_LTR
        case .rtl:
            return GTK_PACK_DIRECTION_RTL
        case .ttb:
            return GTK_PACK_DIRECTION_TTB
        case .btt:
            return GTK_PACK_DIRECTION_BTT
        }
    }
}

extension GtkPackDirection {
    func toPackDirection() -> PackDirection? {
        switch self {
        case GTK_PACK_DIRECTION_LTR:
            return .ltr
        case GTK_PACK_DIRECTION_RTL:
            return .rtl
        case GTK_PACK_DIRECTION_TTB:
            return .ttb
        case GTK_PACK_DIRECTION_BTT:
            return .btt
        default:
            return nil
        }
    }
}
