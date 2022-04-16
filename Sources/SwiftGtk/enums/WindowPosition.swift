import CGtk

/// Window placement can be influenced using this enumeration. Note that using #GTK_WIN_POS_CENTER_ALWAYS is almost always a bad idea. It won’t necessarily work well with all window managers or on all windowing systems.
/// 
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.WindowPosition.html)
public enum WindowPosition {
    /// No influence is made on placement.
    case none
    /// Windows should be placed in the center of the screen.
    case center
    /// Windows should be placed at the current mouse position.
    case mouse
    /// Keep window centered as it changes size, etc.
    case centerAlways
    /// Center the window on its transient parent (see gtk_window_set_transient_for())
    case centerOnParent

    func toGtkWindowPosition() -> GtkWindowPosition {
        switch self {
        case .none:
            return GTK_WIN_POS_NONE
        case .center:
            return GTK_WIN_POS_CENTER
        case .mouse:
            return GTK_WIN_POS_MOUSE
        case .centerAlways:
            return GTK_WIN_POS_CENTER_ALWAYS
        case .centerOnParent:
            return GTK_WIN_POS_CENTER_ON_PARENT
        }
    }
}

extension GtkWindowPosition {
    func toWindowPosition() -> WindowPosition {
        switch self {
        case GTK_WIN_POS_NONE:
            return WindowPosition.none
        case GTK_WIN_POS_CENTER:
            return .center
        case GTK_WIN_POS_MOUSE:
            return .mouse
        case GTK_WIN_POS_CENTER_ALWAYS:
            return .centerAlways
        case GTK_WIN_POS_CENTER_ON_PARENT:
            return .centerOnParent
        default:
            fatalError("Unexpected enum value")
        }
    }
}
