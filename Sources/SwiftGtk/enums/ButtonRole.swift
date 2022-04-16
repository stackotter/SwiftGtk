import CGtk

/// The role specifies the desired appearance of a `GtkModelButton`.
///
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.ButtonRole.html)
public enum ButtonRole {
    /// A plain button.
    case normal
    /// A check button.
    case check
    /// A radio button.
    case radio

    func toGtkAlign() -> GtkButtonRole {
        switch self {
        case .normal:
            return GTK_BUTTON_ROLE_NORMAL
        case .check:
            return GTK_BUTTON_ROLE_CHECK
        case .radio:
            return GTK_BUTTON_ROLE_RADIO
        }
    }
}

extension GtkButtonRole {
    func toButtonRole() -> ButtonRole {
        switch self {
        case GTK_BUTTON_ROLE_NORMAL:
            return .normal
        case GTK_BUTTON_ROLE_CHECK:
            return .check
        case GTK_BUTTON_ROLE_RADIO:
            return .radio
        default:
            fatalError("Unexpected enum value")
        }
    }
}
