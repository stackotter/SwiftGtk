import CGtk

/// An enumeration representing directional movements within a menu.
/// 
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.MenuDirectionType.html)
public enum MenuDirectionType {
    /// To the parent menu shell.
    case parent
    /// To the submenu, if any, associated with the item.
    case child
    /// To the next menu item.
    case next
    /// To the previous menu item.
    case previous

    func toGtkMenuDirectionType() -> GtkMenuDirectionType {
        switch self {
        case .parent:
            return GTK_MENU_DIR_PARENT
        case .child:
            return GTK_MENU_DIR_CHILD
        case .next:
            return GTK_MENU_DIR_NEXT
        case .previous:
            return GTK_MENU_DIR_PREV
        }
    }
}

extension GtkMenuDirectionType {
    func toMenuDirectionType() -> MenuDirectionType {
        switch self {
        case GTK_MENU_DIR_PARENT:
            return .parent
        case GTK_MENU_DIR_CHILD:
            return .child
        case GTK_MENU_DIR_NEXT:
            return .next
        case GTK_MENU_DIR_PREV:
            return .previous
        default:
            fatalError("Unexpected enum value")
        }
    }
}
