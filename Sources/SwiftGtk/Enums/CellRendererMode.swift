import CGtk

/// Identifies how the user can interact with a particular cell.
/// 
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.CellRendererMode.html)
public enum CellRendererMode {
    /// The cell is just for display and cannot be interacted with. Note that this doesn’t mean that eg. the row being drawn can’t be selected — just that a particular element of it cannot be individually modified.
    case inert
    /// The cell can be clicked.
    case activatable
    /// The cell can be edited or otherwise modified.
    case editable

    func toGtkCellRendererMode() -> GtkCellRendererMode {
        switch self {
        case .inert:
            return GTK_CELL_RENDERER_MODE_INERT
        case .activatable:
            return GTK_CELL_RENDERER_MODE_ACTIVATABLE
        case .editable:
            return GTK_CELL_RENDERER_MODE_EDITABLE
        }
    }
}

extension GtkCellRendererMode {
    func toCellRendererMode() -> CellRendererMode {
        switch self {
        case GTK_CELL_RENDERER_MODE_INERT:
            return .inert
        case GTK_CELL_RENDERER_MODE_ACTIVATABLE:
            return .activatable
        case GTK_CELL_RENDERER_MODE_EDITABLE:
            return .editable
        default:
            fatalError("Unsupported GtkCellRendererMode enum value: \(self.rawValue)")
        }
    }
}
