import CGtk

/// Built-in stock icon sizes.
/// 
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.IconSize.html)
public enum IconSize {
    /// Invalid size.
    case invalid
    /// Size appropriate for menus (16px).
    case menu
    /// Size appropriate for small toolbars (16px).
    case smallToolbar
    /// Size appropriate for large toolbars (24px).
    case largeToolbar
    /// Size appropriate for buttons (16px)
    case button
    /// Size appropriate for drag and drop (32px).
    case dnd
    /// Size appropriate for dialogs (48px).
    case diaglog

    func toGtkIconSize() -> GtkIconSize {
        switch self {
        case .invalid:
            return GTK_ICON_SIZE_INVALID
        case .menu:
            return GTK_ICON_SIZE_MENU
        case .smallToolbar:
            return GTK_ICON_SIZE_SMALL_TOOLBAR
        case .largeToolbar:
            return GTK_ICON_SIZE_LARGE_TOOLBAR
        case .button:
            return GTK_ICON_SIZE_BUTTON
        case .dnd:
            return GTK_ICON_SIZE_DND
        case .diaglog:
            return GTK_ICON_SIZE_DIALOG
        }
    }
}

extension GtkIconSize {
    func toIconSize() -> IconSize {
        switch self {
        case GTK_ICON_SIZE_INVALID:
            return .invalid
        case GTK_ICON_SIZE_MENU:
            return .menu
        case GTK_ICON_SIZE_SMALL_TOOLBAR:
            return .smallToolbar
        case GTK_ICON_SIZE_LARGE_TOOLBAR:
            return .largeToolbar
        case GTK_ICON_SIZE_BUTTON:
            return .button
        case GTK_ICON_SIZE_DND:
            return .dnd
        case GTK_ICON_SIZE_DIALOG:
            return .diaglog
        default:
            fatalError("Unexpected enum value")
        }
    }
}
