import CGtk

/// Used to change the appearance of an outline typically provided by a `GtkFrame`.
///
/// Note that many themes do not differentiate the appearance of the various shadow types: Either their is no visible shadow (`GTK_SHADOW_NONE`), or there is (any other value).
/// 
/// https://docs.gtk.org/gtk3/enum.ShadowType.html
public enum ShadowType {
    /// No outline.
    case none

    /// The outline is bevelled inwards.
    case `in`

    /// The outline is bevelled outwards like a button.
    case out

    /// The outline has a sunken 3d appearance.
    case etchedIn

    /// The outline has a raised 3d appearance.
    case etchedOut

    func toGtkShadowType() -> GtkShadowType {
        switch self {
        case .none:
            return GTK_SHADOW_NONE
        case .in:
            return GTK_SHADOW_IN
        case .out:
            return GTK_SHADOW_OUT
        case .etchedIn:
            return GTK_SHADOW_ETCHED_IN
        case .etchedOut:
            return GTK_SHADOW_ETCHED_OUT
        }
    }
}

extension GtkShadowType {
    func toShadowType() -> ShadowType? {
        switch self {
        case GTK_SHADOW_NONE:
            return ShadowType.none
        case GTK_SHADOW_IN:
            return .in
        case GTK_SHADOW_OUT:
            return .out
        case GTK_SHADOW_ETCHED_IN:
            return .etchedIn
        case GTK_SHADOW_ETCHED_OUT:
            return .etchedOut
        default:
            return nil
        }
    }
}
