import CGtk

/// Used to dictate the style that a `GtkButtonBox` uses to layout the buttons it contains.
///
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.ButtonBoxStyle.html)
public enum ButtonBoxStyle {
    /// Buttons are evenly spread across the box.
    case spread
    /// Buttons are placed at the edges of the box.
    case edge
    /// Buttons are grouped towards the start of the box, (on the left for a HBox, or the top for a VBox).
    case start
    /// Buttons are grouped towards the end of the box, (on the right for a HBox, or the bottom for a VBox).
    case end
    /// Buttons are centered in the box. Since 2.12.
    case center
    /// Buttons expand to fill the box. This entails giving buttons a “linked” appearance, making button sizes homogeneous, and setting spacing to 0 (same as calling gtk_box_set_homogeneous() and gtk_box_set_spacing() manually). Since 3.12.
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
    func toButtonBoxStyle() -> ButtonBoxStyle {
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
            fatalError("Unsupported GtkButtonBoxStyle enum value: \(self.rawValue)")
        }
    }
}
