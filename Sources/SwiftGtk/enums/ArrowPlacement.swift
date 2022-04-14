import CGtk

/// Used to specify the placement of scroll arrows in scrolling menus.
///
/// https://docs.gtk.org/gtk3/enum.ArrowPlacement.html
public enum ArrowPlacement {
    /// Place one arrow on each end of the menu.
    case both

    /// Place both arrows at the top of the menu.
    case start

    /// Place both arrows at the bottom of the menu.
    case end

    func toGtkArrowPlacement() -> GtkArrowPlacement {
        switch self {
        case .both:
            return GTK_ARROWS_BOTH
        case .start:
            return GTK_ARROWS_START
        case .end:
            return GTK_ARROWS_END
        }
    }
}

extension GtkArrowPlacement {
    func toArrowPlacement() -> ArrowPlacement? {
        switch self {
        case GTK_ARROWS_BOTH:
            return .both
        case GTK_ARROWS_START:
            return .start
        case GTK_ARROWS_END:
            return .end
        default:
            return nil
        }
    }
}
