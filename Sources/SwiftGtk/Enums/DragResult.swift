import CGtk

/// Gives an indication why a drag operation failed. The value can by obtained by connecting to the `GtkWidget::drag-failed` signal.
///
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.DragResult.html)
public enum DragResult {
    /// The drag operation was successful.
    case success
    /// No suitable drag target.
    case noTarget
    /// The user cancelled the drag operation.
    case userCancelled
    /// The drag operation timed out.
    case timeoutExpired
    /// The pointer or keyboard grab used for the drag operation was broken.
    case grabBroken
    /// The drag operation failed due to some unspecified error.
    case error

    func toGtkDragResult() -> GtkDragResult {
        switch self {
        case .success:
            return GTK_DRAG_RESULT_SUCCESS
        case .noTarget:
            return GTK_DRAG_RESULT_NO_TARGET
        case .userCancelled:
            return GTK_DRAG_RESULT_USER_CANCELLED
        case .timeoutExpired:
            return GTK_DRAG_RESULT_TIMEOUT_EXPIRED
        case .grabBroken:
            return GTK_DRAG_RESULT_GRAB_BROKEN
        case .error:
            return GTK_DRAG_RESULT_ERROR
        }
    }
}

extension GtkDragResult {
    func toDragResult() -> DragResult {
        switch self {
        case GTK_DRAG_RESULT_SUCCESS:
            return .success
        case GTK_DRAG_RESULT_NO_TARGET:
            return .noTarget
        case GTK_DRAG_RESULT_USER_CANCELLED:
            return .userCancelled
        case GTK_DRAG_RESULT_TIMEOUT_EXPIRED:
            return .timeoutExpired
        case GTK_DRAG_RESULT_GRAB_BROKEN:
            return .grabBroken
        case GTK_DRAG_RESULT_ERROR:
            return .error
        default:
            fatalError("Unsupported GtkDragResult enum value: \(self.rawValue)")
        }
    }
}
