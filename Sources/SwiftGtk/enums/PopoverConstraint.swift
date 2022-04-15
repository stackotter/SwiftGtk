import CGtk

/// Describes constraints to positioning of popovers. More values may be added to this enumeration in the future.
/// 
/// https://docs.gtk.org/gtk3/enum.PopoverConstraint.html
public enum PopoverConstraint {
    /// Don’t constrain the popover position beyond what is imposed by the implementation.
    case none

    /// Constrain the popover to the boundaries of the window that it is attached to.
    case window

    func toGtkPopoverConstraint() -> GtkPopoverConstraint {
        switch self {
        case .none:
            return GTK_POPOVER_CONSTRAINT_NONE
        case .window:
            return GTK_POPOVER_CONSTRAINT_WINDOW
        }
    }
}

extension GtkPopoverConstraint {
    func toPopoverConstraint() -> PopoverConstraint? {
        switch self {
        case GTK_POPOVER_CONSTRAINT_NONE:
            return PopoverConstraint.none
        case GTK_POPOVER_CONSTRAINT_WINDOW:
            return .window
        default:
            return nil
        }
    }
}
