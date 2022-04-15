import CGtk

/// Used to customize the appearance of a `GtkToolbar`. Note that setting the toolbar style overrides the user’s preferences for the default toolbar style. Note that if the button has only a label set and `GTK_TOOLBAR_ICONS` is used, the label will be visible, and vice versa.
/// 
/// https://docs.gtk.org/gtk3/enum.ToolbarStyle.html
public enum ToolbarStyle {
    /// Buttons display only icons in the toolbar.
    case icons

    /// Buttons display only text labels in the toolbar.
    case text

    /// Buttons display text and icons in the toolbar.
    case both

    /// Buttons display icons and text alongside each other, rather than vertically stacked.
    case bothHorizontal

    func toGtkToolbarStyle() -> GtkToolbarStyle {
        switch self {
        case .icons:
            return GTK_TOOLBAR_ICONS
        case .text:
            return GTK_TOOLBAR_TEXT
        case .both:
            return GTK_TOOLBAR_BOTH
        case .bothHorizontal:
            return GTK_TOOLBAR_BOTH_HORIZ
        }
    }
}

extension GtkToolbarStyle {
    func toToolbarStyle() -> ToolbarStyle? {
        switch self {
        case GTK_TOOLBAR_ICONS:
            return .icons
        case GTK_TOOLBAR_TEXT:
            return .text
        case GTK_TOOLBAR_BOTH:
            return .both
        case GTK_TOOLBAR_BOTH_HORIZ:
            return .bothHorizontal
        default:
            return nil
        }
    }
}
