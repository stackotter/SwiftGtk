import CGtk

/// Used to dictate the style that a `GtkButtonBox` uses to layout the buttons it contains.
///
/// https://docs.gtk.org/gtk3/enum.ButtonBoxStyle.html
public enum ButtonBoxStyle {
    case spread
    case edge
    case start
    case end
    case center
    case expand

    func toGtkButtonBoxStyle() -> GtkButtonBoxStyle {
        switch self {
        case .spread:
            return GTK_BUTTONBOX_SPREAD
        case .edge:
            return GTK_BUTTONBOX_EDGE
        case .start:
            return GTK_BUTTONBOX_START
        case .end:
            return GTK_BUTTONBOX_END
        case .center:
            return GTK_BUTTONBOX_CENTER
        case .expand:
            return GTK_BUTTONBOX_EXPAND
        }
    }
}

extension GtkButtonBoxStyle {
    func toButtonBoxStyle() -> ButtonBoxStyle? {
        switch self {
        case GTK_BUTTONBOX_SPREAD:
            return .spread
        case GTK_BUTTONBOX_EDGE:
            return .edge
        case GTK_BUTTONBOX_START:
            return .start
        case GTK_BUTTONBOX_END:
            return .end
        case GTK_BUTTONBOX_CENTER:
            return .center
        case GTK_BUTTONBOX_EXPAND:
            return .expand
        default:
            return nil
        }
    }
}
