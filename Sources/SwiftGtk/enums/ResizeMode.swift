import CGtk

/// [Gtk docs](https://docs.gtk.org/gtk3/enum.ResizeMode.html)
public enum ResizeMode {
    /// Pass resize request to the parent.
    case parent
    /// Queue resizes on this widget.
    case queue
    /// Resize immediately. Deprecated.
    case immediate

    func toGtkResizeMode() -> GtkResizeMode {
        switch self {
        case .parent:
            return GTK_RESIZE_PARENT
        case .queue:
            return GTK_RESIZE_QUEUE
        case .immediate:
            return GTK_RESIZE_IMMEDIATE
        }
    }
}

extension GtkResizeMode {
    func toResizeMode() -> ResizeMode {
        switch self {
        case GTK_RESIZE_PARENT:
            return .parent
        case GTK_RESIZE_QUEUE:
            return .queue
        case GTK_RESIZE_IMMEDIATE:
            return .immediate
        default:
            fatalError("Unexpected enum value")
        }
    }
}
