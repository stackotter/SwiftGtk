import CGtk

/// Used to specify the style of the expanders drawn by a `GtkTreeView`.
/// 
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.ExpanderStyle.html)
public enum ExpanderStyle {
    /// The style used for a collapsed subtree.
    case collapsed
    /// The style used for a collapsed subtree.
    case semiCollapsed
    /// Intermediate style used during animation.
    case semiExpanded
    /// The style used for an expanded subtree.
    case expanded

    func toGtkExpanderStyle() -> GtkExpanderStyle {
        switch self {
        case .collapsed:
            return GTK_EXPANDER_COLLAPSED
        case .semiCollapsed:
            return GTK_EXPANDER_SEMI_COLLAPSED
        case .semiExpanded:
            return GTK_EXPANDER_SEMI_EXPANDED
        case .expanded:
            return GTK_EXPANDER_EXPANDED
        }
    }
}

extension GtkExpanderStyle {
    func toExpanderStyle() -> ExpanderStyle {
        switch self {
        case GTK_EXPANDER_COLLAPSED:
            return .collapsed
        case GTK_EXPANDER_SEMI_COLLAPSED:
            return .semiCollapsed
        case GTK_EXPANDER_SEMI_EXPANDED:
            return .semiExpanded
        case GTK_EXPANDER_EXPANDED:
            return .expanded
        default:
            fatalError("Unexpected enum value")
        }
    }
}
