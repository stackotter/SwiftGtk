import CGtk

/// Determines how widgets should be packed inside menubars and menuitems contained in menubars.
/// 
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.PackDirection.html)
public enum PackDirection {
    /// Widgets are packed left-to-right.
    case leftToRight
    /// Widgets are packed right-to-left.
    case rightToLeft
    /// Widgets are packed top-to-bottom.
    case topToBottom
    /// Widgets are packed bottom-to-top.
    case bottomToTop

    func toGtkPackDirection() -> GtkPackDirection {
        switch self {
        case .leftToRight:
            return GTK_PACK_DIRECTION_LTR
        case .rightToLeft:
            return GTK_PACK_DIRECTION_RTL
        case .topToBottom:
            return GTK_PACK_DIRECTION_TTB
        case .bottomToTop:
            return GTK_PACK_DIRECTION_BTT
        }
    }
}

extension GtkPackDirection {
    func toPackDirection() -> PackDirection {
        switch self {
        case GTK_PACK_DIRECTION_LTR:
            return .leftToRight
        case GTK_PACK_DIRECTION_RTL:
            return .rightToLeft
        case GTK_PACK_DIRECTION_TTB:
            return .topToBottom
        case GTK_PACK_DIRECTION_BTT:
            return .bottomToTop
        default:
            fatalError("Unsupported GtkPackDirection enum value: \(self.rawValue)")
        }
    }
}
