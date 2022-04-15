import CGtk

/// Indicated the relief to be drawn around a `GtkButton`.
/// 
/// https://docs.gtk.org/gtk3/enum.ReliefStyle.html
public enum ReliefStyle {
    /// Draw a normal relief.
    case normal

    /// A half relief. Deprecated in 3.14, does the same as GTK_RELIEF_NORMAL.
    case half

    /// No relief.
    case none

    func toGtkReliefStyle() -> GtkReliefStyle {
        switch self {
        case .normal:
            return GTK_RELIEF_NORMAL
        case .half:
            return GTK_RELIEF_HALF
        case .none:
            return GTK_RELIEF_NONE
        }
    }
}

extension GtkReliefStyle {
    func toReliefStyle() -> ReliefStyle? {
        switch self {
        case GTK_RELIEF_NORMAL:
            return .normal
        case GTK_RELIEF_HALF:
            return .half
        case GTK_RELIEF_NONE:
            return ReliefStyle.none
        default:
            return nil
        }
    }
}
